# frozen_string_literal: true

require '../../data_structures/bi_tree'

RSpec.xdescribe 'bi_tree' do
  let(:bi_tree) { BiTree.new }
  it 'can initiialize' do
    expect(bi_tree).to be_instance_of(BiTree)
  end
end
