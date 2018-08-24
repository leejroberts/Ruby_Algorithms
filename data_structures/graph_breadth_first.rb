# frozen_string_literal: true

class Person
  attr_reader :name, :friends
  def initialize(name)
    @name = name
    @friends = []
  end

  # add Instance of Person to friends array
  def add_friend(person_obj)
    return nil if !person_obj.instance_of?(Person) || @friends.include?(person_obj)
    @friends << person_obj
  end
end

class Network
  attr_accessor :members
  def initialize
    @members = []
  end

  def find_member_by_name(member_name)
    @members.select { |member| member.name == member_name }.first
  end

  # friends is an array of Person
  # friends is an array of name strings
  def add_member(name, friend_names: [], friends: [])
    return nil if find_member_by_name(name).nil?
    member = Person.new(name)
    friend_names.each do |name|
      friend = find_member_by_name(name)
      member.add_friend(friend) if friend
    end
    friends.each do |friend_obj|
      if friend.instance_of?(Person) && @members.include?(friend_obj)
        member.friends << friend_obj
      end
    end
    @members << member
  end

  def add_friend_to_member(member_name, friend_names: [])
    member = find_member_by_name(member_name)
    return nil if member.nil?
    friend_names.each do |_name|
      friend = find_member_by_name(friend_name)
      member.add_friend(friend) if friend
    end
  end
end
