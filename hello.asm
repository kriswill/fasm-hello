format ELF64 executable 3

entry start

; Syscall constants
SYS_WRITE equ 1
SYS_EXIT  equ 60

; Syscall macro
macro syscall number, arg1, arg2, arg3
{
    mov rax, number
    mov rdi, arg1
    mov rsi, arg2
    mov rdx, arg3
    syscall
}

segment readable executable

start:
    ; write "Hello, World!" to stdout
    syscall SYS_WRITE, 1, message, message_length

    ; exit program
    syscall SYS_EXIT, 0, 0, 0

segment readable writeable

message db 'Hello, World!', 10 ; 10 is a newline character
message_length = $ - message
