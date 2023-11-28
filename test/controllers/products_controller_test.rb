require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_path
    assert_response :success
    assert_select ".product", 3
  end

  test "should get show" do
    get product_path(products(:iphone))
    assert_response :success
    assert_select ".title", "iphone 13"
    assert_select ".description", "Esto es un iphone."
    assert_select ".price", "1000€"
  end

  test "should get new product form" do
    get new_product_path
    assert_response :success
    assert_select "form"
  end

  test "should get edit product form" do
    get edit_product_path(products(:iphone))
    assert_response :success
    assert_select "form"
  end

  test "allows to create a new product" do
    post products_path, params: {
                          product: {
                            title: "Nuevo producto",
                            description: "Descripcion del producto.",
                            price: 25,
                            category_id: categories(:computers).id,
                          },
                        }
    assert_redirected_to products_path
    assert_equal flash[:notice], "Tu producto se ha creado correctamente."
  end

  test "does not allow to create a new product with empty fields" do
    post products_path, params: {
                          product: {
                            title: "",
                            description: "Descripcion del producto.",
                            price: 25,
                            category_id: categories(:computers).id,
                          },
                        }
    assert_response :unprocessable_entity
  end

  test "allows to update a product" do
    patch product_path(products(:macbook)), params: {
                                              product: {
                                                price: 300,
                                              },
                                            }
    assert_redirected_to products_path
    assert_equal flash[:notice], "Tu producto se ha actualizado correctamente."
  end

  test "does not allow to update a product with an invalid field" do
    patch product_path(products(:macbook)), params: {
                                              product: {
                                                price: nil,
                                              },
                                            }
    assert_response :unprocessable_entity
  end

  test "allows to delete a product" do
    assert_difference("Product.count", -1) do
      delete product_path(products(:macbook))
    end
    assert_redirected_to products_path
    assert_equal flash[:notice], "Tu producto se ha eliminado correctamente."
  end
end
