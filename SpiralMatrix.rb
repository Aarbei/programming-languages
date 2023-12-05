# This program is an individual task of creating a matrix with given size 
# and fills it with numbers in spiral order

def fill_matrix(spiral, n) 
num = n * n
(0...n / 2).each do |k|
  edge = n - 1 - k

  edge.downto(k + 1) { |i| spiral[i][k] = num -= 1 }
  k.upto(edge - 1) { |j| spiral[k][j] = num -= 1 }
  k.upto(edge - 1) { |i| spiral[i][edge] = num -= 1 }
  edge.downto(k + 1) { |j| spiral[edge][j] = num -= 1 }
end

if n.odd? && num > 1
  spiral[n / 2][n / 2] = num
  num -= 1
end

puts "Your spiral matrix:"

n.times do |i|
  (n - 1).downto(0) { |j| print "%6d" % spiral[i][j] }
  puts
end
end

puts "Enter the size of the matrix:"
n = gets.to_i

spiral = Array.new(n) { Array.new(n, 0) }
fill_matrix spiral, n