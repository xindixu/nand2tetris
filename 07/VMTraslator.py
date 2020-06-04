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
            elif line.startswith('push') or line.startswith('pop'):
                self.parsePushPop(line)
            else:
                self.parseArithmetic(line)

        print(self.parsed)

    def cleanUpLine(self, line):
        return line.split('//', 1)[0].strip()

    def parsePushPop(self, line):
        arr = line.split(' ')

        self.parsed.append({
            'type': 'C_PUSH' if arr[0] == 'push' else 'C_POP',
            'arg1': arr[1],
            'arg2': arr[2]
        })

    def parseArithmetic(self, line):
        self.parsed.append({
            'type': 'C_ARITHMETIC',
            'arg1': line
        })


class Translator:
    def __init__(self, instructions):
        self.instructions = instructions

    def translate(self):
        pass


def main():
    pathToFile = sys.argv[1]
    file = open(pathToFile, 'r')
    instructions = Parser(file).parse()
    assembly = Translator(instructions).translate()
    # pathToOutputFile = pathToFile.split('.')[0]
    # try:
    #     outputFile = open(f"{pathToOutputFile}.asm", 'x')
    # except FileExistsError:
    #     outputFile = open(f"{pathToOutputFile}.asm", "w")
    # outputFile.writelines(assembly)


main()
