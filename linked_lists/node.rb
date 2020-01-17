class Node

  attr_accessor :value
                :node

  def initialize(val = nil, node = nil)
    @value = val
    @node = node
  end

  def next_node
    @node
  end

  def update(node)
    @node = node
  end

end