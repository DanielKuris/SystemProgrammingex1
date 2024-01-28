/*
 * Will return 'true' (1) when receiving a prime number, or 'false' (0) otherwise.
 */
int isPrime(int num)
{
    for(int i = 2; i < num; i++)
    {
        if (num%i == 0)
            return 0;
    }
    return 1;
}

long factorial(int n)
{
    if (n == 0)
        return 1;
    else
        return(n * factorial(n-1));
}

/*
 * Will return 'true' (1) when receiving a strong number, or 'false' (0) otherwise.
 * A strong number is a number whose sum of the factorials of each of his digits is eqal to the original number.
 */
int isStrong(int num)
{
    int sum = 0;
    int temp = num;

    while(temp)
    {
        sum += factorial(temp % 10);
        temp /= 10;
    }

    if(sum == num)
        return 1;
    else
        return 0;
}