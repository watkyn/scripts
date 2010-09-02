require 'knight'

start_square = ARGV[0]
end_square = ARGV[1]


def tour(start_square, end_square, *forbidden)
  start_letter = start_square[0]
  start_number = start_square[1]

  raise "Illegal chacracter #{start_letter}" unless (97..104).include?(start_letter)
  raise "Illegal number #{start_number}" unless (49..56).include?(start_number)

  forbidden.include?(end_square) ? nil : [end_square]
  forbidden << start_square 

  index = 0
  path_tracker = { index => [start_square] }
  puts path_tracker[index].size
  until path_tracker[index].empty? or path_tracker[index].include?(end_square) do
    index += 1
    path_tracker[index] = path_tracker[index - 1].inject([]) do |arr, square|
      arr.concat(Knight.all_moves(square, *forbidden))
    end
    forbidden.concat(path_tracker[index])
  end

  path_tracker[path_tracker.size - 1] 
end




