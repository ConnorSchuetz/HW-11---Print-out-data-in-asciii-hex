# HW-11---Print-out-data-in-asciii-hex

How To compile: 

nasm -f elf32 -g -F dwarf -o final.o final.asm 

ld -m elf_i386 -o final final.o 

./final


DESCRIPTION: This program will take in inputs(bytes) and split them into two seperate characters then translate them into their apropiate ascii number, adding them into the output. Then if it is not the last caracter it adds the ascii space to output. After all are translated a ascii newline is added to the output. Then it prints the output. 


