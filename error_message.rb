module ErrorMessage

  def should_integer_letters_message
    puts('В Поле "Длина букв" должна быть цифрой, типом integer')
  end

  def should_integer_numbers_message
    puts('В Поле "Длина чисел" должна быть цифрой, типом integer')
  end

  def max_value_letters_message
    puts('"Длина числа"  должна быть цифрой, типом integer')
  end

  def max_value_numbers_message
    puts('Длина числа должна быть не больше 30 значений')
  end

  def without_zero_message
    puts('А нолик нельзя !')
  end

  def set_numbers_should_boolean_message
    puts('Поле  "Добавить числа" должен быть только  типом boolean')
  end

  def right_numbers_should_boolean_message
    puts('Поле  "Правые числа" должен быть только типом boolean')
  end

  def left_numbers_should_boolean_message
    puts('Поле  "Левые числа" должен быть только  типом boolean')
  end

  def should_integer_global_message
    puts('Введите в поле  значения типа integer !')
  end

end
