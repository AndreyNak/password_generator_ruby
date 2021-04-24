# frozen_string_literal: true

require_relative 'error_message'

# Some documentation about Validation
module Validation
  include ErrorMessage

  def validation_values
    begin
      return false if @length_letters == @length_letters.to_i ? false : should_integer_letters_message
      return false if @length_letters <= 50 ? false : max_value_letters_message
      return false if @length_letters >= 0 ? false : min_value_letters_messages
      return false if @length_numbers == @length_numbers.to_i ? false : should_integer_numbers_message
      return false if @length_numbers >= 1 ? false : min_value_numbers_message
      return false if @length_numbers <= 30 ? false : max_value_numbers_message
      return false if !!@set_numbers == @set_numbers ? false : set_numbers_should_boolean_message
      return false if !!@left_numbers == @left_numbers ? false : left_numbers_should_boolean_message
      return false if !!@right_numbers == @right_numbers ? false : right_numbers_should_boolean_message

    rescue ArgumentError
      return should_integer_global_message
    rescue NoMethodError
      return should_integer_global_message
    end

    true
  end
end
