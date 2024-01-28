#include "stdio.h"
#include "NumClass.h"

int main() {

    int num1 = 0, num2 = 0;

    while(num1 <= 0)
    scanf("%d", &num1);

    while(num2 <= 0)
    scanf("%d", &num2);

    // Run on numbers between num1 and num2
    for (int i = num1; i <= num2; ++i) 
        if(isPrime(num1))
            printf("%d is Prime" , num1);

    printf("\n");

    for (int i = num1; i <= num2; ++i) 
        if(isStrong(num1))
            printf("%d is Strong \n" , num1);
    
    printf("\n");

    for (int i = num1; i <= num2; ++i) 
        if(isArmstrong(num1))
            printf("%d is Armstrong \n" , num1);

    printf("\n");

    for (int i = num1; i <= num2; ++i) 
        if(isPalindrome(num1))
            printf("%d is Palindrome \n" , num1);
}