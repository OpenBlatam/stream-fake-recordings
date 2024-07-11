section .data
    SHELL_PROTOCOL_GUID guid 8b843e20-8132-4852-90cc-551f533b7e37
    shell_protocol dq ?
    command_line db "gpg --output genomic_signature.asc --detach-sig --armor --local-user your_email@example.com genomic_data.txt", 0


section .text

Entry:
    ; The entry point function (similar to main function in C)
    entry EntryPoint, runtime_functions, COMDAT_Type, .text, Entry_End

    mov rax, gSystemTable
    mov rcx, SHELL_PROTOCOL_GUID
    call [GetProtocol]
    cmp eax, EFI_SUCCESS
    jne ErrorExit

    ; Now 'rax' contains the pointer to the EFI_SHELL_PROTOCOL interface
    mov [shell_protocol], rax

    lea r8, [command_line]
    mov rcx, [shell_protocol]
    xor edx, edx
    xor r9, r9
    call [ExecuteCommandLine]

ErrorExit:
    jmp $

Entry_End:

section .realdata
    runtime_functions {
        dw 0x0002 ; REVISION = 2
        ptr -1 ; Unload = -1
    }

section .idata
    import GetProtocol from gBS->LocateProtocol

section .idata
    import ExecuteCommandLine from EFI_SHELL_PROTOCOL->Execute

section .edata
    export EntryPoint=0
