
__asm__ (
    ".extern ExitProcess, WriteConsoleA, GetStdHandle\n"
    "hello: .ascii \"Hello, Windows!\\n\" \n"  // String to print
    "helloLen = . - hello             \n"      // Calculate the length of the string
);

void start(void)
{


    __asm__(
        "mov rcx, -11\n"
        "call GetStdHandle\n"
        "mov rcx, rax\n"
        "lea rdx, hello[rip]\n"
        "mov r8, helloLen\n"
        "mov r9, 0\n"
        "call WriteConsoleA\n"
    );
}



void __main(void) {
    start();
}

int main() {
    __main();  // Call the custom __main function
    return 0;
}

// gcc    -masm=intel inline.c -o inline.exe -L -lkernel32