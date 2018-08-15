# frozen_string_literal: true

class Node
  attr_accessor :value, :previous_node, :next_node
  def initialize(value = nil, previous_node = nil, next_node = nil)
    @value = value
    @previous_node = previous_node
    @next_node = next_node
  end
end

class DoubleLinkedList
  attr_reader :head, :tail, :node_count

  def initialize(starting_value = nil)
    @head = Node.new(starting_value)
    @tail = @head
    @node_count = 1
  end

  # returns the value at the index
  def [](index)
    node = node_at_index(index)
    node.value
  end

  # sets the value at the index
  def []=(index, value)
    node = node_at_index(index)
    return false unless node.is_a?(Node)
    node_at_index(index).value = value
  end

  # adds the value to a Node, adds the node to the end of the list
  def push(value)
    @head.value.nil? ? @head.value = value : add_tail(value)
    @node_count
  end

  # same as push
  def <<(value)
    push(value)
  end

  # returns the last value, removes the last node if @node_count > 1
  def pop
    if @node_count > 1
      value = @tail.value
      remove_tail
    else
      value = @head.value
      @head.value = nil
    end
    value
  end

  # adds value to the front of list
  def shift(value)
    @head.value ? add_head(value) : head.value = value
  end

  # returns the first value from the list, removes the node if @node_count > 1
  def unshift
    if @node_count > 1
      value = @head.value
      remove_head
    else
      value = @head.value
      @head.value = nil
    end
    value
  end

  # will remove the first node containing the value
  def remove(value)
    node_to_remove = node_with_value(value)
    return false unless node_to_remove
    remove_node(node_to_remove)
  end

  def remove_node(node)
    return false unless node.is_a?(Node) && @node_count > 1

    if remove_node === @head
      remove_head
    elsif remove_node === @tail
      remove_tail
    else
      before_node = node.next_node
      after_node = node.next_node
      join_nodes(before_node, after_node)
    end
    @node_count -= 1
  end

  def join_nodes(node_1, node_2)
    node_1.next_node = node_2
    node_2.previous_node = node_1
  end

  def length
    @head.value ? @node_count : 0
  end

  def insert(value, index)
    return false if out_of_range(index)
    after_node = node_at_index(index)
    if after_node.value.nil?
      after_node.value = value
    else
      before_node = after_node.previous_node
      insert_node = Node.new(value, before_node, after_node)
      before_node.next_node = insert_node
      after_node.previous_node = insert_node
      @node_count += 1
    end
    @node_count
  end

  def include?(value)
    node_with_value(value) ? true : false
  end

  private

  # returns the first node with the given value
  def node_with_value(value)
    current_node = @head
    while current_node.value
      return current_node if current_node.value == value
      current_node = current_node.next_node
    end
  end

  # returns the node at the given index
  def node_at_index(index)
    return nil if out_of_range(index)
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node
  end

  def out_of_range(index)
    index > node_count - 1 || index < 0
  end

  def remove_head
    return false unless @node_count > 1
    @head = @head.next_node
    @node_count -= 1
  end

  def remove_tail
    return false unless @node_count > 1
    @tail = @tail.previous_node
    @node_count -= 1
  end

  def add_head(value)
    new_head = Node.new(value, next_node = @head)
    @head.previous_node = new_head
    @head = new_head
    @node_count += 1
  end

  def add_tail(value)
    new_tail = Node.new(value, previous_node = @tail)
    @tail.next_node = new_tail
    @tail = new_tail
    @node_count += 1
  end
end
