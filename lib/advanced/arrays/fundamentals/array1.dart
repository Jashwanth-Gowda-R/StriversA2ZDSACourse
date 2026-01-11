void main() {
  var lS = linearSearch([2, -4, 4, 0, 10], 6);
  print(lS);
  var large = largestElement([2, -4, 4, 0, 10]);
  print(large);
  var secondL = secondLargestElement([8, 8, 7, 6, 5, -2]);
  print(secondL);
  var secondSmallest = secondSmallestElement([8, 8, 7, 6, 5]);
  print(secondSmallest);
  var findMaxConsecutiveOne = findMaxConsecutiveOnes([1, 1, 0, 0, 1, 1, 1, 0]);
  print(findMaxConsecutiveOne);
  var rotateArrayByOneVar = rotateArrayByOne([1, 2, 3, 4, 5]);
  print(rotateArrayByOneVar);
  var rotateArrayvar = rotateArray([1, 2, 3, 4, 5, 6], 2);
  print(rotateArrayvar);
}

// Linear Search
/*
Given an array of integers nums and an integer target, find the smallest index (0 based indexing) where the target appears in the array. If the target is not found in the array, return -1.

*/

linearSearch(nums, target) {
  var result = -1;

  for (var i = 0; i <= nums.length - 1; i++) {
    if (nums[i] == target) {
      result = i;
      return result;
    }
  }
  return result;
}

// Largest Element
/// Given an array of integers nums, return the value of the largest element in the array
largestElement(nums) {
  var largest = nums[0];
  for (var i = 1; i <= nums.length - 1; i++) {
    if (nums[i] > largest) {
      largest = nums[i];
    }
  }
  return largest;
}

// Second Largest Element
/*
Given an array of integers nums, return the second-largest element in the array. If the second-largest element does not exist, return -1
*/

secondLargestElement(nums) {
  var largest = nums[0];
  // var secondLargest = -1;
  var secondLargest = -double.maxFinite.toInt(); // Smallest possible integer

  for (var i = 1; i <= nums.length - 1; i++) {
    if (nums[i] > largest) {
      largest = nums[i];
    }
  }
  for (var i = 0; i <= nums.length - 1; i++) {
    if (nums[i] > secondLargest && nums[i] != largest) {
      secondLargest = nums[i];
    }
  }

  return secondLargest;
}

secondSmallestElement(nums) {
  var smallest = nums[0];
  var secondSmallest = double.maxFinite.toInt(); //what i need to take max elemt

  for (var i = 1; i <= nums.length - 1; i++) {
    if (nums[i] < smallest) {
      smallest = nums[i];
    }
  }
  for (var i = 0; i <= nums.length - 1; i++) {
    if (nums[i] < secondSmallest && nums[i] != smallest) {
      secondSmallest = nums[i];
    }
  }

  return secondSmallest;
}

// Maximum Consecutive Ones nums = [1, 1, 0, 0, 1, 1, 1, 0]
/*
Given a binary array nums, return the maximum number of consecutive 1's in the array.
*/
int findMaxConsecutiveOnes(List<int> nums) {
  var max = 0;
  var streak = 0;
  for (var i = 0; i <= nums.length - 1; i++) {
    if (nums[i] == 1) {
      streak++;
      if (max < streak) {
        max = streak;
      }
    } else {
      streak = 0;
    }
  }
  return max;
}

// Left Rotate Array by One
//Given an integer array nums, rotate the array to the left by one.
// Note: There is no need to return anything, just modify the given array.
List<int> rotateArrayByOne(List<int> nums) {
  var temp = nums[0];
  for (var i = 1; i < nums.length; i++) {
    nums[i - 1] = nums[i];
  }
  nums[nums.length - 1] = temp;
  return nums;
}

// Left Rotate Array by K Places
/*
Given an integer array nums and a non-negative integer k, 
rotate the array to the left by k steps.
*/

// 1 - reduce k by length of arr size
// 2 - save the rotatable arr in temp
// 3 - shifting to right for remaining elements
//  4 - add back temp to end of list

List<int> rotateArray(List<int> nums, int k) {
  var n = nums.length;
  k = k % n;

  List<int> temp = [];

  for (var i = 0; i < k; i++) {
    temp.add(nums[i]);
  }

  // shifting
  for (var i = k; i < n; i++) {
    nums[i - k] = nums[i];
  }

  // nums.addAll(temp);
  for (var i = n - k; i < n; i++) {
    nums[i] = temp[i - (n - k)];
  }

  return nums;
}
/*
Visual Example:
Example: nums = [1, 2, 3, 4, 5, 6, 7], k = 3
Original: [1, 2, 3, 4, 5, 6, 7]

Step 1: k = 3 % 7 = 3
Step 2: temp = [1, 2, 3] (first 3 elements)
Step 3: Shift elements from index 3-6 to left:
        nums[0] = nums[3] = 4
        nums[1] = nums[4] = 5  
        nums[2] = nums[5] = 6
        nums[3] = nums[6] = 7
        Array becomes: [4, 5, 6, 7, 5, 6, 7]
Step 4: Place temp at end:
        nums[4] = temp[0] = 1
        nums[5] = temp[1] = 2
        nums[6] = temp[2] = 3
        Final: [4, 5, 6, 7, 1, 2, 3] ✓

*/

List<int> rotateArrayWithComments(List<int> nums, int k) {
  var n = nums.length;

  // STEP 1: Handle k larger than array size
  // Example: If array size is 5 and k=7, rotating by 7 is same as rotating by 2
  k = k % n;

  // STEP 2: Store first k elements in temp array
  // These will be moved to the end after rotation
  List<int> temp = [];
  for (var i = 0; i < k; i++) {
    temp.add(nums[i]); // Save elements that will be overwritten
  }

  // STEP 3: Shift remaining elements to the left
  // Move elements from index k to n-1 to positions 0 to n-k-1
  for (var i = k; i < n; i++) {
    nums[i - k] = nums[i]; // Shift element left by k positions
  }

  // STEP 4: Place temp elements at the end
  // Copy saved elements from temp to the end of array
  for (var i = n - k; i < n; i++) {
    // Calculate index in temp: i - (n - k)
    // When i = n-k, temp index = 0
    // When i = n-1, temp index = k-1
    nums[i] = temp[i - (n - k)];
  }

  return nums;
}
