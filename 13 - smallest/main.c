#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <float.h>

void print_value(const void* ptr, size_t size, const char* type) {
    printf("Tipo: %s\n", type);

    // Imprimir como decimal (limitado por tipo)
    if (size == sizeof(int)) {
        printf("Decimal: %d\n", *(int*)ptr);
    } else if (size == sizeof(float)) {
        printf("Decimal: %g\n", *(float*)ptr);
    } else if (size == sizeof(double)) {
        printf("Decimal: %g\n", *(double*)ptr);
    } else if (size == sizeof(char)) {
        printf("Decimal: %d\n", *(char*)ptr);
    } else {
        printf("Decimal: [no implementado para este tamaño]\n");
    }

    // Imprimir en hexadecimal (byte a byte)
    printf("Hexadecimal: 0x");
    const unsigned char* bytes = (const unsigned char*)ptr;
    for (size_t i = 0; i < size; ++i) {
        printf("%02X", bytes[i]);
    }
    printf("\n\n");
}

int main() {
    float f = 1.89;
    uint32_t min = 123863;

    printf("Valor en decimal %d\n", *(uint32_t*)&f);

    print_value(&f, sizeof(f), "float");
    return 0;
}