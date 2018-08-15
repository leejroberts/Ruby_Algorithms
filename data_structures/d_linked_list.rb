# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node, :previous_node
  def initialize(value = nil, next_node = nil, previous_node = nil)
    @value = value
    @next_node = next_node
    @previous_node = previous_node
  end
end

class DoubleLinkedList
  def initialize(starting_value = nil)
    @head = Node.new(starting_value)
    @tail = @head
  end

  def add(value)
    if @head.value.nil?
      @head.value = value
    else
      new_node = Node.new(value, previous_node = @tail)
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def length
    node_count = 0
    current_node = @head
    node_count += 1 while current_node
    node_count
  end

  def insert(value, index)
    return false if index > length - 1
    list_index = 0
    after_node = node_at_index(index)
    if after_node.value.nil?
      after_node.value = value
    elsif after_node.previous_node
      before_node = after_node.previous_node
      insert_node = Node.new(value, previous_node = before_node, next_node = after_node)
      before_node.next_node = insert_node
      after_node.previous_node = insert_node
    end
  end

  def include?(value)
    node_with_value(value) ? true : false
  end

  def node_with_value(value)
    current_node = @head
    while current_node&.value
      if current_node.value == value
        return current_node
      else
        current_node = current_node.next_node
      end
    end
    false
  end

  private

  def node_at_index(index)
    list_index = 0
    current_node = @head
    until list_index == index
      list_index += 1
      current_node = current_node.next_node
    end
    current_node
  end
end
