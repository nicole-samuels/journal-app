require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not allow negative numbers' do
    
    project = Project.new(
      yarn_price: -2
    )
    assert_not project.valid?, "yarn price should  be a positive number"
  end


end
