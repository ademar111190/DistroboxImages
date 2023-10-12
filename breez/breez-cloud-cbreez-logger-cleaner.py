#!/bin/env python3
# how to use:
# breez-cloud-cbreez-logger-cleaner.py file.log tagToRemove1 tagToRemove2
# e.g.
# breez-cloud-cbreez-logger-cleaner.py 1697034119260.log BreezSdk

import sys


class Main:
    def __init__(self, argv):
        self.skipped_lines = 0
        self.merged_lines = 0
        self.file = argv[1]
        self.tags_to_remove = []
        for i in range(2, len(argv)):
            self.tags_to_remove.append("[" + argv[i] + "]")

    def should_add(self, entry):
        for tag in self.tags_to_remove:
            if entry.startswith(tag):
                return False
        return True

    def write_previous_line(self, out_file, line_to_write):
        if len(line_to_write) > 0:
            if self.should_add(line_to_write):
                out_file.write(line_to_write.replace('\n', ' ') + '\n')
            else:
                self.skipped_lines = self.skipped_lines + 1

    def run(self):
        with open(self.file) as f:
            with open(self.file + ".filtered", "w") as output_file:
                line = ""
                for rl in f.readlines():
                    if rl.startswith("["):
                        self.write_previous_line(output_file, line)
                        line = rl
                    else:
                        line = line + rl
                        self.merged_lines = self.merged_lines + 1
                self.write_previous_line(output_file, line)
        print("Merged lines: " + str(self.merged_lines))
        print("Skipped lines: " + str(self.skipped_lines))
        print("Done 🍻")


if __name__ == '__main__':
    Main(sys.argv).run()
