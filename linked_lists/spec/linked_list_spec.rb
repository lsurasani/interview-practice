require_relative '../linked_list.rb'
require_relative '../node.rb'
require 'spec_helper'

RSpec.describe LinkedList do
  it 'creates a list using a node' do
    node = Node.new(5)
    list = LinkedList.new(node)
    expect(list).to be_instance_of(LinkedList)
  end

  it 'returns the correct length' do
    node1 = Node.new(1)
    node2 = Node.new(2, node1)
    node3 = Node.new(3, node2)
    list = LinkedList.new(node3)
    expect(list.length).to eq(3)
  end

  it 'appends' do
    node1 = Node.new(1)
    node2 = Node.new(2, node1)
    node3 = Node.new(3, node2)
    list = LinkedList.new(node3)
    new_tail = Node.new(5)
    list.append(new_tail)

    expect(list.tail.value).to eq(new_tail.value)
    expect(list.length).to eq(4)
  end

  it 'prepends' do
    node1 = Node.new(1)
    node2 = Node.new(2, node1)
    node3 = Node.new(3, node2)
    list = LinkedList.new(node3)
    new_head = Node.new(5)
    list.prepend(new_head)

    expect(list.head.value).to eq(new_head.value)
    expect(list.length).to eq(4)
  end

  it 'finds node at' do
    node1 = Node.new(1)
    node2 = Node.new(2, node1)
    node3 = Node.new(3, node2)
    list = LinkedList.new(node3)

    expect(list.at(0)).to eq(list.head)
    expect(list.at(list.length - 1)).to eq(list.tail)
    expect(list.at(1).value).to eq(2)
    expect(list.at(-1)).to be_nil
    expect(list.at(list.length)).to be_nil
  end

  it 'pops' do
    node1 = Node.new(1)
    node2 = Node.new(2, node1)
    node3 = Node.new(3, node2)
    list = LinkedList.new(node3)

    expect(list.pop.value).to eq(1)
    expect(list.pop.value).to eq(2)
    expect(list.pop.value).to eq(3)
    expect(list.length).to eq(0)
  end

  it 'contains?' do
    node1 = Node.new(1)
    node2 = Node.new(2, node1)
    node3 = Node.new(3, node2)
    list = LinkedList.new(node3)

    expect(list.contains?(1)).to be true
    list.pop
    expect(list.contains?(1)).to be false

    list.append(Node.new(1))
    expect(list.contains?(1)).to be true
  end

  it 'finds' do
    node1 = Node.new(1)
    node2 = Node.new(2, node1)
    node3 = Node.new(3, node2)
    list = LinkedList.new(node3)

    expect(list.find(3)).to eql(list.head)
    expect(list.find(1)).to eql(list.tail)
    expect(list.find(7)).to be_nil
  end

  it 'stringifies' do
    node1 = Node.new(1)
    node2 = Node.new(2, node1)
    node3 = Node.new(3, node2)
    list = LinkedList.new(node3)

    string = '3 -> 2 -> 1 -> nil'
    expect(list.to_s).to eql(string)

    list.pop
    expect(list.to_s).to eql('3 -> 2 -> nil')

    list.append(Node.new(5))
    expect(list.to_s).to eql('3 -> 2 -> 5 -> nil')

    list.prepend(Node.new(0))
    expect(list.to_s).to eql('0 -> 3 -> 2 -> 5 -> nil')
  end

  it 'inserts node at' do
    node1 = Node.new(1)
    list = LinkedList.new(node1)

    list.insert_at(Node.new(2), 0)
    expect(list.head.value).to eql(2)
    expect(list.length).to eql(2)

    list.insert_at(Node.new(3), 2)
    expect(list.tail.value).to eql(3)
    expect(list.length).to eql(3)
    
    list.insert_at(Node.new(-1), 4)
    expect(list.length).to eql(3)

    list.insert_at(Node.new(-1), -1)
    expect(list.length).to eql(3)
  end

  it 'removes node at' do
    node1 = Node.new(1)
    list = LinkedList.new(node1)

    expect(list.remove_at(list.length)).to be_nil
    expect(list.remove_at(0)).to eql(node1)
    expect(list.length).to eql(0)

    list.append(Node.new(5))
    list.append(Node.new(7))
    list.append(Node.new(9))
    expect(list.length).to eql(3)

    expect(list.remove_at(list.length - 1).value).to eql(9)
    expect(list.length).to eql(2)
    expect(list.remove_at(-1)).to be_nil
  end
end