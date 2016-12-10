import numpy as np

from utils import f_open


class TextIterator:
    """
    self-resetting (Infinte) Bitext iterator, tries to group sentences of same or similar length into the same batches
    buffer is filled with sentences ordered by length and long sentences are popped out first (based on source sentence length)
    expects pre-tokenized sentences that can be split into tokens again by white spaces
    expects "eos" and "UNK" in both, input and output dictionary
    expects all lines filled, empty line denotes eof
    sentence pairs where one of the sentences exceeds maxlen are ignored!
    """

    def __init__(self, source_file, target_file,
                 source_dict, target_dict,
                 batch_size=128, maxlen=100,
                 n_words_source=-1, n_words_target=-1,
                 raw_characters=False):
        self.source = f_open(source_file, "r")
        self.target = f_open(target_file, "r")
        self.source_dict = source_dict
        self.target_dict = target_dict

        self.batch_size = batch_size
        self.maxlen = maxlen

        self.n_words_source = n_words_source
        self.n_words_target = n_words_target

        self.buffer = []
        self.max_buffer_size = batch_size * 20

        self.raw_characters = raw_characters

        self.end_of_data = False

    def __iter__(self):
        return self

    def reset(self):
        self.end_of_data = False
        self.source.seek(0)
        self.target.seek(0)

    def __next__(self):

        if self.end_of_data:
            self.reset()
            raise StopIteration

        # fill buffer, if it's empty
        if not self.buffer:
            new_buffer = []
            for _ in range(self.max_buffer_size):
                try:
                    source_line = self.source.readline()
                    target_line = self.target.readline()
                except IOError:
                    self.end_of_data = True
                    break

                if source_line == "" or target_line == "":
                    # this actually happens more often than one would think
                    break

                if self.raw_characters:
                    source_sentence = list(source_line.strip())
                    target_sentence = list(target_line.strip())
                else:
                    # sentences should already be tokenized properly such that
                    # we can split tokens by white spaces
                    source_sentence = source_line.strip().split()
                    target_sentence = target_line.strip().split()

                if len(source_sentence) > self.maxlen or len(target_sentence) > self.maxlen:
                    # encountered a too long sentence on at least one side
                    continue

                new_buffer.append((source_sentence, target_sentence))

            # did not read any lines from the file anymore
            if not new_buffer:
                self.reset()
                raise StopIteration

            # sort by length of sentences in target buffer
            self.buffer = sorted(new_buffer, key=lambda x: len(x[0]))

        sentence_pairs = []

        while self.buffer and len(sentence_pairs) < self.batch_size:

            source_s, target_s = self.buffer.pop()

            source_sent = [idx if idx < self.n_words_source else self.source_dict["UNK"]
                           for idx in [self.source_dict.get(w, self.source_dict["UNK"])
                                       for w in source_s]]
            target_sent = [idx if idx < self.n_words_target else self.target_dict["UNK"]
                           for idx in [self.target_dict.get(w, self.target_dict["UNK"])
                                       for w in target_s]]

            sentence_pairs.append((source_sent, target_sent))

        source_ss, target_ss = zip(*sentence_pairs)

        x, x_mask = self._to_matrix_with_mask(source_ss, self.maxlen, self.source_dict["eos"])
        y, y_mask = self._to_matrix_with_mask(target_ss, self.maxlen, self.target_dict["eos"])

        return x, x_mask, y, y_mask

    @staticmethod
    def _to_matrix_with_mask(list_of_lists, maxlen, default_val):
        maxlen = maxlen+1
        matr = default_val * np.ones((maxlen, len(list_of_lists)), dtype="int32")
        mask = np.zeros((maxlen, len(list_of_lists)), dtype="int32")
        for i, l in enumerate(list_of_lists):
            matr[:len(l), i] = l[:maxlen]
            mask[:len(l)+1, i] = 1
        return matr, mask
