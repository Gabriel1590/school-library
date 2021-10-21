class Corrector
  def correct_name(name)
    # Make sure the first letter of the given name is a capital letter.
    # Make sure that the name has a maximum of 10 characters. If it's longer it should trim the word.
    name.capitalize[0...10]
  end
end
