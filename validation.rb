# frozen_string_literal: true

require_relative 'error_message'

# Some documentation about Validation
module Validation
  include ErrorMessage

  def validation_values
    begin
      valid_mass = [
        @length_letters == @length_letters.to_i ? true : should_integer_letters_message,
        @length_letters <= 50 ? true : max_value_letters_message,
        @length_letters >= 0 ? true : min_value_letters_messages,
        @length_numbers == @length_numbers.to_i ? true : should_integer_numbers_message,
        @length_numbers >= 1 ? true : min_value_numbers_message,
        @length_numbers <= 30 ? true : max_value_numbers_message,
        !!@set_numbers == @set_numbers ? true : set_numbers_should_boolean_message,
        !!@left_numbers == @left_numbers ? true : left_numbers_should_boolean_message,
        !!@right_numbers == @right_numbers ? true : right_numbers_should_boolean_message
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
