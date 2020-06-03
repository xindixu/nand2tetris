import sys

# c-instruction
comp = {
    "0": "0101010",
    "1": "0111111",
    "-1": "0111010",
    "D": "0001100",
    "A": "0110000",
    "!D": "0001101",
    "!A": "0110001",
    "-D": "0001111",
    "-A": "0110011",
    "D+1": "0011111",
    "A+1": "0110111",
    "D-1": "0001110",
    "A-1": "0110010",
    "D+A": "0000010",
    "D-A": "0010011",
    "A-D": "0000111",
    "D&A": "0000000",
    "D|A": "0010101",
    "M": "1110000",
    "!M": "1110001",
    "-M": "1110011",
    "M+1": "1110111",
    "M-1": "1110010",
    "D+M": "1000010",
    "D-M": "1010011",
    "M-D": "1000111",
    "D&M": "1000000",
    "D|M": "1010101"
}

dest = {
    "null": "000",
    "M": "001",
    "D": "010",
    "A": "100",
    "MD": "011",
    "AM": "101",
    "AD": "110",
    "AMD": "111"
}

jump = {
    "null": "000",
    "JGT": "001",
    "JEQ": "010",
    "JGE": "011",
    "JLT": "100",
    "JNE": "101",
    "JLE": "110",
    "JMP": "111"
}

# built in symbols
builtIn = {
    "SP": 0,
    "LCL": 1,
    "ARG": 2,
    "THIS": 3,
    "THAT": 4,
    "SCREEN": 16384,
    "KBD": 24576,
}


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
        self.binary = []

    def translate(self):
        for instruction in self.instructions:
            if instruction['type'] == 'a':
                self.translateAInstruction(instruction)
            else:
                self.translateCInstruction(instruction)
        return self.binary

    def translateAInstruction(self, aInstruction):
        value = "{0:016b}".format(int(aInstruction['value']))
        self.binary.append(f"{value}\n")

    def translateCInstruction(self, cInstruction):
        code = '111'
        compCode = comp[cInstruction['comp']]
        destCode = dest[cInstruction['dest']]
        jumpCode = jump[cInstruction['jump']]
        self.binary.append(f"{code}{compCode}{destCode}{jumpCode}\n")


class SymbolTable:
    def __init__(self):
        print('init SymbolTable')


def main():
    pathToFile = sys.argv[1]
    file = open(pathToFile, 'r')
    instructions = Parser(file).parse()
    binary = Translator(instructions).translate()

    pathToOutputFile = pathToFile.split('.')[0]
    try:
      outputFile = open(f"{pathToOutputFile}.hack", "x")
    except FileExistsError:
      outputFile = open(f"{pathToOutputFile}.hack", "w")
    outputFile.writelines(binary)
main()
