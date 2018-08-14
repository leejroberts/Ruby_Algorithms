require "rspec"
require_relative "../../sorting/selection_sort.rb"

RSpec.describe "selection_sort" do

  it 'sorts an unsorted array' do
    starting_arr = (1..20).to_a
    shuffled_arr = starting_arr.shuffle!
    sorted_arr = selection_sort(starting_arr)
    expect(sorted_arr).to eq(starting_arr)
  end
end
