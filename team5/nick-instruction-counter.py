import re

#Define the location of the output of sunflower, a text file can be created from the terminal for this
file_name = "test_instruction_read.txt"
sunflower_output = "sunflower/benchmarks/source/riscv_bubblesort/sunflower-output.txt"

"""
A function which takes the location of a log file from the output of the sunflower simulator
and counts the number of invocations of all of the assembly instructions used in the program
"""
def count(location):

    #read the content of the file
    content = file.readlines()
    file.close()
    #initialise a list which will be used to store the instructions only
    instructions = []

    #Read line by line and record the instructions implemented
    for line in content:
        if line[0:2] =="EX":
            isolate = re.search("\[\w+\]",line)
            instructions.append(line[isolate.span()[0]+1 : isolate.span()[1]-1])

    dictionary = {}
    for instruction in instructions:
        if instruction not in dictionary:
            dictionary[instruction] = 0
        else:
            dictionary[instruction] +=1
    return dictionary

print(count("../"+file_name))
