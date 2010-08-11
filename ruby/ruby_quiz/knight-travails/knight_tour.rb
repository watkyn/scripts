
start_square = ARGV[0]
end_square = ARGV[1]


def tour(start_square, end_square)
  start_letter = start_square[0]
  start_number = start_square[1]

  raise "Illegal chacracter #{start_letter}" if start_letter < 97

  start_letter += 2
  start_number += 1

  ["c3"]
end




