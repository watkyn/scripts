Thread.new {
  60.times do
    sleep(0.75)
    puts "this is a different thread"
  end
}

7.times do
  sleep(1)
  puts "working in main thread"
end


