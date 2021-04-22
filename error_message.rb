module ErrorMessage
  def should_integer_letters_message
    puts('В Поле "Длина букв" значение  должно быть цифрой, типом integer')
    false
  end

  def should_integer_numbers_message
    puts('В Поле "Длина чисел" значение  должно быть цифрой, типом integer')
    false
  end

  def max_value_letters_message
    puts('В поле "Длина числа" значение должно быть не больше 50')
    false
  end

  def min_value_letters_messages
    puts('В поле "Длина числа" значение должно быть не меньше 0')
    false
  end

  def max_value_numbers_message
    puts('В поле "Длина числа" значение должно быть не больше 30')
    false
  end

  def min_value_numbers_message
    puts('В поле "Длина числа" значение должно быть не меньше 1')
    false
  end

  def without_zero_message
    puts('А нолик нельзя !')
  end

  def set_numbers_should_boolean_message
    puts('Поле  "Добавить числа" значение должно быть только  типом boolean')
    false
  end

  def right_numbers_should_boolean_message
    puts('Поле  "Правые числа" значение должно быть только типом boolean')
    false
  end

  def left_numbers_should_boolean_message
    puts('Поле  "Левые числа" значение должно только  типом boolean')
    false
  end

  def should_integer_global_message
    puts('Введите в поле  значения типа integer !')
    false
  end



end
