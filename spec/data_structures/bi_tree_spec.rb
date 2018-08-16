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

  it 'can initiialize' do
    expect(bi_tree).to be_instance_of(BiTree)
  end

  it 'can add a value' do
    bi_tree.add(10)
    bi_tree.add(20)
    expect(bi_tree.root.value).to eq(10)
    expect(bi_tree.node_count).to eq(2)
  end

  it 'can add multiple values' do
    expect(bi_tree_mult_values.node_count).to eq(10)
  end

  it 'will not add duplicate values' do
    bi_tree_mult_values.add(10)
    expect(bi_tree_mult_values.node_count).to eq(10)
  end

  it 'returns nil if value not present' do
    expect(bi_tree_mult_values.find_node(12)).to be_nil
  end

  it 'returns a node with the given value if value present' do
    expect(bi_tree_mult_values.find_node(5).value).to eq(5)
    expect(bi_tree_lots_values.find_node(22).value).to eq(22)
  end

  it 'returns a count for all nodes' do
    expect(bi_tree_mult_values.count_nodes).to eq(10)
  end

  it 'can remove the value from a single node' do
    bi_tree.add(20)
    bi_tree.remove(20)
    expect(bi_tree.find_node(20)).to be_falsy
    expect(bi_tree.node_count).to eq(1)
  end

  it 'can remove a node and value' do
    bi_tree.add(10)
    bi_tree.add(20)
    bi_tree.remove(10)
    expect(bi_tree.find_node(5)).to be_falsy
    expect(bi_tree.count_nodes).to eq(1)
  end

  it 'can remove a node and value' do
    bi_tree_mult_values.remove(5)
    expect(bi_tree_mult_values.find_node(5)).to be_nil
    expect(bi_tree_mult_values.count_nodes).to eq(9)
  end
end
