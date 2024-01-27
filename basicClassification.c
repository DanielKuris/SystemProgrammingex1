#include "NumClass.h"

//Function to check if a number is Prime
int isPrime(int num) {
    if (num <= 1) 
        return 0;  
    
    for (int i = 2; i <= num-1; i++) 
        if(num % i ==0)
            return 0;
    return 1;
}

// Function to calculate the factorial of a number used in isStrong function
int factorial(int num) {
    int result = 1;

    for (int i = 1; i <= num; i++) {
        result *= i;
    }

    return result;
}

//Function to check if a number is Strong
int isStrong(int num){
    int originalNum = num; // Saving number for comparison to sum
    int sum = 0;
    while(num > 0){
        sum += factorial(num%10);
        num /= 10;
    }
    if(originalNum == sum)
        return 1;   
    return 0;
}