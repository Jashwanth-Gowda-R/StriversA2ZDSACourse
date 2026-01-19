import 'dart:math';

void main() {
  print(maxProfit([7, 1, 5, 3, 6, 4]));
  print(maxProfit([7, 6, 4, 3, 1]));
  
  print(maxProfit([3, 8, 1, 4, 6, 2]));
}

// Best Time to Buy and Sell Stock

/*
You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and 
choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. 
If you cannot achieve any profit, return 0.

 

Example 1:

Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
Example 2:

Input: prices = [7,6,4,3,1]
Output: 0
Explanation: In this case, no transactions are done and the max profit = 0.

Approach:
Initialize a variable ‘maxProfit’ to 0 and declare another variable ‘mini’ 
which we will use to keep track of the buying price (minimum price from day 0 to current day) 
for selling the stock.
Traverse the array from index 1 to n-1. We started at index 1 because buying and 
selling the stock on the 0th day will give us a profit of 0, which we have initialized 
our maxProfit as already.
In each iteration, try to find the curProfit. 
The selling price will be the current element and ‘mini’ will give us the buying price. 
Calculate the curProfit. If it is more than the existing profit value (maxProfit), 
we update the maxProfit value.
Before going to the next iteration, 
check if the current price (Arr[i]) is less than the mini value, and 
assign it as the new 'mini' value. In this way, we keep track of the buying price in a 
single iteration itself.


Complexity Analysis:
Time Complexity:O(N), As the whole array is being traversed only once.

Space Complexity:O(1), As no extra space is being used.

*/

int maxProfit(List<int> prices) {
  int maxprofit = 0;

  int minimumPrice = prices[0];

  for (int i = 0; i < prices.length; i++) {
    int cost = prices[i] - minimumPrice;

    maxprofit = max(maxprofit, cost);

    minimumPrice = min(prices[i], minimumPrice);
  }

  return maxprofit;
}
