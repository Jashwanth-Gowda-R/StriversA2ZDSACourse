// create a sqaure pattern
import 'dart:io';

void main() {
  printSquare(2);
  print('-------');
  printRightAngledTriangle(4);
  print('-------');
  printRightAngledNumberPyramid(6);
  print('-------');
  printRightAngledNumberPyramid2(6);
  print('-------');
  printInvertedRightPyramid(8);
  print('-------');
  printInvertedNumberedRightPyramid(6);
  print('-------');
  printStarPyramid(5);
  print('-------');
  printInvertedStarPyramid(5);
}

// Pattern-1: Rectangular Star Pattern
void printSquare(int n) {
  for (var i = 0; i < n; i++) {
    for (var j = 0; j < n; j++) {
      // Print a star without newline
      stdout.write('*');
    }
    print('');
  }
}

// Pattern-2: Right-Angled Triangle Pattern
/* 
*
**
***
****
*****
*/

void printRightAngledTriangle(int n) {
  for (var i = 0; i < n; i++) {
    for (var j = 0; j < i; j++) {
      // Print a star without newline
      stdout.write('*');
    }
    print('');
  }
}

// Pattern - 3: Right-Angled Number Pyramid
/* 
1
12
123
1234
12345
*/
void printRightAngledNumberPyramid(int n) {
  for (var i = 1; i <= n; i++) {
    for (var j = 1; j <= i; j++) {
      // Print a star without newline
      stdout.write(j);
    }
    print('');
  }
}

// Pattern - 4: Right-Angled Number Pyramid - II
/* 
Input Format: N = 6
Result:
1
2 2
3 3 3
4 4 4 4
5 5 5 5 5
6 6 6 6 6 6
*/
void printRightAngledNumberPyramid2(int n) {
  for (var i = 1; i <= n; i++) {
    for (var j = 1; j <= i; j++) {
      // Print a star without newline
      stdout.write(i);
    }
    print('');
  }
}

// Pattern-5: Inverted Right Pyramid
/* 
Input Format: N = 6
Result:
* * * * * *
* * * * * 
* * * * 
* * * 
* * 
* 

*/

void printInvertedRightPyramid(int n) {
  for (var i = 0; i < n; i++) {
    // print('$i 1');
    for (var j = 0; j < n - i; j++) {
      // print('$j 3j');
      // Print a star without newline
      stdout.write('*');
    }
    print('');
  }
}

// Pattern - 6: Inverted Numbered Right Pyramid
/* 
Input Format: N = 6
Result:
1 2 3 4 5 6
1 2 3 4 5
1 2 3 4
1 2 3
1 2 
1
*/

void printInvertedNumberedRightPyramid(int n) {
  for (var i = 0; i < n; i++) {
    for (var j = 1; j <= n - i; j++) {
      // Print a star without newline
      stdout.write('$j');
    }
    print('');
  }
}

// Pattern - 7: Star Pyramid
/*
 Input Format: N = 3
Result: 
  *  0[2,1,2]
 *** 1[1,3,1]
*****   2[0,5,0]
Input Format: N = 6
Result:
     *     
    ***    
   *****   
  *******  
 ********* 
***********

 */

// for space formula is (n-i-1)
// for star formula is (2*i+1)
void printStarPyramid(int n) {
  for (var i = 0; i < n; i++) {
    // space
    for (var j = 0; j < (n - i - 1); j++) {
      // Print a star without newline
      stdout.write(' ');
    }
    // star
    for (var j = 0; j < (2 * i + 1); j++) {
      // Print a star without newline
      stdout.write('*');
    }
    // space
    for (var j = 0; j < (n - i - 1); j++) {
      // Print a star without newline
      stdout.write(' ');
    }
    print('');
  }
}

// Pattern - 8: Inverted Star Pyramid

/*
Input Format: N = 3     2n-(2 * i + 1)
Result: 
*****   0[0,5,0]
 ***  1[1,3,1]  
  *    2[2,1,2]
Input Format: N = 6
Result:     
***********
 *********
  *******
   ***** 
    ***    
     *

 */

// for space formula is (n-i-1)
// for star formula is (2*i+1)
void printInvertedStarPyramid(int n) {
  for (var i = 0; i < n; i++) {
    // space
    for (var j = 0; j < i; j++) {
      // Print a star without newline
      stdout.write(' ');
    }
    // star
    for (var j = 0; j < (2 * n) - (2 * i + 1); j++) {
      // Print a star without newline
      stdout.write('*');
    }
    // space
    for (var j = 0; j < i; j++) {
      // Print a star without newline
      stdout.write(' ');
    }
    print('');
  }
}
