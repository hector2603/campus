require 'test_helper'

class ContentCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_course = content_courses(:one)
  end

  test "should get index" do
    get content_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_content_course_url
    assert_response :success
  end

  test "should create content_course" do
    assert_difference('ContentCourse.count') do
      post content_courses_url, params: { content_course: { content: @content_course.content, course_id: @content_course.course_id } }
    end

    assert_redirected_to content_course_url(ContentCourse.last)
  end

  test "should show content_course" do
    get content_course_url(@content_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_course_url(@content_course)
    assert_response :success
  end

  test "should update content_course" do
    patch content_course_url(@content_course), params: { content_course: { content: @content_course.content, course_id: @content_course.course_id } }
    assert_redirected_to content_course_url(@content_course)
  end

  test "should destroy content_course" do
    assert_difference('ContentCourse.count', -1) do
      delete content_course_url(@content_course)
    end

    assert_redirected_to content_courses_url
  end
end
