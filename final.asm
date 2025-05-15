	;; Connor Schuetz
	;; 0830 - 0945 Monday / Wednesday
	;; 5/13

section .data
	inputBuf db 0x83, 0x6A, 0x88, 0xDE, 0x9A, 0xC3, 0x54, 0x9A
	inputNum db 8 		; Number of inputs

section .bss
	outputBuf resb 80 	;Reserves 80 bytes

section .text
	global _start

_start:

next_Num:
        cmp ebx, [inputNum]       ;Checks if we have compared all numbers
        jge newline                 ;Jumps to end when done with all nums

        mov al, [inputBuf + ebx]
        mov ah, al           ;Copies the byte

        shr al, 4              ;Shifts right 4
        call convert            ;Call to convert bits 8 - 5
        mov [outputBuf + edx], al  ; Puts the converted byte on the output
        inc edx                      ;edx needs to be incremented

        mov al, ah           ;Resets the byte to original state
        and al, 0x0F           ;Masks 8 - 5 bits to only 4 - 1 remain
        call convert            ;Converts the second half of byte
        mov [outputBuf + edx], al ; adds the remaining part of byte to output
        inc edx                     ;increment edx to go to next spot

        inc ebx                 ;Increment ebx to show we went through a byte
        cmp ebx, inputNum       ;Checks to see if last input done
        jge next_Num             ;Won't add space if last num
        mov byte [outputBuf + edx], ' ' ;Adds space to output
        inc edx                         ;increment to account for space
        jmp next_Num                    ;Loop restarts

newline:
        mov byte [outputBuf + edx], 10 ;10 = newline in ASCII
        inc edx                        ;Increment to account for newline

print:
        mov eax, 4              ;sys_write
        mov ebx, 1              ;stdout
        mov ecx, outputBuf      ;adress of the output
        mov edx, edx            ;num of bytes
        int 0x80
	
	mov eax, 1		;system exit
	int 0x80
	
convert:
	cmp al, 9
	jbe .dig		;if the num < 9 its a digit convert
	add al, 55 		;Offsets the digit
	ret			;returns

.dig:
	add al, 48 		; 0 = ASCII 48
	ret 			;returns
	
