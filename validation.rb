require_relative 'error_message'
module Validation
  include ErrorMessage

  def validation_values
    begin
      valid_mass = [
        @lengthLetters == @lengthLetters.to_i ? true : should_integer_letters_message,
        @lengthLetters <= 50 ? true : max_value_letters_message,
        @lengthLetters >= 0 ? true : max_value_letters_message,
        @lengthNumbers == @lengthNumbers.to_i ? true : should_integer_numbers_message,
        @lengthNumbers >= 1 ? true : min_value_numbers_message,
        @lengthNumbers <= 30 ? true : max_value_numbers_message,
        !!@setNumbers == @setNumbers ? true : set_numbers_should_boolean_message,
        !!@leftNumbers == @leftNumbers ? true : left_numbers_should_boolean_message,
        !!@rightNumbers == @rightNumbers ? true : right_numbers_should_boolean_message
      ]

    rescue ArgumentError
      return should_integer_global_message
    rescue NoMethodError
      return should_integer_global_message
    end
    return false if valid_mass.include?(false)

    true

  end
end
