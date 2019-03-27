; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
INCLUDE Irvine32.inc
;.386
;.model flat,stdcall
;.stack 4096
ExitProcess proto,dwExitCode:dword

.data
arraya DWORD 12h, 12h, 10h, 5h, 10h
randW DWORD 0
prompt Byte "XCADNSAKN", 0;
.code

main proc

Call Random32
    mov randW, eax
    mov esi, randW
    mov eax, 10h
    
Call RandomRange
Call SetTextColor

mov edx, OFFSET prompt
Call WriteString
Call Crlf
Call write
mov ecx,6 
    Call rec
	invoke ExitProcess,0
main endp

write proc
mov ecx, 10
l1: 
    mov eax, 10h
Call RandomRange
Call SetTextColor
mov edx, OFFSET prompt
Call WriteString
Call Crlf
;Call WaitMsg
Loop l1
Call WaitMsg
ret 
write endp

rec proc
Loop L3
L2:
add eax,1
L3: Loop L2
    ret
rec endp

End main