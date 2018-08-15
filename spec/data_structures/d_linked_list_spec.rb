# frozen_string_literal: true

require_relative '../data_structures/d_linked_list'

RSpec.describe 'DoubleLinkedList' do
  let(:list) { DoubleLinkedList.new }

  it 'can instantiate' do
    expect(list).to be_instance_of(DoubleLinkedList)
  end
end
