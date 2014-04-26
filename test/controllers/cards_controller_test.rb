require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post :create, card: { bats: @card.bats, date_of_birth: @card.date_of_birth, first_name: @card.first_name, height: @card.height, jersey_number: @card.jersey_number, last_name: @card.last_name, sport_id: @card.sport_id, team_id: @card.team_id, throws: @card.throws, weight: @card.weight }
    end

    assert_redirected_to card_path(assigns(:card))
  end

  test "should show card" do
    get :show, id: @card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card
    assert_response :success
  end

  test "should update card" do
    patch :update, id: @card, card: { bats: @card.bats, date_of_birth: @card.date_of_birth, first_name: @card.first_name, height: @card.height, jersey_number: @card.jersey_number, last_name: @card.last_name, sport_id: @card.sport_id, team_id: @card.team_id, throws: @card.throws, weight: @card.weight }
    assert_redirected_to card_path(assigns(:card))
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete :destroy, id: @card
    end

    assert_redirected_to cards_path
  end
end
