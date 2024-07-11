section .data
unicode db 0x30A1 ; This is the Unicode value for first Katakana character - 'ァ' in hexadecimal
katakana db 'KatakanaEquivalent', 0 ; Placeholder string matching to the Katakana character

section .text
global _start

_compare:
; Compare received Unicode with known value
    cmp [unicode], 0x30A1 ; compare unicode with the katakana unicode
    jne _exit

; If match found, load the matching Katakana string
    lea rdx, [katakana]

_exit:
    ; Exit the process
    mov eax, 0x60 ; syscall number for sys_exit
    xor edi, edi ; error code 0
    syscall ; perform system call
