module ErrorMessage
  def error_message(message)
    puts(message)
  end

  def should_integer_letters_message
    error_message('В Поле "Длина букв" значение  должно быть цифрой, типом integer')
    false
  end

  def should_integer_numbers_message
    error_message('В Поле "Длина чисел" значение  должно быть цифрой, типом integer')
    false
  end

  def max_value_letters_message
    error_message('В поле "Длина числа" значение должно быть не больше 50')
    false
  end

  def min_value_letters_messages
    error_message('В поле "Длина числа" значение должно быть не меньше 0')
    false
  end

  def max_value_numbers_message
    error_message('В поле "Длина числа" значение должно быть не больше 30')
    false
  end

  def min_value_numbers_message
    error_message('В поле "Длина числа" значение должно быть не меньше 1')
    false
  end

  def without_zero_message
    error_message('А нолик нельзя !')
  end

  def set_numbers_should_boolean_message
    error_message('Поле  "Добавить числа" значение должно быть только  типом boolean')
    false
  end

  def right_numbers_should_boolean_message
    error_message('Поле  "Правые числа" значение должно быть только типом boolean')
    false
  end

  def left_numbers_should_boolean_message
    error_message('Поле  "Левые числа" значение должно только  типом boolean')
    false
  end

  def should_integer_global_message
    error_message('Введите в поле  значения типа integer !')
    false
  end

end
