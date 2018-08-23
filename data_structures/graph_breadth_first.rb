# frozen_string_literal: true

class Person
  attr_reader :name, :friends
  def initialize(name)
    @name = name
    @friends = []
  end

  # add Instance of Person to friends array
  def add_friend(person_obj)
    return nil if !person_obj.instance_of(Person) || @friends.include?(person_obj)
    @friends << person_obj
  end
end

class Network
  def initialize(first_member = nil)
    @members = (first_member.instance_of(Person) ? [first_member] : [] )
  end

  def find_member_by_name(member_name)
    @members.select { |member| if member.name == member_name }.first
  end

  def add_member(name, *friends)
    if find_member_by_name(name).nil?
      member = Person.new()

  end
end
