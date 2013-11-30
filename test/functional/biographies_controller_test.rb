require 'test_helper'

class BiographiesControllerTest < ActionController::TestCase
  setup do
    @biography = biographies(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:biographies)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create biography' do
    assert_difference('Biography.count') do
      post :create, biography: { biography: @biography.biography, first_name: @biography.first_name, instrument: @biography.instrument, last_name: @biography.last_name, member_id: @biography.member_id }
    end

    assert_redirected_to biography_path(assigns(:biography))
  end

  test 'should show biography' do
    get :show, id: @biography
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @biography
    assert_response :success
  end

  test 'should update biography' do
    put :update, id: @biography, biography: { biography: @biography.biography, first_name: @biography.first_name, instrument: @biography.instrument, last_name: @biography.last_name, member_id: @biography.member_id }
    assert_redirected_to biography_path(assigns(:biography))
  end

  test 'should destroy biography' do
    assert_difference('Biography.count', -1) do
      delete :destroy, id: @biography
    end

    assert_redirected_to biographies_path
  end
end
