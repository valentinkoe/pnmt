import gzip


# make prefix-appended name
def get_layer_name(prefix, name):
    return '{}_{}'.format(prefix, name)


def f_open(filename, mode="r"):
    if filename.endswith(".gz"):
        return gzip.open(filename, mode)
    return open(filename, mode)
