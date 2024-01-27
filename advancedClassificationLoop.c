#include "NumClass.h"

// Function to check if a number is a palindrome
int isPalindrome(int num) {
    int originalNum = num;
    int reversedNum = 0;

    while (num > 0) {
        int digit = num%10;
        reversedNum = reversedNum * 10 + digit;
        num /= 10;
    }

    if(originalNum == reversedNum)
        return 1;
    return 0;
}

// Function to get amount of digits of number used in isArmstrong function
int getDigits(num){
    int counter = 0;
    while (num > 0) {
        num/=10;
        counter++;
    }
    return (counter);
}

// Function to calculate base ^ pow used in ArmStrong
int powerOf(base, pow){
    int result = 1;
    for(int i=1; i<=pow; i++)
        result *= base;
    return result;
}

//Function to check if a number is Armstrong
int isArmstrong(num){
    int originalNum = num;
    int digits = getDigits(num);
    int sum = 0;
    while (num > 0) {
        int digit = num%10;
        sum += powerOf(digit,digits);
        num /= 10;
    }
    if(originalNum == sum)
        return 1;
    return 0;
}