# frozen_string_literal: true

require 'pry'

# Node for BiTree
# origin added to simplify detachment of nodes
class BiNode
  attr_accessor :value, :origin, :left_b, :right_b

  def initialize(value, origin: nil)
    @value = value
    @origin = origin
    @right_b = nil
    @left_b = nil
  end

  def leaf?
    @right_b.nil? && @left_b.nil?
  end

  def only_right?
    @right_b && @left_b.nil?
  end

  def only_left?
    @left_b && @right_b.nil?
  end

  def update_with_attrs_from(other_node)
    @value = other_node.value
    @right_b = other_node.right_b
    @left_b = other_node.left_b
  end

  def detach_from_tree
    return false if @origin.nil? || !leaf?
    if @origin.right_b == self
      @origin.right_b = nil
    else
      @origin.left_b = nil
    end
    @origin = nil
  end
end

class BiTree
  attr_accessor :root, :node_count

  # if initialized with a value it starts with 1 node, else root is nil
  def initialize(initial_value = nil)
    @root = (initial_value.nil? ? nil : BiNode.new(initial_value))
  end

  def no_values?
    @root.nil?
  end

  def add(value)
    return @root = BiNode.new(value) if no_values?

    current_node = @root
    loop do
      # duplicate values are not added
      break nil if value == current_node.value
      # value is less than the value of current node
      if value < current_node.value
        if current_node.left_b.nil?
          break current_node.left_b = BiNode.new(value, origin: current_node)
        else
          current_node = current_node.left_b
        end
      # value is greater than value of current node
      elsif current_node.right_b.nil?
        break current_node.right_b = BiNode.new(value, origin: current_node)
      else
        current_node = current_node.right_b
      end
    end
  end

  # finds the node with the given value
  def find_node(value, current_node: @root)
    if current_node.nil? || current_node.value.nil?
      nil
    elsif value == current_node.value
      current_node
    elsif value > current_node.value
      find_node(value, current_node: current_node.right_b)
    else
      find_node(value, current_node: current_node.left_b)
    end
  end

  # closest node is the node with the value greater than, but closest to the current node
  # take right branch, to go above the follow left_b until no further nodes
  def find_closest_node(current_node)
    candidate_node = current_node.right_b
    candidate_node = candidate_node.left_b while candidate_node.left_b
    candidate_node
  end

  # removes a value from the tree
  # if value is removed returns true else returns false
  def remove(value)
    node = find_node(value)
    return false if node.nil? # value not found in tree

    # if node is a leaf (has no branches)
    # node is deleted or detached
    if node.leaf?
      if node == @root # there is only one value in tree
        @root = nil
      else
        node.detach_from_tree
      end

    # if node has a single branch
    # value, left_b, and right_b are replaced with same values from branch node
    elsif node.only_right?
      node.update_with_attrs_from(node.right_b)
    elsif node.only_left?
      node.update_with_attrs_from(node.left_b)

    # if node has both branches
    # the node with the value closest to and greater than current node's value
    # replaces it
    else
      closest_node = find_closest_node(node)
      node.value = closest_node.value

      # handles closest node detachment from tree or updating
      if closest_node.leaf?
        closest_node.detach_from_tree
      else
        closest_node.update_with_attrs_from(closest_node.right_b)
      end
    end
    true
  end
end
