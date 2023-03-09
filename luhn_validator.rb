module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def luhn(digit, index)
    res = index.odd? ? digit * 2 : digit
    res.to_s.chars.map(&:to_i).sum
  end

  def validate_checksum
    digit_list = number.to_s.chars.map(&:to_i)
    digit_list_rev = digit_list.reverse

    sr_code = digit_list_rev.each_with_index.map { |digit, index| luhn(digit, index) }

    check_sum = sr_code.sum

    (check_sum % 10).zero?
    # TODO: use the integers in nums_a to validate its last check digit
  end
end
