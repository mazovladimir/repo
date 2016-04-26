all = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
glasnie = ['A', 'E', 'I', 'O', 'U', 'Y']
hash = {}
all.each_index do |a|
  all.include?(glasnie)
      hash[a+1] = all[a] if all[a] == glasnie
end

puts hash

