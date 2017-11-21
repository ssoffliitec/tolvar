require 'test_helper'

class RecordatoriosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recordatorio = recordatorios(:one)
  end

  test "should get index" do
    get recordatorios_url
    assert_response :success
  end

  test "should get new" do
    get new_recordatorio_url
    assert_response :success
  end

  test "should create recordatorio" do
    assert_difference('Recordatorio.count') do
      post recordatorios_url, params: { recordatorio: { name: @recordatorio.name, texto: @recordatorio.texto } }
    end

    assert_redirected_to recordatorio_url(Recordatorio.last)
  end

  test "should show recordatorio" do
    get recordatorio_url(@recordatorio)
    assert_response :success
  end

  test "should get edit" do
    get edit_recordatorio_url(@recordatorio)
    assert_response :success
  end

  test "should update recordatorio" do
    patch recordatorio_url(@recordatorio), params: { recordatorio: { name: @recordatorio.name, texto: @recordatorio.texto } }
    assert_redirected_to recordatorio_url(@recordatorio)
  end

  test "should destroy recordatorio" do
    assert_difference('Recordatorio.count', -1) do
      delete recordatorio_url(@recordatorio)
    end

    assert_redirected_to recordatorios_url
  end
end
