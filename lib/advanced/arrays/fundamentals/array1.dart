void main() {
  var lS = linearSearch([2, -4, 4, 0, 10], 6);
  print(lS);
  var large = largestElement([2, -4, 4, 0, 10]);
  print(large);
  var secondL = secondLargestElement([8, 8, 7, 6, 5, -2]);
  print(secondL);
  var secondSmallest = secondSmallestElement([8, 8, 7, 6, 5]);
  print(secondSmallest);
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
