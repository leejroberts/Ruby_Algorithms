# frozen_string_literal: true

require_relative '../../data_structures/d_linked_list'
RSpec.describe 'DoubleLinkedList' do
  let(:list) { DoubleLinkedList.new }
  let(:list_w_value) { DoubleLinkedList.new(10) }
  let(:list_zero_to_ten) { DoubleLinkedList.new }

  before(:example) do
    (0..10).each { |num| list_zero_to_ten << num }
  end

  it 'can instantiate' do
    expect(list).to be_instance_of(DoubleLinkedList)
  end

  it 'can instantiate with a starting value' do
    expect(list_w_value.head.value).to eq(10)
    expect(list_w_value.tail.value).to eq(10)
  end

  it 'can push a value to an empty list' do
    list << 'only value'
    expect(list.head.value).to eq('only value')
    expect(list.tail.value).to eq('only value')
    expect(list.length).to eq(1)
  end

  it 'can push a value to the end' do
    list_w_value.push('new_tail_value')
    expect(list_w_value.tail.value).to eq('new_tail_value')
    expect(list_w_value.length).to eq(2)
  end

  it 'can push values to the end using <<' do
    list_w_value << 'new_new_tail'
    expect(list_w_value.tail.value).to eq('new_new_tail')
    expect(list_w_value.length).to eq(2)
    list_w_value << 'final_tail'
    expect(list_w_value.length).to eq(3)
  end

  it 'returns the correct length' do
    expect(list_zero_to_ten.length).to eq(11)
  end

  it 'can have values added with push and return values with []' do
    (0..10).each do |num_and_index|
      expect(list_zero_to_ten[num_and_index]).to eq(num_and_index)
    end
  end

  it 'can set values with []' do
    list_zero_to_ten[5] = 'steve'
    expect(list_zero_to_ten[5]).to eq('steve')
  end

  it 'will return false if the index is outside of range' do
    expect(list.insert('Ally', 11)).to be(false)
  end

  it 'will set values at zero index if there is not one' do
    list.insert('Ally', 0)
    expect(list[0]).to eq('Ally')
  end
end
