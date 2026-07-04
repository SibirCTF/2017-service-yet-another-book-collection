# frozen_string_literal: true

require 'test_helper'

class NewsControllerTest < ActionDispatch::IntegrationTest
  test 'should get last' do
    get news_last_url
    assert_response :success
  end

  test 'should get search' do
    get news_search_url
    assert_response :success
  end
end
