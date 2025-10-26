void main() {
  printNTimesName(0, 6);
  print('-------');
  print1NTimes(1, 5);
  print('-------');
  printN1Times(5, 5);
  print('-------');
  var sum = sumOfNNumber(10);
  print('sum of n number = $sum');
  print('-------');
  var fact = factorialOfNNumber(5);
  print('fact of n number = $fact');
  print('-------');
  var reverse = reverseArray([5, 4, 3, 2, 1], 5, 0, 4);
  print('reverse of arr = $reverse');
  print('-------');
  var palindrome = isPalindrome("hannah", 0, 5);
  print('palindrome of string = $palindrome');
  print('-------');
  var fibonacci = fibonacciNumber(3);
  print('fibonacci of int = $fibonacci');
  print('-------');
}

// Print Name N times using Recursion
/*
Examples
Input: N = 3
Output: Ashish Ashish Ashish 
Explanation: Name is printed 3 times.

Input: N = 1
Output: Ashish 
Explanation: Name is printed once.
*/

void printNTimesName(int counter, int n) {
  if (counter == n) {
    return;
  }
  print('shani');
  counter++;
  printNTimesName(counter, n);
}

// Print 1 to N using Recursion
/*
Given an integer n, write a function to print all numbers from 1 to n (inclusive) using recursion.

You must not use any loops such as for, while, or do-while.
The function should print each number on a separate line, in increasing order from 1 to n.

Input: n = 5

Output:

1  

2  

3  

4  

5

Input: n = 1

Output:

1
*/

// var i = 1;

void print1NTimes(int i, int n) {
  if (i > n) {
    return;
  }
  print(i);
  i++;
  print1NTimes(i, n);
}

// Print N to 1 using Recursion
/*
Given an integer n, write a function to print all numbers from n to 1 (inclusive) using recursion.

You must not use any loops such as for, while, or do-while.
The function should print each number on a separate line, in decreasing order from n to 1

Examples:
Input: 5

Output:

5

4

3

2

1

Input: 1

Output:

1
*/

// var j = 1;

void printN1Times(int j, int n) {
  if (j < 1) {
    return;
  }
  print(j);
  // j++;
  printN1Times(j - 1, n);
}

// Sum of First N Numbers
/*
Given an integer N, return the sum of first N natural numbers. Try to solve this using recursion.


Examples:
Input : N = 4

Output : 10

Explanation : first four natural numbers are 1, 2, 3, 4.

Sum is 1 + 2 + 3 + 4 => 10.

Input : N = 2

Output : 3

Explanation : first two natural numbers are 1, 2.

Sum is 1 + 2 => 3.

*/
// f(n)=n+f(n-1)
// f(3)=3+f(3-1)=3+f(2)=3+f(2)+f(2-1)=3+f(1)+f(1-0)
// f(3)=3+f(2)+f(1)+f(0)=6

int sumOfNNumber(int n) {
  if (n == 0) {
    return 0;
  }
  return n + sumOfNNumber(n - 1);
}

// Factorial of N numbers
/*
 f(n)=n*f(n-1)
factorial of 3 = 3*2*1
*/
int factorialOfNNumber(int n) {
  if (n == 0) {
    return 1; //because of multiplication
  }
  return n * factorialOfNNumber(n - 1);
}

// Reverse an array
/*
Given an array arr of n elements. The task is to reverse the given array. The reversal of array should be inplace.


Examples:
Input: n=5, arr = [1,2,3,4,5]



Output: [5,4,3,2,1]



Explanation: The reverse of the array [1,2,3,4,5] is [5,4,3,2,1]

Input: n=6, arr = [1,2,1,1,5,1]



Output: [1,5,1,1,2,1]



Explanation: The reverse of the array [1,2,1,1,5,1] is [1,5,1,1,2,1].

*/

List<int> reverseArray(List<int> arr, int n, int i, int j) {
  // var i = 0;
  // var j = n - 1;
  if (i > j / 2) return arr;
  var resi = arr[i];
  var resj = arr[j];
  arr[i] = resj;
  arr[j] = resi;
  return reverseArray(arr, n, i + 1, j - 1);
}

// Check if String is Palindrome or Not
/*
Given a string s, return true if the string is palindrome, otherwise false.



A string is called palindrome if it reads the same forward and backward.


Examples:
Input : s = "hannah"

Output : true

Explanation : The string when reversed is --> "hannah", which is same as original string , so we return true.

Input : s = "aabbaaa"

Output : false

Explanation : The string when reversed is --> "aaabbaa", which is not same as original string, So we return false.


*/

bool isPalindrome(String s, int i, int j) {
  if (i > j / 2) {
    return true;
  }
  // check s[i]==s[j]
  // if not true return false else true
  if (s[i] != s[j]) {
    return false;
  } else {
    return isPalindrome(s, i + 1, j - 1);
  }
}

// Fibonacci Number
/*
The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,



F(0) = 0, F(1) = 1
F(n) = F(n - 1) + F(n - 2), for n > 1.


Given n, calculate F(n).


Examples:
Input : n = 2

Output : 1

Explanation : F(2) = F(1) + F(0) => 1 + 0 => 1.

Input : n = 3

Output : 2

Explanation : F(3) = F(2) + F(1) => 1 + 1 => 2.

*/

int fibonacciNumber(int n) {
  if (n <= 1) {
    return n;
  }
  return fibonacciNumber(n - 1) + fibonacciNumber(n - 2);
}
