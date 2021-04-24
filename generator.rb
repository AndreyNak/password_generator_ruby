# frozen_string_literal: true

require_relative 'validation'

# Some documentation about PasswordGeneration
class PasswordGeneration
  include Validation
  COMBINATION1 = %w[tch ck nk gh tion ture sure igh].freeze
  COMBINATION2 = %w[wh qu wr kn wo wa].freeze
  VOWELS = 'aeiouy'
  CONSONANTS = 'bcdfghjklmnpqrstvwxz'

  attr_accessor :length_letters,
                :length_numbers,
                :set_numbers,
                :left_numbers,
                :right_numbers

  def initialize(
    length_letters = 5,
    length_numbers = 5,
    set_numbers = true,
    left_numbers = true,
    right_numbers = true
  )
    @length_letters = length_letters
    @length_numbers = length_numbers
    @set_numbers = set_numbers
    @left_numbers = left_numbers
    @right_numbers = right_numbers
  end

  def gen_pass
    if validation_values
      return select_number if @set_numbers

      gen_letters
    else
      puts(error_message)
    end
  end

  def select_number
    if @left_numbers && @right_numbers
      return gen_numbers.to_s + gen_letters + gen_numbers.to_s
    elsif @left_numbers
      return gen_numbers.to_s + gen_letters
    elsif @right_numbers
      return gen_letters + gen_numbers.to_s
    end

    gen_letters
  end

  private

  def gen_numbers
    rand(10**@length_numbers)
  end

  def gen_letters
    pass = ''
    @length_letters.times do |index|
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

gen = PasswordGeneration.new(1, 0, true, true, true)

puts(gen.gen_pass)

