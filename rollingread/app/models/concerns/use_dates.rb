module UseDates
  extend ActiveSupport::Concern

# The "most_proximate" method iterates through an array of rows, to find the first row 
# with a date_field after today. If the array that was passed is SORTED BY THAT FIELD, 
# then what gets returned is the row with a date in the future that's nearest to today.

  def most_proximate (sorted_array,date_field)

    i = 0
    array_size = sorted_array.count
  
    while i < array_size
      return_row = sorted_array[i]
      if return_row[date_field] > Date.today
        break
      end
      i += 1
    end
    return return_row
  end

end
