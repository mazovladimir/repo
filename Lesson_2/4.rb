all = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
glasnie = ['A', 'E', 'I', 'O', 'U', 'Y']
hash = {}
all.each_with_index do |item, index|
  if glasnie.include?(item)
      hash[item] = index+1 
  end
end

puts hash

