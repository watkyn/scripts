require 'java'

import java.text

locs = []
java.text.SimpleDateFormat.availableLocales.each do |loc|
    locs << loc.to_s
end

puts locs.select { |loc| /fr/ =~ loc }
puts locs.select { |loc| /nl/ =~ loc }
puts locs.select { |loc| /en/ =~ loc }

