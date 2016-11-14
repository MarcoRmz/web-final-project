require 'test_helper'

class CharactersControllerTest < ActionController::TestCase
  test "should get highscores" do
    get :highscores
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
