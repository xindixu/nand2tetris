import sys

operandA = 'R13'
operandB = 'R14'

arithBinaryOperator = {
    'add': '+',
    'sub': '-',
    'and': '&',
    'or': '|',
}

arithUnaryOperator = {
    'neg': '-',
    'not': '!',
}

compare = {
    'lt': 'JGE',
    'eq': 'JNE',
    'gt': 'JLE'
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
            elif line.startswith('push') or line.startswith('pop'):
                self.parsePushPop(line)
            else:
                self.parseArithmetic(line)

        return self.parsed

    def cleanUpLine(self, line):
        return line.split('//', 1)[0].strip()

    def parsePushPop(self, line):
        arr = line.split(' ')

        self.parsed.append({
            'type': 'C_PUSH' if arr[0] == 'push' else 'C_POP',
            'arg1': arr[1],
            'arg2': arr[2],
            'original': line
        })

    def parseArithmetic(self, line):
        self.parsed.append({
            'type': 'C_ARITHMETIC',
            'arg1': line,
            'original': line
        })


class Translator:
    def __init__(self, instructions):
        self.instructions = instructions
        self.assembly = []
        self.jumpFlag = 0

    def translate(self):
        for instruction in self.instructions:
            if instruction['type'] == 'C_PUSH':
                self.translatePush(instruction)
            elif instruction['type'] == 'C_POP':
                self.translatePop(instruction)
            elif instruction['type'] == 'C_ARITHMETIC':
                self.translateArithmetic(instruction)

        self.assembly.append(
            f"""\
(END)
@END
0;JMP
"""
        )
        return self.assembly

    def getAddress(self, instruction):
        if instruction['arg1'] == 'constant':
            return f"""\
@{instruction['arg2']}
D = A
"""
        else:
            return f"""\
@{instruction['arg1']}
A = M + instruction['arg2']
D = M
"""

    def push(self):
        return f"""\
@SP
A = M
M = D
@SP
M = M + 1
"""

    def pop(self, destination):
        dest = ''
        if destination:
            dest = f"""\
@{destination}
M = D
"""
        return f"""\
@SP
M = M - 1
A = M
D = M
{dest}\
"""

    def translatePush(self, instruction):
        self.assembly.append(
            f"""
// {instruction['original']}
{self.getAddress(instruction)}
{self.push()}\
"""
        )

    def translatePop(self, instruction):
        self.assembly.append(
            f"""
// {instruction['original']}
{self.pop()}
{self.getAddress(instruction)}\
"""
        )

    def translateArithmetic(self, instruction):
        operatorString = instruction['arg1']
        try:
            operator = compare[operatorString]
            self.assembly.append(f"""
// {instruction['original']}
{self.pop(operandA)}
{self.pop(operandB)}

@{operandA}
D = M
@{operandB}
D = M - D

@FALSE{self.jumpFlag}
D;{operator}

D = -1
{self.push()}

@CONTINUE{self.jumpFlag}
0;JMP

(FALSE{self.jumpFlag})
D = 0
{self.push()}
(CONTINUE{self.jumpFlag})
"""
            )
            self.jumpFlag += 1
        except:
            try:
                operator = arithBinaryOperator[operatorString]
                self.assembly.append(
                    f"""
// {instruction['original']}
{self.pop(operandA)}
{self.pop(operandB)}

@{operandA}
D = M
@{operandB}
D = M {operator} D

{self.push()}
"""
                )
            except:
                operator = arithUnaryOperator[instruction['arg1']]
                self.assembly.append(
                    f"""
// {instruction['original']}
{self.pop(operandA)}

@{operandA}
D = {operator}M

{self.push()}
"""
                )


def main():
    pathToFile = sys.argv[1]
    file = open(pathToFile, 'r')
    instructions = Parser(file).parse()
    assembly = Translator(instructions).translate()

    pathToOutputFile = pathToFile.split('.')[0]
    try:
        outputFile = open(f"{pathToOutputFile}.asm", 'x')
    except FileExistsError:
        outputFile = open(f"{pathToOutputFile}.asm", 'w')
    outputFile.writelines(assembly)


main()
