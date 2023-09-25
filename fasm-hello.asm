format ELF64 executable 3

SYS_WRITE equ 1
SYS_EXIT  equ 60
ENDL      equ 10

macro syscall number, arg1, arg2, arg3
{
  mov rax, number
  mov rdi, arg1
  mov rsi, arg2
  mov rdx, arg3
  syscall
}

; == start of program ==
segment readable executable
entry main

main:
  syscall SYS_WRITE, 1, message, message_length
  syscall SYS_EXIT, 0, 0, 0

; == data segment ==
segment readable writeable

message db 'Hello, World!', ENDL
message_length = $ - message
