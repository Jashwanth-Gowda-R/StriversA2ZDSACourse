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
Given an integer array nums and a non-negative integer k, rotate the array to the left by k steps.
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
