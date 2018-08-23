# frozen_string_literal: true

require_relative '../../data_structures/bi_tree'

RSpec.describe BiTree do
  let(:bi_tree) { BiTree.new }
  let(:bi_tree_mult_values) { BiTree.new }
  let(:bi_tree_lots_values) { BiTree.new }

  before(:example) do
    (1..10).to_a.shuffle.each { |num| bi_tree_mult_values.add(num) }
    (1..100).to_a.shuffle.each { |num| bi_tree_lots_values.add(num) }
  end

  it 'can initialize' do
    expect(bi_tree).to be_instance_of(BiTree)
  end

  it 'can add a value' do
    bi_tree.add(10)
    bi_tree.add(20)
    expect(bi_tree.root.value).to eq(10)
    expect(bi_tree.find_node(20).value).to eq(20)
  end

  it 'can add multiple values' do
    (1..10).to_a.each do |num|
      expect(bi_tree_mult_values.find_node(num).value).to eq(num)
    end
  end

  it 'returns nil if value not present' do
    expect(bi_tree_mult_values.find_node(12)).to be_nil
  end

  it 'returns a node with the given value if value present' do
    expect(bi_tree_mult_values.find_node(5).value).to eq(5)
    expect(bi_tree_lots_values.find_node(22).value).to eq(22)
  end

  it 'can remove the root node' do
    bi_tree.add(20)
    bi_tree.remove(20)
    expect(bi_tree.find_node(20)).to be_nil
  end

  it 'can remove a leaf node' do
    bi_tree.add(10)
    bi_tree.add(20)
    bi_tree.remove(20)
    expect(bi_tree.find_node(10)).to be_truthy
    expect(bi_tree.find_node(20)).to be_falsy
  end

  it 'can remove a node with a right branch' do
    bi_tree.add(10)
    bi_tree.add(20)
    bi_tree.add(30)
    bi_tree.remove(20)
    expect(bi_tree.find_node(20)).to be_falsy
    expect(bi_tree.find_node(10)).to be_truthy
    expect(bi_tree.find_node(30)).to be_truthy
  end

  it 'can remove a node with a left branch' do
    bi_tree.add(10)
    bi_tree.add(20)
    bi_tree.add(15)
    bi_tree.remove(20)
    expect(bi_tree.find_node(20)).to be_falsy
    expect(bi_tree.find_node(10)).to be_truthy
    expect(bi_tree.find_node(15)).to be_truthy
  end

  it 'can remove a node with both branches' do
    bi_tree.add(10)
    bi_tree.add(20)
    bi_tree.add(30)
    bi_tree.add(15)
    bi_tree.remove(20)
    expect(bi_tree.find_node(20)).to be_falsy
    expect(bi_tree.find_node(10)).to be_truthy
    expect(bi_tree.find_node(30)).to be_truthy
    expect(bi_tree.find_node(15)).to be_truthy
  end

  it 'can remove a node and value' do
    bi_tree.add(10)
    bi_tree.add(20)
    bi_tree.remove(10)
    expect(bi_tree.find_node(5)).to be_falsy
  end

  it 'can remove a node and value' do
    bi_tree_mult_values.remove(5)
    expect(bi_tree_mult_values.find_node(5)).to be_nil
    (1..10).to_a.reject { |num| num == 5 }.each do |num|
      expect(bi_tree_mult_values.find_node(num)).to be_truthy
    end
  end

  # full search is performed multiple times to catch different types of breaks
  it 'can find all values with a value removed' do
    10.times do
      lots_of_values = (1..100).to_a.shuffle!
      popped_value = lots_of_values.pop
      bi_tree_lots_values.remove(popped_value)
      lots_of_values.each do |num|
        expect(bi_tree_lots_values.find_node(num).value).to eq(num)
      end
      # resets for next round
      bi_tree_lots_values.add(popped_value)
    end
  end
end
