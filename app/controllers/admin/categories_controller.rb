class Admin::CategoriesController < ApplicationController
  before_action :authenticate
  def index
    @categories = Category.order(id: :desc).all
    # @products = @category.products.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end
  def category_params
    params.require(:category).permit(
      :name
    )
  end
  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
    username == ENV['USERNAME'] && password == ENV['PASSWORD']
    end
  end
end