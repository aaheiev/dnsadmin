require 'test_helper'

class NagiosStatusesControllerTest < ActionController::TestCase
  setup do
    @nagios_status = nagios_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nagios_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nagios_status" do
    assert_difference('NagiosStatus.count') do
      post :create, nagios_status: { event_message: @nagios_status.event_message, event_status: @nagios_status.event_status, event_time: @nagios_status.event_time, event_type: @nagios_status.event_type }
    end

    assert_redirected_to nagios_status_path(assigns(:nagios_status))
  end

  test "should show nagios_status" do
    get :show, id: @nagios_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nagios_status
    assert_response :success
  end

  test "should update nagios_status" do
    put :update, id: @nagios_status, nagios_status: { event_message: @nagios_status.event_message, event_status: @nagios_status.event_status, event_time: @nagios_status.event_time, event_type: @nagios_status.event_type }
    assert_redirected_to nagios_status_path(assigns(:nagios_status))
  end

  test "should destroy nagios_status" do
    assert_difference('NagiosStatus.count', -1) do
      delete :destroy, id: @nagios_status
    end

    assert_redirected_to nagios_statuses_path
  end
end
