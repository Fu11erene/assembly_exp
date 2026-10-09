        include masm32rt.inc
        include jikken_macro.asm

        .data?
var1    dd ?

        .data
var2    db  80h
var3    dd  123456789
fmt     db  'result = %d', 13, 10, 0

        .const
C1      dw 1000

        .code
start:
        mov var1, 987654321
        mov eax, 0
        mov ebx, 0

        mov ah, var2
        mov bx, C1
        mov ecx, var3
        mov edx, var1

        sub edx, ecx
        dump_registerh
        dump_register8h
        dump_register16h
        invoke crt_printf, OFFSET fmt, edx
        dump_registerh
        dump_register8h
        dump_register16h

        exit
end start
