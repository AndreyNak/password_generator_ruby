# frozen_string_literal: true

require_relative 'validation'

class PasswordGeneration
  include Validation
  COMBINATION1 = %w[tch ck nk gh tion ture sure igh].freeze
  COMBINATION2 = %w[wh qu wr kn wo wa].freeze
  VOWELS = 'aeiouy'
  CONSONANTS = 'bcdfghjklmnpqrstvwxz'

  def initialize(
    lengthLetters = 5,
    lengthNumbers = 5,
    setNumbers = true,
    leftNumbers = true,
    rightNumbers = true
  )
    @lengthLetters = lengthLetters
    @lengthNumbers = lengthNumbers
    @setNumbers = setNumbers
    @leftNumbers = leftNumbers
    @rightNumbers = rightNumbers
  end

  def gen_pass
    if validation_values
      return select_number if @setNumbers

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

  private

  def gen_numbers
    rand(10**@lengthNumbers)
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
end

gen = PasswordGeneration.new(2, 5, true, true, true)

puts(gen.gen_pass)

