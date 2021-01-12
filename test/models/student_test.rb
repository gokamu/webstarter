require "test_helper"

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should follow and unfollow a course" do
    chikari = students(:chikari)
    maths = students(:maths)
    assert_not chikari.following?(maths)
    chikari.follow(maths)
    assert chikari.following?(maths)
    chikari.unfollow(maths)
    assert_not chikari.following?(maths)
  end
end
