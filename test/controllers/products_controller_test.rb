# frozen_string_literal: true

require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of all products' do
    get products_path
    assert_response :success
    assert_select '.product', 2
  end

  test 'render a specific product' do
    get product_path(products(:ps4))
    assert_response :success
    assert_select '.name', 'PS4 PRO'
    assert_select '.description', 'En excelente estado'
    assert_select '.price', '$. 400'
  end

  test 'render a new product form' do
    get new_product_path
    assert_response :success
    assert_select 'form'
  end
end
