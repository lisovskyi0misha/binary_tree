require_relative 'node.rb'

class Tree
  attr_accessor :tree_data, :levels, :queue
  def initialize(data)
    @tree_data = data.sort.uniq
    @levels = {}
    @queue = {}
  end

  def sort(data, n)
    n = n
    new_data = Node.new(data)
    while new_data.data.length > 0
      level = []
      level << new_data.root
      @queue[n + 1] = new_data.right
      if @levels[n] == nil
        @levels[n] = level
      else
        @levels[n] << level[0]
      end
      if new_data.left.length == 1
        if @levels[n + 1] == nil
          @levels[n + 1] = new_data.left
        else
          @levels[n + 1] << new_data.left[0]
        end
        break
      end
      new_data = Node.new(new_data.left)
      n += 1
    end
    @queue.each { |n, lvl| @queue.delete(n) if lvl.empty? }
  end

  def build_tree
    n = 1
    new_data = Node.new(@tree_data)
      self.sort(new_data.data, n)
      until @queue.length == 0
        num = @queue.keys.max
        self.sort(@queue[num], num)
        @queue.delete(num)
      end
  @levels.each { |n, lvl| puts "level ##{n}:  #{lvl}" }
  end
end
