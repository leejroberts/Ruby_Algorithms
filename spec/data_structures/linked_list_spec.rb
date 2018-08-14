# frozen_string_literal: true

require 'rspec'
require_relative '../../data_structures/linked_list'

RSpec.describe 'LinkedList' do
  it 'instatiates with a single value' do
    linked_list = LinkedList.new(1)
    expect(linked_list.head.value).to eq(1)
  end

  it 'can have values pushed onto it' do
    linked_list = LinkedList.new()
    linked_list.push(1)
    expect(linked_list.head.value).to eq(1)
    linked_list.push(4)
    expect(linked_list.search(4)).to be(true)
  end

  it 'can search values within it' do
    linked_list = LinkedList.new()
    (1..20).to_a.shuffle.each do |item|
      linked_list.push(item)
    end
    expect(linked_list.search(4)).to be(true)
    expect(linked_list.search(1)).to be(true)
    expect(linked_list.search(19)).to be(true)
    expect(linked_list.search(11)).to be(true)
    expect(linked_list.search(100)).to be(false)
  end

  it 'can remove items' do
    linked_list = LinkedList.new
    (1..20).to_a.shuffle.each do |item|
      linked_list.push(item)
    end
    linked_list.delete(5)
    linked_list.delete(1)
    expect(linked_list.node_count).to eq(18)
    expect(linked_list.delete(100)).to be(false)
    expect(linked_list.node_count).to eq(18)
  end

  it 'can return values using brackets' do
    linked_list = LinkedList.new()
    (1..20).each do |num|
      linked_list.push(num)
    end
    expect(linked_list[0]).to eq(1)
    expect(linked_list[19]).to eq(20)
  end

  it "can set values using brackets" do
    linked_list = LinkedList.new()
    (1..20).each do |num|
      linked_list.push(num)
    end
    linked_list[0] = 2000
    expect(linked_list[0]).to eq(2000)
  end
end
