#!/usr/bin/env ruby

# A lot of silliness, just to test the
# `check_day` method.


def check_day(meet_days_integer,day_to_check)

  day_shift = {monday: 0, tuesday: 1, wednesday: 2, thursday: 3, friday: 4, saturday: 5, sunday:6}

#  puts "day_to_check = #{day_to_check}"
#  puts "day_shift[:tuesday] = #{day_shift[:tuesday]}"
#  puts "day_shift[day_to_check] = #{day_shift[day_to_check]}"
  day_shift_int = day_shift[day_to_check].to_i
#  puts "day_shift_int = #{day_shift_int}"
  shifted_int = ( meet_days_integer >> day_shift_int ).to_s(2)
#  puts "shifted_int = #{shifted_int}"
  day_checked = shifted_int.to_i % 2
#  puts "day_checked = #{day_checked}"
  return day_checked.to_s
end

while true
  puts "","Meet_days as integer (1-128):"
   meet_days_string = gets.chomp

  if meet_days_string == "Q"
    break
  else
    in_meet_days_integer = meet_days_string.to_i
  end

  puts "","Day to check:"
  target_day = gets.chomp

  if target_day == "Q"
    break
  else
    in_day_to_check = target_day.downcase.to_sym
  end

  if check_day(in_meet_days_integer,in_day_to_check) == '1'
    puts "","True!"
  else
    puts "","False"
  end

end

