module ErrorMessage

  def should_integer_letters_message
    puts('В Поле "Длина букв" значение  должно быть цифрой, типом integer')
  end

  def should_integer_numbers_message
    puts('В Поле "Длина чисел" значение  должно быть цифрой, типом integer')
  end

  def max_value_letters_message
    puts('В поле "Длина числа" значение должно быть не больше 50')
  end

  def max_value_numbers_message
    puts('В поле "Длина числа" значение должно быть не больше 30')
  end

  def without_zero_message
    puts('А нолик нельзя !')
  end

  def set_numbers_should_boolean_message
    puts('Поле  "Добавить числа" значение должно быть только  типом boolean')
  end

  def right_numbers_should_boolean_message
    puts('Поле  "Правые числа" значение должно быть только типом boolean')
  end

  def left_numbers_should_boolean_message
    puts('Поле  "Левые числа" значение должно только  типом boolean')
  end

  def should_integer_global_message
    puts('Введите в поле  значения типа integer !')
  end

end
