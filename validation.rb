require_relative 'error_message'
module Validation
  include ErrorMessage

  def validation_values
    count_true = 0
    begin
      @lengthLetters == @lengthLetters.to_i ? count_true += 1 : should_integer_letters_message
      @lengthLetters <= 50 ? count_true += 1 : max_value_letters_message
      @lengthLetters >= 0 ? count_true += 1 : max_value_letters_message
      @lengthNumbers == @lengthNumbers.to_i ? count_true += 1 : should_integer_numbers_message
      @lengthNumbers >= 1 ? count_true += 1 : min_value_numbers_message
      @lengthNumbers <= 30 ? count_true += 1 : max_value_numbers_message
      !!@setNumbers == @setNumbers ? count_true += 1 : set_numbers_should_boolean_message
      !!@leftNumbers == @leftNumbers ? count_true += 1 : left_numbers_should_boolean_message
      !!@rightNumbers == @rightNumbers ? count_true += 1 : right_numbers_should_boolean_message

    rescue ArgumentError
      return should_integer_global_message
    rescue NoMethodError
      return should_integer_global_message
    end
    puts(count_true)
    true if count_true === 9
  end
end