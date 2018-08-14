require "rspec"
require_relative "../../sorting/bubble_sort"

RSpec.describe "bubble_sort" do

  it 'properly sorts a shuffled array of numbers' do
    shuffled_arr = (1..20).to_a.shuffle!() # generates a randomized array of numbers 1 to 20
    bubble_sorted_arr = bubble_sort(shuffled_arr)

    expect(shuffled_arr).to eq(bubble_sorted_arr)
  end

  it 'returns an empty arr if arr is empty' do
    empty_arr = []
    expect(empty_arr).to eq(bubble_sort(empty_arr))
  end
end
