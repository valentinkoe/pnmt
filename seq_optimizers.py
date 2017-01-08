import theano
import theano.tensor as T
import numpy as np

"""
implementations of sequential algorithms with a common signature

    optimizer(learning_rate, theano_params, gradients, list_of_inputs, cost)

returning two functions 'f_grad_shared' computing the gradients and preparing
the update and 'f_update' to eventually apply this update

to preserve the same interface, 'on_unused_input="ignore"' is set as parameter
for 'f_update' for algorithms that do not require an initial learning rate
"""


def sgd(lr, tparams, grads, inp, cost):
    gshared = [theano.shared(np.zeros_like(p.get_value()), name="{}_grad".format(k))
               for k, p in tparams.items()]
    gsup = list(zip(gshared, grads))

    f_grad_shared = theano.function(inp, cost, updates=gsup)

    pup = [(p, p - lr * g) for p, g in zip(tparams.values(), gshared)]
    f_update = theano.function([lr], [], updates=pup)

    return f_grad_shared, f_update


def adagrad(lr, tparams, grads, inp, cost):
    zipped_grads = [theano.shared(np.zeros_like(p.get_value()), name="{}_grad".format(pname))
                    for pname, p in tparams.items()]
    accumulated_grads = [theano.shared(np.zeros_like(p.get_value()), name="{}_grad".format(pname))
                         for pname, p in tparams.items()]

    zgup = list(zip(zipped_grads, grads))
    agup = [(rg, rg + (g ** 2)) for rg, g in zip(accumulated_grads, grads)]

    f_grad_shared = theano.function(inp, cost, updates=zgup+agup,)

    param_up = [(p, p - ((lr/T.sqrt(ag+.00001))*g))
                for p, g, ag in zip(tparams.values(), zipped_grads, accumulated_grads)]

    f_update = theano.function([lr], [], updates=param_up)

    return f_grad_shared, f_update


def adam(lr, tparams, grads, inp, cost):
    gshared = [theano.shared(np.zeros_like(p.get_value(), dtype=theano.config.floatX),
                             name="{}_grad".format(k))
               for k, p in tparams.items()]
    gsup = list(zip(gshared, grads))

    f_grad_shared = theano.function(inp, cost, updates=gsup)

    lr0 = 0.0002
    b1 = 0.1
    b2 = 0.001
    e = 1e-8

    updates = []

    i = theano.shared(np.array(0., dtype=theano.config.floatX))
    i_t = i + 1.
    fix1 = 1. - b1**i_t
    fix2 = 1. - b2**i_t
    lr_t = lr0 * (T.sqrt(fix2) / fix1)

    for p, g in zip(tparams.values(), gshared):
        m = theano.shared(p.get_value() * 0.)
        v = theano.shared(p.get_value() * 0.)
        m_t = (b1 * g) + ((1. - b1) * m)
        v_t = (b2 * T.sqr(g)) + ((1. - b2) * v)
        g_t = m_t / (T.sqrt(v_t) + e)
        p_t = p - (lr_t * g_t)
        updates.append((m, m_t))
        updates.append((v, v_t))
        updates.append((p, p_t))
    updates.append((i, i_t))

    f_update = theano.function([lr], [], updates=updates, on_unused_input="ignore")

    return f_grad_shared, f_update


def adadelta(lr, tparams, grads, inp, cost):
    zipped_grads = [theano.shared(np.zeros_like(p.get_value()), name="{}_grad".format(k))
                    for k, p in tparams.items()]
    running_up2 = [theano.shared(np.zeros_like(p.get_value()), name="{}_rup2".format(k))
                   for k, p in tparams.items()]
    running_grads2 = [theano.shared(np.zeros_like(p.get_value()), name="{}_rgrad2".format(k))
                      for k, p in tparams.items()]

    zgup = list(zip(zipped_grads, grads))
    rg2up = [(rg2, 0.95 * rg2 + 0.05 * (g ** 2))
             for rg2, g in zip(running_grads2, grads)]

    f_grad_shared = theano.function(inp, cost, updates=zgup+rg2up)

    updir = [-T.sqrt(ru2 + 1e-6) / T.sqrt(rg2 + 1e-6) * zg
             for zg, ru2, rg2 in zip(zipped_grads, running_up2,
                                     running_grads2)]
    ru2up = [(ru2, 0.95 * ru2 + 0.05 * (ud ** 2))
             for ru2, ud in zip(running_up2, updir)]
    param_up = [(p, p + ud) for p, ud in zip(tparams.values(), updir)]

    f_update = theano.function([lr], [], updates=ru2up+param_up, on_unused_input="ignore")

    return f_grad_shared, f_update


def rmsprop(lr, tparams, grads, inp, cost):
    zipped_grads = [theano.shared(np.zeros_like(p.get_value()), name="{}_grad".format(k))
                    for k, p in tparams.items()]
    running_grads = [theano.shared(np.zeros_like(p.get_value()), name="{}_rgrad".format(k))
                     for k, p in tparams.items()]
    running_grads2 = [theano.shared(np.zeros_like(p.get_value()), name="{}_rgrad2".format(k))
                      for k, p in tparams.items()]

    zgup = list(zip(zipped_grads, grads))
    rgup = [(rg, 0.95 * rg + 0.05 * g) for rg, g in zip(running_grads, grads)]
    rg2up = [(rg2, 0.95 * rg2 + 0.05 * (g ** 2))
             for rg2, g in zip(running_grads2, grads)]

    f_grad_shared = theano.function(inp, cost, updates=zgup+rgup+rg2up)

    updir = [theano.shared(np.zeros_like(p.get_value()), name="{}_updir".format(k))
             for k, p in tparams.items()]
    updir_new = [(ud, 0.9 * ud - 1e-4 * zg / T.sqrt(rg2 - rg ** 2 + 1e-4))
                 for ud, zg, rg, rg2 in zip(updir, zipped_grads, running_grads,
                                            running_grads2)]
    param_up = [(p, p + udn[1])
                for p, udn in zip(tparams.values(), updir_new)]
    f_update = theano.function([lr], [], updates=updir_new+param_up, on_unused_input="ignore")

    return f_grad_shared, f_update
