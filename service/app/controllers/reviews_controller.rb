# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :find_book
  before_action :authorize, only: %i[new edit]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.book_id = @book.id
    @review.user_id = current_user.id
    symbolized = params[:review][:comment].to_sym # if params[:review][:comment].nil?
    puts symbolized.to_s + " debug\n\n\n"
    if @review.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_book
    @book = Book.find(params[:book_id])
  end
end
