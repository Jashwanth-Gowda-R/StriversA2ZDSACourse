import 'dart:math' as math;

void main() {
  var longestConsecutivevar =
      longestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]);
  print(longestConsecutivevar);

  var longestSubarrayvar = longestSubarray([10, 5, 2, 7, 1, 9], 15);
  print(longestSubarrayvar);

  var subarraySumvar = subarraySum([1, 2, 3], 3);
  print(subarraySumvar);

  var subarraysWithXorKvar = subarraysWithXorK([5, 2, 9], 7);
  print(subarraysWithXorKvar);
}

// Longest Consecutive Sequence in an Array
/*
Given an array nums of n integers.

Return the length of the longest sequence of consecutive integers. The integers in this sequence can appear in any order.

Example 1

Input: nums = [100, 4, 200, 1, 3, 2]

Output: 4

Explanation:

The longest sequence of consecutive elements in the array is [1, 2, 3, 4], which has a length of 4. This sequence can be formed regardless of the initial order of the elements in the array.

Example 2

Input: nums = [0, 3, 7, 2, 5, 8, 4, 6, 0, 1]

Output: 9

Explanation:

The longest sequence of consecutive elements in the array is [0, 1, 2, 3, 4, 5, 6, 7, 8], which has a length of 9. 

*/

int longestConsecutive(List<int> nums) {
  // Handle empty array case
  if (nums.isEmpty) return 0;

  // Step 1: Sort the array - O(n log n)
  // This brings consecutive numbers next to each other
  nums.sort();

  // Step 2: Initialize variables
  int maxLength = 1; // Longest sequence length found
  int currentLength = 1; // Length of current consecutive sequence
  int prevNumber = nums[0]; // Previous number in current sequence

  // Step 3: Iterate through sorted array starting from second element
  for (int i = 1; i < nums.length; i++) {
    int currentNumber = nums[i];

    // Case 1: Current number is consecutive to previous number
    // Example: prev=2, current=3 → 3-1=2, they are consecutive
    if (currentNumber - 1 == prevNumber) {
      currentLength++; // Extend current sequence
      prevNumber = currentNumber; // Update previous number
    }
    // Case 2: Current number is not a duplicate and not consecutive
    // Example: prev=3, current=5 → start new sequence at 5
    else if (currentNumber != prevNumber) {
      currentLength = 1; // Reset sequence length
      prevNumber = currentNumber; // Start new sequence
    }
    // Case 3: Current number is a duplicate (currentNumber == prevNumber)
    // Do nothing - skip duplicates without breaking sequence

    // Update maximum length found
    maxLength = math.max(maxLength, currentLength);
  }

  return maxLength;
}

// Longest subarray with sum K
/*
Given an array nums of size n and an integer k, find the length of the longest sub-array that sums to k. If no such sub-array exists, return 0.

Example 1

Input: nums = [10, 5, 2, 7, 1, 9],  k=15

Output: 4

Explanation:

The longest sub-array with a sum equal to 15 is [5, 2, 7, 1], which has a length of 4. This sub-array starts at index 1 and ends at index 4, and the sum of its elements (5 + 2 + 7 + 1) equals 15. Therefore, the length of this sub-array is 4.

Example 2

Input: nums = [-3, 2, 1], k=6

Output: 0

Explanation:

There is no sub-array in the array that sums to 6. Therefore, the output is 0.
*/

int longestSubarray(List<int> nums, int k) {
  int maxLen = 0;
  int sum = 0;

  Map<int, int> map = {};
  for (var i = 0; i < nums.length; i++) {
    sum += nums[i];

    if (sum == k) {
      maxLen = math.max(maxLen, i + 1);
    }

    // find res // calculate the sum of remaining part i.e., sum - k
    int res = sum - k;

    if (map.containsKey(res)) {
      // calculate the length and update maxLen
      maxLen = math.max(maxLen, i - map[res]!);
    } else {
      // update the map if sum is not already present
      map[sum] = i;
    }
  }

  return maxLen;
}

// added code for comments and understanding
int longestSubarrayComments(List<int> nums, int k) {
  // Track maximum length of subarray with sum k
  int maxLength = 0;

  // Track cumulative sum from start to current index
  int sum = 0;

  // HashMap to store: sum → firstIndexWhereThisSumOccurred
  // Key insight: if sum[j] - sum[i] = k, then
  // subarray from i+1 to j has sum = k
  Map<int, int> sumIndices = {};

  for (int currentIndex = 0; currentIndex < nums.length; currentIndex++) {
    // Update cumulative sum including current element
    sum += nums[currentIndex];

    // SCENARIO 1: Subarray starting from index 0
    // If prefix sum from index 0 to currentIndex equals k,
    // then entire subarray [0..currentIndex] has sum k
    if (sum == k) {
      // Length = currentIndex + 1 (since array is 0-indexed)
      maxLength = math.max(maxLength, currentIndex + 1);
    }

    // SCENARIO 2: Subarray starting somewhere in the middle
    // We want: sum[currentIndex] - sum[someEarlierIndex] = k
    // Rearranged: sum[someEarlierIndex] = sum[currentIndex] - k
    int neededEarliersum = sum - k;

    // Check if we've seen this needed prefix sum before
    if (sumIndices.containsKey(neededEarliersum)) {
      // Calculate subarray length:
      // subarray starts at (earlierIndex + 1) and ends at currentIndex
      int earlierIndex = sumIndices[neededEarliersum]!;
      int subarrayLength = currentIndex - earlierIndex;
      maxLength = math.max(maxLength, subarrayLength);
    }

    // Store current prefix sum in map, but only if it's new
    // We want the earliest occurrence to maximize subarray length
    if (!sumIndices.containsKey(sum)) {
      sumIndices[sum] = currentIndex;
    }
  }

  return maxLength;
}

// Count subarrays with given sum
/*
Given an array of integers nums and an integer k, return the total number of subarrays whose sum equals to k.

Example 1

Input: nums = [1, 1, 1], k = 2

Output: 2

Explanation: In the given array [1, 1, 1], there are two subarrays that sum up to 2: [1, 1] and [1, 1]. Hence, the output is 2.

Example 2

Input: nums = [1, 2, 3], k = 3

Output: 2

Explanation: In the given array [1, 2, 3], there are two subarrays that sum up to 3: [1, 2] and [3]. Hence, the output is 2.

*/

// O(n²)
int subarraySum(List<int> nums, int k) {
  int count = 0;

  for (var i = 0; i < nums.length; i++) {
    int sum = 0;
    for (var j = i; j < nums.length; j++) {
      sum += nums[j];
      if (sum == k) {
        count++;
      }
    }
  }
  return count;
}

// O(n)
int subarraySumOptimal(List<int> nums, int k) {
  int count = 0;
  int sum = 0;
  // This represents an "empty subarray" with sum 0
// It's needed because:
// 1. A subarray starting at index 0 has no "earlier prefix sum"
// 2. When sum itself equals k, we need to count it
// Example: nums=[2], k=2
// sum = 2, sum - k = 0 → found in map {0:1}
// So we count the subarray [2]
  Map<int, int> sumCount = {0: 1}; // prefix sum 0 occurs once

  for (int num in nums) {
    sum += num;

    // If (sum - k) exists in map, we found subarrays
    if (sumCount.containsKey(sum - k)) {
      count += sumCount[sum - k]!;
    }

    // Update the count of current prefix sum
    sumCount[sum] = (sumCount[sum] ?? 0) + 1;
  }

  return count;
}

// Count subarrays with given xor K

/*
Given an array of integers nums and an integer k, return the total number of subarrays whose XOR equals to k.

Example 1

Input : nums = [4, 2, 2, 6, 4], k = 6

Output : 4

Explanation : The subarrays having XOR of their elements as 6 are [4, 2],  [4, 2, 2, 6, 4], [2, 2, 6], and [6]

Example 2

Input :nums = [5, 6, 7, 8, 9], k = 5

Output : 2

Explanation : The subarrays having XOR of their elements as 5 are [5] and [5, 6, 7, 8, 9]

What the XOR Operator Does (^)
Bitwise Operation: It compares two numbers bit by bit.
Rule: If corresponding bits are different, the result bit is 1; if they are the same, the result bit is 0.
Example:
5 (0101) ^ 3 (0011)
0^0=0, 1^0=1, 0^1=1, 1^1=0
Result: 0110 (which is 6 in decimal). 
*/

// O(n²)
int subarraysWithXorK(List<int> nums, int k) {
  int count = 0;
  for (var i = 0; i < nums.length; i++) {
    int sumXOR = 0;
    for (var j = i; j < nums.length; j++) {
      sumXOR ^= nums[j];
      if (sumXOR == k) {
        count++;
      }
    }
  }
  return count;
}

// O(n) solution
int subarraysWithXorKOptimal(List<int> nums, int k) {
  int count = 0;
  int xor = 0;
  Map<int, int> prefixXorCount = {0: 1}; // Empty subarray has XOR 0

  for (int num in nums) {
    xor ^= num; // Calculate prefix XOR

    // If (xor ^ k) exists in map, we found subarrays
    int needed = xor ^ k;
    if (prefixXorCount.containsKey(needed)) {
      count += prefixXorCount[needed]!;
    }

    // Update the count of current prefix XOR
    prefixXorCount[xor] = (prefixXorCount[xor] ?? 0) + 1;
  }

  return count;
}
