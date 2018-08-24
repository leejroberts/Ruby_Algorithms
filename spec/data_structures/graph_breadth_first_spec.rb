# frozen_string_literal: true

require 'rspec'
require_relative '../../data_structures/graph_breadth_first.rb'

RSpec.describe 'Person' do
  let(:person) { Person.new('steve') }
  let(:person_2) { Person.new('john') }

  it 'can instantiate' do
    expect(person).to be_truthy
  end

  it 'can add friend object' do
    person.add_friend(person_2)
    expect(person.friends.first).to eq(person_2)
  end

  it 'will not add string as friend' do
    person.add_friend('steve')
    expect(person.friends.first).to be_nil
  end
end

RSpec.describe 'Network' do
  let(:person) { Person.new('steve') }
  let(:network) { Network.new }
  let(:network_member) { Network.new(Person.new('steve')) }

  it 'can instantiate' do
    expect(network).to be_an_instance_of(Network)
  end

  it 'can add a member to the network' do
    friends = %w[john rick marty greg]
    network.add_member('steve', friend_names: friends)
    expect(network.members.length).to eq(1)
  end
end
