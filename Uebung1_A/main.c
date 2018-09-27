#include <stdio.h>

void printNumbersGoto(int i);

void printNumbersFor(int i);

void printNumbersRecursiveFunction(int i);

int main() {

    printNumbersGoto(7);
    printf("= printNumbersGoto(7)\n");
    printNumbersFor(7);
    printf("= printNumbersFor(7)\n");
    printNumbersRecursiveFunction(7);
    printf("= printNumbersRecursiveFunction(7)\n");


    return 0;
}

void printNumbersGoto(int n){
    int count = 0;

    start:
    if(count == n) printf("%i ", count);
    else {
        printf("%i ", count);
        count++;
        goto start;
    }
}

void printNumbersFor(int n) {
    for (int i = 0; i <= n; ++i) {
        printf("%i ", i);
    }
}

void printNumbersRecursiveFunction(int n) {
    if(n < 0) return;

    printNumbersRecursiveFunction(n - 1);
    printf("%i ", n);
}