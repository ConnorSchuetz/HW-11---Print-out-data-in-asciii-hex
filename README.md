# HW-11---Print-out-data-in-asciii-hex

How To compile: ;
nasm -f elf32 -g -F dwarf -o final.o final.asm .
ld -m elf_i386 -o final final.o .
./final .
