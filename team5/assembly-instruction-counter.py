number_of_commands = {}
f = open("sunflower-output.txt","r")
for line in f:
    if "EX" in line:
        command = line[ line.index("[") + 1 : line.index("]")]
        number_of_commands[command] = number_of_commands.get(command,0) + 1
print(number_of_commands)
f.close()
