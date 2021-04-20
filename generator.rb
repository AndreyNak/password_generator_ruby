class PasswordGeneration
  def initialize(options)
    @lengthLetters = options['lengthLetters']
    @lengthNumbers = options['lengthNumbers']
    @setNumbers = options['setNumbers']
    @leftNumbers = options['leftNumbers']
    @rightNumbers = options['rightNumbers']
  end

  def genNumbers
    number = ''
    index = 0
    while index < @lengthNumbers
      index += 1
      number += '9'
    end
    number.to_i
  end

  def genLetters
    combination1 = ['tch', 'ck', 'nk', 'gh', 'tion', 'ture', 'sure', 'igh']
    combination2 = ['wh', 'qu', 'wr', 'kn', 'wo', 'wa']
    vowels = "aeiouy"
    consonants = "bcdfghjklmnpqrstvwxz"
    pass = ''

    for index in (0..@lengthLetters - 1)
      if index % 2 == 0
        pass += consonants[rand(consonants.length)]
      else
        pass += vowels[rand(vowels.length)]
      end
    end
    if pass.length > 10
      elem = combination1[rand(combination1.length)]
      pass = pass[0..pass.length - (elem.length + 1)]
      pass += elem
      elem = combination2[rand(combination2.length)]
      pass = pass[elem.length..pass.length]
      pass = elem + pass
    end
    pass
  end

  def genPass
    if @setNumbers
      return selectNumber
    end
    genLetters
  end

  def selectNumber
    if @leftNumbers && @rightNumbers
      return rand(genNumbers).to_s + genLetters + rand(genNumbers).to_s
    elsif @leftNumbers
      return rand(genNumbers).to_s + genLetters
    elsif @rightNumbers
      return genLetters + rand(genNumbers).to_s
    end
    genLetters

  end
end


gen = PasswordGeneration.new(
  {
    'lengthLetters' => 4,
    'lengthNumbers' => 6,
    'setNumbers' => false,
    'leftNumbers' => true,
    'rightNumbers' => false
  }
)

print(gen.genPass)

