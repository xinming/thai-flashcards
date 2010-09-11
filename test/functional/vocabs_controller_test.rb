require 'test_helper'

class VocabsControllerTest < ActionController::TestCase

  test "should create vocab" do
    Vocab.any_instance.expects(:save).returns(true)
    post :create, :vocab => { }
    assert_response :redirect
  end

  test "should handle failure to create vocab" do
    Vocab.any_instance.expects(:save).returns(false)
    post :create, :vocab => { }
    assert_template "new"
  end

  test "should destroy vocab" do
    Vocab.any_instance.expects(:destroy).returns(true)
    delete :destroy, :id => vocabs(:one).to_param
    assert_not_nil flash[:notice]    
    assert_response :redirect
  end

  test "should handle failure to destroy vocab" do
    Vocab.any_instance.expects(:destroy).returns(false)    
    delete :destroy, :id => vocabs(:one).to_param
    assert_not_nil flash[:error]
    assert_response :redirect
  end

  test "should get edit for vocab" do
    get :edit, :id => vocabs(:one).to_param
    assert_response :success
  end

  test "should get index for vocabs" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vocabs)
  end

  test "should get new for vocab" do
    get :new
    assert_response :success
  end

  test "should get show for vocab" do
    get :show, :id => vocabs(:one).to_param
    assert_response :success
  end

  test "should update vocab" do
    Vocab.any_instance.expects(:save).returns(true)
    put :update, :id => vocabs(:one).to_param, :vocab => { }
    assert_response :redirect
  end

  test "should handle failure to update vocab" do
    Vocab.any_instance.expects(:save).returns(false)
    put :update, :id => vocabs(:one).to_param, :vocab => { }
    assert_template "edit"
  end

end