class Solution(object):
    def majorityElement(self, nums):
        car, count = 0, 0
        for num in nums:
            if count == 0:
                car = num
            count += 1 if num == car else -1
        return car
        """
        :type nums: List[int]
        :rtype: int
        """
        