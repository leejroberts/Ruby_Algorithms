# frozen_string_literal: true

class Node
  attr_accessor :value

  def initialize(value)
    @value = value
    @right_b = nil
    @left_b = nil
  end
end

class BiTree
  def initialize(initial_value = nil)
    @root = Node.new(initial_value)
    @node_count = 0
  end

  def add(value, current_node = @root, previous_node = nil)
    if current_node && current_node.value.nil?
      current_node.value = value
    elsif current_node && current_node.value == value
      nil
    elsif current_node.nil?
      new_node = Node.new(value)
      if previous_node.value < value
        previous_node.left_b = new_node
      else
        previous_node.right_b = new_node
      end
    elsif current_node.value > value
      previous_node = current_node
      current_node = current_node.left_b
      add(value, current_node, previous_node)
    else
      previous_node = current_node
      current_node = current_node.right_b
      add(value, current_node, previous_node)
    end
  end
end
