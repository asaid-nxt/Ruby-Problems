def three_sum(nums)
  output = []
  return output if nums.length < 3

  nums.sort!

  nums.each_with_index do |number, index|
    next if index > 0 && number == nums[index - 1]

    start_point = index + 1
    end_point = nums.length - 1

    while start_point < end_point
      sum = number + nums[start_point] + nums[end_point]

      if sum == 0
        output << [number, nums[start_point], nums[end_point]]
        start_point += 1
        start_point += 1  while nums[start_point] == nums[start_point - 1] && start_point < end_point
      elsif sum < 0
        start_point += 1
      elsif sum > 0
        end_point -= 1
      end
    end
  end
  output
end
