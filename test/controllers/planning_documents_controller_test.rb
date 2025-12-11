require "test_helper"

class PlanningDocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get planning_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_planning_document_url
    assert_response :success
  end

  test "should create planning_document" do
    assert_difference('PlanningDocument.count') do
      post planning_documents_url, params: { planning_document: { title: 'Test', document_type: 'CIDP', start_year: '2023', end_year: '2027', status: 'draft' } }
    end
    assert_redirected_to planning_document_url(PlanningDocument.last)
  end

  test "should show planning_document" do
    planning_document = PlanningDocument.create(title: 'Test', document_type: 'CIDP', start_year: '2023', end_year: '2027', status: 'draft')
    get planning_document_url(planning_document)
    assert_response :success
  end
end
