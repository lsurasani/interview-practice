require_relative '../linked_list.rb'
require_relative '../node.rb'
require 'spec_helper'

RSpec.describe Node do
  it 'has a next node' do
    next_node = Node.new(5)
    first_node = Node.new(7, next_node)

    expect(first_node.value).to eq(7)
    expect(first_node.next_node).to eq(next_node)
  end

  it 'updates the next node' do
    node1 = Node.new(1)
    node2 = Node.new(2)

    expect(node2.update(node1)).to eq(node1)
  end
end