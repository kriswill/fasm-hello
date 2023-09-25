format ELF64 executable 3

; == constants ==
; Linux Syscalls
; see: https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#x86_64-64_bit
SYS_WRITE equ 1
SYS_EXIT  equ 60
ENDL      equ 10 ; '\n'

macro syscall number, arg1, arg2, arg3 {
  mov rax, number
  mov rdi, arg1
  mov rsi, arg2
  mov rdx, arg3
  syscall
}

macro write message, length {
  syscall SYS_WRITE, 1, message, length
}

macro exit {
  syscall SYS_EXIT, 0, 0, 0
}

; == start of program ==
segment readable executable
entry main

main:
  write message, message_length
  exit

; == data segment ==
segment readable writeable

message db 'Hello, World!', ENDL
message_length = $ - message
