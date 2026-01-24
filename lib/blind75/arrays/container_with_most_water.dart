import 'dart:math';

void main() {
  print(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]));
}
// https://neetcode.io/solutions/container-with-most-water
// Container With Most Water - Explanation

/*
You are given an integer array height of length n. There are n vertical lines drawn 
such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, 
such that the container contains the most water.

Return the maximum amount of water a container can store.

Notice that you may not slant the container.

Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. 
In this case, the max area of water (blue section) the container can contain is 49.
Example 2:

Input: height = [1,1]
Output: 1
*/

// 1. Brute Force
/*
Intuition
We try every possible pair of lines and compute the area they form.
For each pair (i, j), the height of the container is the shorter of the two lines, 
and the width is the distance between them.
By checking all pairs, we are guaranteed to find the maximum area.

Time & Space Complexity
Time complexity: 

O(n^2)
Space complexity: 
O(1)
*/

int maxAreaBrute(List<int> height) {
  int res = 0;

  for (var i = 0; i < height.length; i++) {
    for (var j = i + 1; j < height.length; j++) {
      // we calculate the amount of water using the formula
      int maxArea = (j - i) * min(height[i], height[j]);
      res = max(res, maxArea);
    }
  }

  return res;
}

// optimal solution - Two Pointers

/*
Intuition
Using two pointers lets us efficiently search for the maximum area without checking every pair.
We start with the widest container (left at start, right at end).
The height is limited by the shorter line, so to potentially increase the area, 
we must move the pointer at the shorter line inward.
Moving the taller line never helps because it keeps the height the same but reduces the width.
By always moving the shorter side, we explore all meaningful possibilities.

Time & Space Complexity
Time complexity: 
O(n)

Space complexity: 
O(1)

*/

int maxArea(List<int> height) {
  int left = 0;
  int right = height.length - 1;
  int resultArea = 0;

  while (left < right) {
    // area=width * height;
    int maxArea = (right - left) * (min(height[left], height[right]));
    resultArea = max(maxArea, resultArea);

    // move pointer
    if (height[left] <= height[right]) {
      left++;
    } else {
      right--;
    }
  }

  return resultArea;
}
