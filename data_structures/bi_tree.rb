# frozen_string_literal: true

require 'pry'

class BiNode
  attr_accessor :value, :left_b, :right_b

  def initialize(value = nil)
    @value = value
    @right_b = nil
    @left_b = nil
  end
end

class BiTree
  attr_accessor :root, :node_count
  def initialize(initial_value = nil)
    @root = BiNode.new(initial_value)
    @node_count = 1
  end

  def has_no_values?
    @root.value.nil?
  end

  def add(value, current_node: @root, previous_node: nil)
    return @root.value = value if has_no_values?

    if current_node.nil?
      @node_count += 1
      if value > previous_node.value
        return previous_node.right_b = BiNode.new(value)
      else
        return previous_node.left_b = BiNode.new(value)
      end
    elsif value == current_node.value
      return nil
    elsif value > current_node.value
      return add(value, previous_node: current_node, current_node: current_node.right_b)
    else
      return add(value, previous_node: current_node, current_node: current_node.left_b)
    end
  end

  def find_node(value, current_node = @root)
    if current_node.nil? || current_node.value.nil?
      nil
    elsif value == current_node.value
      current_node
    elsif value > current_node.value
      find_node(value, current_node.right_b)
    else
      find_node(value, current_node.left_b)
    end
  end

  def move_pointers(to_node, from_node)
    to_node.value = from_node.value
    to_node.right_b = from_node.right_b
    to_node.left_b = from_node.left_b
  end

  def find_closest_node(current_node)
    return current_node if current_node.left_b.nil?
    find_closest_node(current_node.left_b)
  end

  def remove(value)
    node = find_node(value)
    return false if node.nil?

    right_b = node.right_b
    left_b = node.left_b
    if right_b && left_b.nil?
      move_pointers(node, right_b)
    elsif left_b && right_b.nil?
      move_pointers(node, left_b)
    else
      closest_node = find_closest_node(right_b)
      node.value = closest_node.value
      move_pointers(closest_node, closest_node.right_b) if closest_node.right_b
    end
    true
  end

  def count_nodes(current_node = @root, seen = [])
    seen << current_node
    node_left = current_node.right_b
    node_right = current_node.left_b
    count_nodes(node_left, seen) if node_left
    count_nodes(node_right, seen) if node_right
    seen.length
  end
end
