class LinkedList

  attr_accessor :head
                :tail

  def initialize(initial_node)
    @head = initial_node
  end

  def append(node)
    unless @head
      @head = node and return
    end

    pointer = @head
    start = @head
    while pointer.next_node
      pointer = pointer.next_node
    end
    pointer.update(node)
    node
  end

  def length
    return 0 unless head

    count = 1
    start = @head
    while start.next_node
      count += 1
      start = start.next_node
    end
    count
  end

  def prepend(node)
    unless @head
      @head = node and return
    end
    initial_head = @head
    node.update(initial_head)
    @head = node
    node
  end

  def tail
    pointer = @head
    while pointer.next_node
      pointer = pointer.next_node
    end
    pointer
  end

  def at(index)
    return if index < 0

    pointer = @head
    while index > 0
      pointer = pointer.next_node
      return unless pointer
      index -= 1
    end
    pointer
  end

  def pop
    pointer = @head
    return unless pointer

    removed = nil
    while pointer.next_node
      current = pointer
      node = pointer.next_node
      pointer = pointer.next_node and next if node.next_node
      
      removed = node
      pointer.update(nil)
    end

    unless removed
      self.head = nil
    end
    removed || pointer
  end

  def contains?(value)
    pointer = @head
    while pointer.next_node
      return true if pointer.value == value
      pointer = pointer.next_node
    end

    return true if pointer.value == value

    false
  end

  def find(value)
    pointer = @head
    while pointer.next_node
      return pointer if pointer.value == value
      pointer = pointer.next_node
    end

    return pointer if pointer.value == value
    nil
  end

  def to_s
    string = ''

    pointer = @head
    while pointer.next_node
      string += "#{pointer.value.to_s} -> "
      pointer = pointer.next_node
    end

    string += "#{pointer.value.to_s} -> nil"
  end

  def insert_at(node, index)
    return nil if index > length || index < 0

    return append(node) if index == length
    return prepend(node) if index == 0

    pointer = @head
    while index > 1
      pointer = pointer.next_node
      index -= 1
    end

    next_node = pointer.next_node
    pointer.update(node)
    node.update(next_node)
    node
  end

  def remove_at(index)
    if index == 0
      to_remove = @head
      @head = @head.next_node
      return to_remove
    end

    return nil if index > length - 1 || index < 0

    return pop if index == length

    pointer = @head
    while index > 1
      pointer = pointer.next_node
      index -= 1
    end

    to_remove = pointer.next_node
    next_node = to_remove.next_node
    pointer.update(next_node)
    to_remove
  end

end