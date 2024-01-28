#include "NumClass.h"

//Function that returns a reversed number using recursion (result is initiallized at 0) used in Palindrome
int reverseNum(int num, int result){
    if(num == 0)
        return result;
    return reversedNum(num/10, result*10 + num%10);
}

int isPalindromeRecursive(int num) {
    if(num == reverseNum(num,0))
        return 1;
    return 0;

}

// Function to get amount of digits of number used in isArmstrong function
int getDigits(int num){
    int counter = 0;
    while (num > 0) {
        num/=10;
        counter++;
    }
    return (counter);
}

// Function to calculate base ^ pow used in ArmStrong
int powerOf(int base, int pow){
    int result = 1;
    for(int i=1; i<=pow; i++)
        result *= base;
    return result;
}

//Function to calculate recursively each digit^(amount of digits) of num
int armStrongCal(int num, int digits, int result){
    if (num == 0)
        return result;
    return armStrongCal(num/10, result + powerOf(num%10,digits), 0);
}

//Function to check if a number is ArmStrong using recursive calculation 
int isArmstrong(int num){
    int digits = getDigits(num);
    if (num == armStrongCal(num,digits,0))
        return 1;
    return 0;
}