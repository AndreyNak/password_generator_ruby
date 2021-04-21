require_relative 'error_message'
class PasswordGeneration
  include ErrorMessage

  COMBINATION1 = %w[tch ck nk gh tion ture sure igh].freeze
  COMBINATION2 = %w[wh qu wr kn wo wa].freeze
  VOWELS = 'aeiouy'.freeze
  CONSONANTS = 'bcdfghjklmnpqrstvwxz'.freeze

  def initialize(lengthLetters = 5, lengthNumbers = 5, setNumbers = true , leftNumbers = true , rightNumbers = true )
    @lengthLetters = lengthLetters
    @lengthNumbers = lengthNumbers
    @setNumbers = setNumbers
    @leftNumbers = leftNumbers
    @rightNumbers = rightNumbers
  end

  def gen_numbers
    number = ''
    @lengthNumbers.times do
      number += '9'
    end
    rand(number.to_i)
  end

  def error_message(message)
    puts(message)
  end

  def validation_values
    count_true = 0
    begin
      @lengthLetters == @lengthLetters.to_i ? count_true += 1 : should_integer_letters_message
      @lengthLetters <= 50 ? count_true += 1 : max_value_letters_message
      @lengthNumbers == @lengthNumbers.to_i ? count_true += 1 : should_integer_numbers_message
      @lengthNumbers != 0 ? count_true += 1 : without_zero_message
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
    true if count_true === 8
  end

  def gen_letters
    pass = ''
    @lengthLetters.times do |index|
      pass += if index.even?
                CONSONANTS[rand(CONSONANTS.length)]
              else
                VOWELS[rand(VOWELS.length)]
              end
    end
    if pass.length > 10
      elem = COMBINATION1[rand(COMBINATION1.length)]
      pass = pass[0..pass.length - (elem.length + 1)]
      pass += elem
      elem = COMBINATION2[rand(COMBINATION2.length)]
      pass = pass[elem.length..pass.length]
      pass = elem + pass
    end
    pass
  end

  def gen_pass
    if validation_values
      if @setNumbers
        return select_number
      end
      gen_letters
    end
  end

  def select_number
    if @leftNumbers && @rightNumbers
      return gen_numbers.to_s + gen_letters + gen_numbers.to_s
    elsif @leftNumbers
      return gen_numbers.to_s + gen_letters
    elsif @rightNumbers
      return gen_letters + gen_numbers.to_s
    end

    gen_letters
  end
end


gen = PasswordGeneration.new(55,1, true, true , true )

puts(gen.gen_pass())


