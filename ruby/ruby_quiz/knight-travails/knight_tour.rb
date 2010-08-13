
start_square = ARGV[0]
end_square = ARGV[1]


def tour(start_square, end_square, *excludes)
  start_letter = start_square[0]
  start_number = start_square[1]

  raise "Illegal chacracter #{start_letter}" unless (97..104).include?(start_letter)
  raise "Illegal number #{start_number}" unless (49..56).include?(start_number)

  start_letter += 2
  start_number += 1

  excludes.include?(end_square) ? nil : [end_square]
end




