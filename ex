include masm32rt.inc
        include jikken_macro.asm

        .code

count_bits proc
        mov     edx, 0        ; カウンタを 0 にする
count_loop:
        cmp     eax, 0          ; 残りのビットがすべて0なら終了
        je      count_end
        shr     eax, 1          ; 最下位ビットをCFへ押し出す
        jnc     count_loop      ; CF=0 ならカウントせず次へ
        add     edx, 1          ; CF=1 ならカウント
        jmp     count_loop
count_end:
        ret
count_bits endp

start:
        mov     eax, 110101b    ; 例: 110101 (= 53)
        dump_register           ; 呼び出し前
        call    count_bits      ; 結果は EDX に入る(4になるはず)
        dump_register           ; 呼び出し後
        exit
end start

EAX = 53, EBX = 3170304, ECX = 4198420, EDX = 4198420, ESI = 4198420, EDI = 4198420, ESP = 1769336, EBP = 1769348
EAX = 0, EBX = 3170304, ECX = 4198420, EDX = 4, ESI = 4198420, EDI = 4198420, ESP = 1769336, EBP = 1769348
