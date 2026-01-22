void main() {
  print(threeSum([-1, 0, 1, 2, -1, -4]));
  print(threeSum([0, 1, 1]));
  print(threeSum([0, 0, 0]));
}

//  3Sum
/*
Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.

Example 1:

Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Explanation: 
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
The distinct triplets are [-1,0,1] and [-1,-1,2].
Notice that the order of the output and the order of the triplets does not matter.
Example 2:

Input: nums = [0,1,1]
Output: []
Explanation: The only possible triplet does not sum up to 0.
Example 3:

Input: nums = [0,0,0]
Output: [[0,0,0]]
Explanation: The only possible triplet sums up to 0.

*/

/*
Intuition
Imagine you're organizing a dinner party and you want to create a balanced meal with three different ingredients that together have zero net calories.

First task would be to list all your ingredients by their calorie values and sort them. Then, for each ingredient, try to find two other ingredients from the remaining list that, when combined, balance the calories back to zero.

Start with one ingredient and use two pointers, one starting from the left (beginning of the list) and the other from the right (end of the list). By adjusting these pointers, check if the three chosen ingredients balance to zero calories. If they do, you have a balanced meal! Continue this process, ensuring that the same combination of ingredients more than once is not picked.

Approach 
Sort the entire array & iterate from 0 to n-1 in the array, lets call the loop variable i. In each iteration, this value will be fixed for all different values of the rest of the 2 pointers.
Inside the loop, first check if the current and the previous element is the same and if it is, do nothing and continue to the next value of i.
After that, there will be 2 moving pointers i.e. j(starts from i+1) and k(starts from the last index). The pointer j will move forward and the pointer k will move backward until they cross each other while the value of i will be fixed.
Now check the sum of arr[i] and arr[j] and arr[k]. If the sum is exceeding target, then the ask is to use lesser valued elements and so decrease the value of k(i.e. k--). If the sum is lesser than the target, we need a bigger value and so increase the value of j (i.e. j++).
If the sum is equal to the target, simply insert the triplet i.e. arr[i], arr[j], arr[k] into answer data structure and move the pointers j and k skipping the duplicate elements(i.e. by checking the adjacent elements while moving the pointers). Finally, return the list of unique triplets.


Complexity Analysis
Time Complexity: O(NlogN)+O(N2), where N is size of the array. 
As the pointer i, is running for approximately N times. 
And both the pointers j and k combined can run for approximately N times including 
the operation of skipping duplicates. So the total time complexity will be O(N2).

Space Complexity: O(1), no extra space is used.
*/

// optimal
List<List<int>> threeSum(List<int> nums) {
  int n = nums.length;

  nums.sort();
  List<List<int>> result = [];

  for (var i = 0; i < n; i++) {
    if (i > 0 && nums[i] == nums[i - 1]) {
      continue;
    }
    int j = i + 1;
    int k = n - 1;

    while (j < k) {
      int answer = nums[i] + nums[j] + nums[k];

      if (answer < 0) {
        j++;
      } else if (answer > 0) {
        k--;
      } else {
        result.add([nums[i], nums[j], nums[k]]);
        j++;
        k--;

        while (j < k && nums[j] == nums[j - 1]) {
          j++;
        }
        while (j < k && nums[k] == nums[k + 1]) {
          k--;
        }
      }
    }
  }
  return result;
}
