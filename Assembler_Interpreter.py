import os.path

instructionDict = {
    # Block 1: Instructions on registers or constants kk/pp/ss (6 bits). Starting with 0, ending with ?.
    # The ? is replaced by a 1, if the instruction contains a constant, else it is replaced with 00 or 01.
    "ADD": "00000?", "ADDCY": "00001?", "SUB": "00010?", "SUBCY": "00011?",
    "AND": "00100?", "OR": "00101?", "XOR": "00110?",
    "LOAD": "00111?", "STORE": "01000?", "FETCH": "01001?", "OUTPUT": "01010?", "INPUT": "01011?", "TEST": "01100?",
    # Block 2: Instructions on 12 bits constants aaa. Starting with 10.
    "CALL": "100001", "CALLC": "100010", "CALLNC": "100011", "CALLNZ": "100100", "CALLZ": "100101", "COMPARE": "100110",
    "JUMP": "100111", "JUMPC": "101000", "JUMPNC": "101001", "JUMPNZ": "101010", "JUMPZ": "101011",
    # Block 3: Instructions on only one register and return instructions. Starting with 11.
    "RETURN": "111010", "RETURNC": "111011", "RETURNNC": "111100", "RETURNZ": "111101", "RETURNNZ": "111110",
    "RL": "110000", "RR": "110001", "SL0": "110010", "SL1": "110011",
    "SLA": "110100", "SLX": "110101", "SR0": "110110", "SR1": "110111", "SRA": "111000", "SRX": "111001"}

registerDict = {
    "x1": "000001", "x2": "000010", "x3": "000011", "x4": "000100", "x5": "000101",
    "x6": "000110", "x7": "000111", "x8": "001000", "x9": "001001", "x10": "001010",
    "x11": "001011", "x12": "001100", "x13": "001101", "x14": "001110", "x15": "001111", "x16": "010000"}


def interpredAssembler(assemblerFileLocation, instructionsFileLocation):
    """
    This function takes the location of a file containing assembler code and converts it into mchinecode.
    The machinecode is written to a new file at the specified location.
    Each line in the assembler file should have one of the following structures:
    1. Instruction register1, register2; //comment
    2. Instruction register, constant; //comment
    3. Instruction register; //comment
    4. Instruction; //comment
    The comments startet wit a "//", the "," aswell as the ";" are optional.

    """
    f = open(assemblerFileLocation, "r")
    lines = f.readlines()
    f.close()
    instructions = []
    current_line = 0
    for line in lines:
        line = line.replace(",", "").replace(";", "").split("//")[0].split()
        current_line += 1
        if len(line) == 1:
            try:
                instructions.append(instructionDict[line[0]] + "000000000000")
            except KeyError:
                print("Error in line {} {}, not a valid instruction!".format(current_line, line))
                exit(0)
        if len(line) == 2:
            try:
                opcode = instructionDict[line[0]]
                if registerDict.__contains__(line[1]):
                    value = registerDict[line[1]] + "000000"
                else:
                    value = f"{int(line[1]):012b}"
                    if len(value) > 12:
                        print("Error in line {} {}, number to big!".format(current_line, line))
                        exit(0)
                instructions.append(opcode + str(value))
            except (KeyError, ValueError):
                print("Error in line {} {}, not a valid instruction or number!".format(current_line, line))
                exit(0)
        elif len(line) == 3:
            try:
                if registerDict.__contains__(line[2]):
                    opcode = instructionDict[line[0]].replace("?", "0")
                    value1 = registerDict[line[1]]
                    value2 = registerDict[line[2]]
                else:
                    opcode = instructionDict[line[0]].replace("?", "1")
                    value1 = registerDict[line[1]]
                    value2 = f"{int(line[2]):06b}"
                    if len(value2) > 6:
                        print("Error in line {} {}, number to big!".format(current_line, line))
                        exit(0)
                instructions.append(opcode + str(value1) + str(value2))
            except (KeyError, ValueError):
                print("Error in line {} {}, not a valid instruction, register or number!".format(current_line, line))
                exit(0)

    with open(instructionsFileLocation, "w") as f:
        for instruction in instructions:
            f.write(instruction)
            f.write("\n")
        f.close()
    print("Successfully wrote instructions to", os.path.abspath(instructionsFileLocation))


interpredAssembler("Assembler.txt", "Instructions.txt")
