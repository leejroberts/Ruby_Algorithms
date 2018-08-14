

# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head, :node_count
  def initialize(starting_value = nil)
    @head = Node.new(starting_value)
    @node_count = 1
  end

  def search(value, current_node = head)
    if !current_node || (current_node && !current_node.value)
      false
    elsif current_node.value == value
      true
    else
      search(value, current_node.next_node)
    end
  end

  def push(value)
    if !head.value # if head is valueless, thus the only node
      head.value = value
    else
      previous_tail_node = return_node(node_count - 1)
      new_tail_node = Node.new(value)
      previous_tail_node.next_node = new_tail_node
      @node_count += 1
    end
  end

  def return_node(index)
    current_node = head
    counter = 0
    while counter < index
      current_node = current_node.next_node
      counter += 1
    end
    current_node
  end

  def [](index)
    update_node = return_node(index)
    return unless update_node
    update_node.value
  end

  def []=(index, value)
    update_node = return_node(index)
    return unless update_node
    update_node.value = value
  end

  def insert(value, index)
    return false if index.negative? || index >= node_count

    if index.zero? && !head.value
      head.value = value
    else
      node_before_index = return_node(index - 1)
      node_at_index = node_before.next_node
      insert_node = Node.new(value, current_node)
      node_before_index.next_node = insert_node
      insert_node.next_node = node_at_index
    end
    @node_count += 1
    true
  end

  def delete_head
    if @head.next_node
      @head = @head.next_node
      @node_count -= 1
    else
      @head.value = nil
    end
    true
  end

  def delete(index)
    return false if index.negative? || index >= @node_count

    if index.zero?
      delete_head
    else
      node_before_index = return_node(index - 1)
      node_at_index = node_before_index.next_node
      node_before_index.next_node = node_at_index.next_node
      @node_count -= 1
    end
    true
  end
end
