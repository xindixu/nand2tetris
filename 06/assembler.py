import sys


class Parser:
    def __init__(self, file):
        self.file = file
        self.parsed = []

    def parse(self):
        lines = self.file.readlines()
        for line in lines:
            if line.startswith('//'):
                continue
            else:
                line = self.cleanUpLine(line)
                if len(line) == 0:
                    continue
                elif line.startswith('@'):
                    self.splitAInstruction(line)
                else:
                    self.splitCInstruction(line)
        print(self.parsed)
        return self.parsed

    def cleanUpLine(self, line):
        return line.split('//', 1)[0].strip()

    def splitAInstruction(self, aInstruction):
        value = aInstruction.split('@')[1]
        self.parsed.append({
            'type': 'a',
            'value': value
        })

    def splitCInstruction(self, cInstruction):
        try:
          dest = cInstruction.split('=')[0].split(';')[0].replace(" ", "")
        except:
          dest = None

        try:
            comp = cInstruction.split('=')[1].split(';')[0].replace(" ", "")
        except:
            comp = None
        try:
            jump = cInstruction.split(';')[1].replace(" ", "")
        except:
            jump = None
        self.parsed.append({
            'type': 'c',
            'dest': dest,
            'comp': comp,
            'jump': jump
        })


class Translate:
    def __init__(self):
        print('init Translate')


class SymbolTable:
    def __init__(self):
        print('init SymbolTable')


def main():
    filename = sys.argv[1]
    file = open(filename, 'r')
    parser = Parser(file)
    parsed = parser.parse()


main()
