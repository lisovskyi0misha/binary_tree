class Node
  attr_accessor :root, :data, :right, :left
  def initialize(data)
    @data = data
    @root = self.set_root
    if @data[...@data.index(@root)].length > 1
      @left = @data[...@data.index(@root)]
      @right = @data[@data.index(@root) + 1...]
    else
      if @root == @data.first
        @left = []
      else
        @left = [@data.first]
      end
      if @data.last == @root
        @right = []
      else
        @right = [@data.last]
      end
    end
  end

  def set_root
    if @data.length.even?
      root_it = @data[@data.length / 2]
    else
      root_it = @data[@data.length / 2]
    end
    root_it
  end
end
