require_relative 'tree.rb'

d = []
21.times do |i|
  d << i + 1
end

f = Tree.new(d)
f.build_tree
