// create a sqaure pattern 7338433383-h
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
  print('-------');
  printDiamondStarPattern(6);
  print('-------');
  printHalfDiamondStarPattern(6);
  print('-------');
  printBinaryNumberTrianglePattern(6);
  print('-------');
  printNumberCrownPattern(6);
  print('-------');
  printIncreasingNumberTrianglePattern(6);
  print('-------');
  printIncreasingLetterTrianglePattern(6);
  print('-------');
  printReverseLetterTrianglePattern(6);
  print('-------');
  printAlphaRampPattern(5);
  print('-------');
  printAlphaHillPattern(6);
  print('-------');
  printAlphaTrianglePattern(6);
  print('-------');
  printSymmetricVoidPattern(6);
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

// for space formula is (<n)
// for star formula is 2n-(2 * i + 1)
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

// Pattern - 9: Diamond Star Pattern

/*
Input Format: N = 6
Result:   
     *
    ***
   ***** 
  *******
 *********
***********  
***********
 *********
  *******
   ***** 
    ***    
     *

*/
// pattern is combinarion of 2 above patterns
void printDiamondStarPattern(int n) {
  printStarPyramid(n);
  printInvertedStarPyramid(n);
}

// Pattern - 10: Half Diamond Star Pattern

/*
 Input Format: N = 6
Result:   
     *            1
     **           2
     ***          3
     ****         4
     *****         5
     ******       6
     *****         7
     ****         8
     ***          9
     **           10
     *            11
 */

// outter loop should run 2n-1 or less than 2n
// stop inner loop when row reaches more than n and minus it by 2n-1 to go backwards

void printHalfDiamondStarPattern(int n) {
  // brute force
  // printRightAngledTriangle(n + 1);
  // printInvertedRightPyramid(n - 1);

  for (var i = 0; i < (2 * n); i++) {
    var stars = i;
    stars > n ? stars = (2 * n) - i : stars = i;
    // print(stars);

    for (var j = 0; j < stars; j++) {
      // Print a star without newline
      stdout.write('* ');
    }
    print('');
  }
}

// Pattern - 11: Binary Number Triangle Pattern
/*
Examples:

Input Format: N = 3
Result: 
1
01
101

Input Format: N = 6
Result:   
1
01
101
0101
10101
010101

 */
// even rows 1 is printed and on odds the 0 is printed 1st and rest is triangle and flip the number in nxt row start
void printBinaryNumberTrianglePattern(int n) {
  var start = 1;
  for (var i = 0; i < n; i++) {
    i % 2 == 0 ? start = 1 : start = 0;
    for (var j = 0; j <= i; j++) {
      stdout.write('$start');
      start = 1 - start;
    }
    print('');
  }
}

// Pattern - 12: Number Crown Pattern
/*

Examples:

Input Format: N = 3
Result: 
1    1
12  21
123321

Input Format: N = 6
Result:              [number,space,number]
1          1         1,10,1  
12        21         2,8,2
123       321        3,6,3
1234    4321         4,4,4
12345  54321         5,2,5
123456654321         6,0,6

 1st for 1st number print number of rows in forwards and last number in reverse
for space formula=(2 * n) - 1;
end of loop make space -= 2;

*/
void printNumberCrownPattern(int n) {
  var space = (2 * n) - 1;
  for (var i = 0; i <= n; i++) {
    // number
    for (var j = 1; j <= i; j++) {
      stdout.write(j);
    }

    // space
    for (var j = 0; j < space; j++) {
      // stdout.write('hi');
      stdout.write(' ');
    }

    // number
    for (var j = i; j >= 1; j--) {
      // stdout.write('hi');
      stdout.write(j);
    }
    print('');
    space -= 2;
  }
}

// Pattern - 13: Increasing Number Triangle Pattern

/*
Examples:

Input Format: N = 3
Result: 
1
2 3
4 5 6

Input Format: N = 6
Result:   
1
2  3
4  5  6
7  8  9  10
11  12  13  14  15
16  17  18  19  20  21

*/

void printIncreasingNumberTrianglePattern(int n) {
  var num = 0;
  for (var i = 1; i < n; i++) {
    for (var j = 1; j <= i; j++) {
      num = num + 1;
      stdout.write('$num ');
    }
    print('');
  }
}

// Pattern-14: Increasing Letter Triangle Pattern

/*
Examples:

Input Format: N = 3
Result: 
A
A B
A B C

Input Format: N = 6
Result:   
A
A B
A B C
A B C D
A B C D E
A B C D E F

*/

void printIncreasingLetterTrianglePattern(int n) {
  for (var i = 0; i < n; i++) {
    for (var j = 'A'.codeUnitAt(0); j <= 'A'.codeUnitAt(0) + i; j++) {
      stdout.write('${String.fromCharCode(j)} ');
    }
    print('');
  }
}

// Pattern-15: Reverse Letter Triangle Pattern

/*
Here, N = 5.

Examples:

Input Format: N = 3
Result: 
A B C
A B
A

Input Format: N = 6
Result:   
A B C D E F
A B C D E 
A B C D
A B C
A B
A

*/

void printReverseLetterTrianglePattern(int n) {
  for (var i = n; i > 0; i--) {
    for (var j = 'A'.codeUnitAt(0); j <= 'A'.codeUnitAt(0) + i; j++) {
      stdout.write('${String.fromCharCode(j)} ');
    }
    print('');
  }
}

// Pattern - 16: Alpha-Ramp Pattern

/*

Examples:

Input Format: N = 3
Result: 
A
B B
C C C

Input Format: N = 6
Result:   
A 
B B
C C C
D D D D
E E E E E
F F F F F F

*/

void printAlphaRampPattern(int n) {
  for (var i = 0; i < n; i++) {
    for (var j = 0; j <= i; j++) {
      // print('$j');
      var ch = 'A'.codeUnitAt(0) + i;
      stdout.write('${String.fromCharCode(ch)} ');
    }
    print('');
  }
}

// Pattern - 17: Alpha-Hill Pattern

/*
Examples:

Input Format: N = 3
Result: 
  A  
 ABA 
ABCBA


Input Format: N = 6
Result:   
     A     
    ABA    
   ABCBA   
  ABCDCBA  
 ABCDEDCBA 
ABCDEFEDCBA

*/

void printAlphaHillPattern(int n) {
  for (var i = 0; i < n; i++) {
    // space
    for (var j = 0; j < (n - i - 1); j++) {
      // Print a star without newline
      stdout.write(' ');
    }
    // alphabets
    var ch = 'A'.codeUnitAt(0);
    // stdout.write('${String.fromCharCode(ch)} ');
    var breakpoint = (2 * i + 1) / 2;
    for (var j = 1; j <= (2 * i + 1); j++) {
      // Print a star without newline
      stdout.write(String.fromCharCode(ch));
      if (j <= breakpoint) {
        ch++;
      } else {
        ch--;
      }
    }
    // space
    for (var j = 0; j < (n - i - 1); j++) {
      // Print a star without newline
      stdout.write(' ');
    }
    print('');
  }
}

// Pattern-18: Alpha-Triangle Pattern

/*

Examples:

Input Format: N = 3
Result: 
C
B C
A B C

Input Format: N = 6
Result:   
F
E F
D E F
C D E F
B C D E F
A B C D E F


String.fromCharCode('A'.codeUnitAt(0) + (n - 1 - i + j))
Row 0: F          (n-1-i+j = 5-0+0 = 5)
Row 1: E F        (5-1+0=4, 5-1+1=5)
Row 2: D E F      (5-2+0=3, 5-2+1=4, 5-2+2=5)
Row 3: C D E F    (5-3+0=2, 5-3+1=3, 5-3+2=4, 5-3+3=5)
Row 4: B C D E F  (5-4+0=1, 5-4+1=2, 5-4+2=3, 5-4+3=4, 5-4+4=5)
Row 5: A B C D E F(5-5+0=0, 5-5+1=1, 5-5+2=2, 5-5+3=3, 5-5+4=4, 5-5+5=5)

*/

void printAlphaTrianglePattern(int n) {
  for (var i = 0; i < n; i++) {
    // space
    for (var j = 0; j <= i; j++) {
      // Calculate character code: start from ('A' + n - 1) and go backwards
      // alphabets
      var ch = 'A'.codeUnitAt(0) + (n - 1 - i + j);
      stdout.write(String.fromCharCode(ch));
    }

    print('');
  }
}

// Pattern-19: Symmetric-Void Pattern

/*

Input Format: N = 3
Result: 
******
**  **
*    *
*    *
**  **
******

Input Format: N = 6
Result:   
************
*****  *****
****    ****
***      ***
**        **
*          *
*          *
**        **
***      ***
****    ****
*****  *****
************

*/

/// dive above pattern into 2
/// part1 - [stars,space,stars]
/// for n=5 - [5,0,5]
///           [4,2,4]
///           [3,4,3]
///           [2,6,2]
///           [1,8,1]
/// stars formula = n-i
/// space plus 2
///
/// part2 - [stars,space,stars]
/// for n=5 - [1,8,1]
///           [2,6,2]
///           [3,4,3]
///           [4,2,4]
///           [5,0,5]
/// stars formula = normal till n
/// space plus 2n-2

void printSymmetricVoidPattern(int n) {
  var space = 0;
  for (var i = 0; i < n; i++) {
    //stars
    for (var j = 0; j < n - i; j++) {
      stdout.write('*');
    }
    // space
    for (var j = 0; j < space; j++) {
      stdout.write(' ');
    }
    //stars
    for (var j = 0; j < n - i; j++) {
      stdout.write('*');
    }
    space += 2;
    print('');
  }
  // part2
  space = (2 * n) - 2;
  for (var i = 0; i < n; i++) {
    // stars
    for (var j = 0; j <= i; j++) {
      stdout.write('*');
    }

    // spaces
    for (var j = 0; j < space; j++) {
      stdout.write(' ');
    }

    // stars
    for (var j = 0; j <= i; j++) {
      stdout.write('*');
    }
    space -= 2;
    print('');
  }
}
