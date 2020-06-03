import sys

class Parser:
    def __init__(self, file):
        self.file = file
        self.parsed = []

    def parse(self):
        lines = self.file.readlines()
        for line in lines:
            line = self.cleanUpLine(line)
            if len(line) == 0:
                continue
            elif line.startswith('@'):
                self.parseAInstruction(line)
            else:
                self.parseCInstruction(line)
        return self.parsed

    def cleanUpLine(self, line):
        return line.split('//', 1)[0].strip()

    def parseAInstruction(self, aInstruction):
        value = aInstruction.split('@')[1]
        self.parsed.append({
            'type': 'a',
            'value': value
        })

    def parseCInstruction(self, cInstruction):
        if not '=' in cInstruction:
            cInstruction = 'null=' + cInstruction
        if not ';' in cInstruction:
            cInstruction = cInstruction + ';null'

        dest = cInstruction.split('=')[0].replace(" ", "")
        comp = cInstruction.split('=')[1].split(';')[0].replace(" ", "")
        jump = cInstruction.split(';')[1].replace(" ", "")

        self.parsed.append({
            'type': 'c',
            'dest': dest,
            'comp': comp,
            'jump': jump
        })


class Translator:
    def __init__(self, instructions):
        self.instructions = instructions

    def translate(self):
        for instruction in self.instructions:
            if instruction['type'] == 'a':
                self.translateAInstruction(instruction)
            else:
                self.translateCInstruction(instruction)

    def translateAInstruction(self, aInstruction):
        print(aInstruction)

    def translateCInstruction(self, cInstruction):
        print(cInstruction)


class SymbolTable:
    def __init__(self):
        print('init SymbolTable')


def main():
    filename = sys.argv[1]
    file = open(filename, 'r')
    instructions = Parser(file).parse()
    translated = Translator(instructions).translate()


main()
