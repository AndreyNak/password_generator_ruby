module ErrorMessage
  def error_message
    'Error Validation'
  end

  def should_integer_letters_message
    'Only integer type in the "length_letters" field'
  end

  def should_integer_numbers_message
    'Only integer type in the "length_numbers" field'
  end

  def max_value_letters_message
    'Max value 50 in the field "length_letters"'
  end

  def min_value_letters_messages
    'Min value 0 in the field "length_letters"'
  end

  def max_value_numbers_message
    'Max value 30 in the field "length_numbers'
  end

  def min_value_numbers_message
    'Min value 1 in the field "length_numbers"'
  end

  def set_numbers_should_boolean_message
    'The field "set_numbers" value must only be of type boolean'
  end

  def right_numbers_should_boolean_message
    'The field "right_numbers" value must only be of type boolean'
  end

  def left_numbers_should_boolean_message
    'The field "left_numbers" value must only be of type boolean'
  end

  def should_integer_global_message
    'Only type integer'
  end
end
