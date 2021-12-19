class ReviewsController < ApplicationController

    def index
        reviews = Review.all
        render json: reviews
    end

    def create
        review = Review.new(review_params)
        if review.save
            render json: review, status: 200
        else
            response = {
                error: review.errors.full_messages.to_sentence
            }
            render json: response, status: :unprocessable_entity
        end
    end

    def show
        review = Review.find(params[:id])
        render json: review, status: 200
    end

    private

    def review_params
        params.require(:review).permit(:content, :rating, :appointment_id)
    end
end
