class Api::V1::TutorsController < ApplicationController
	def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      render json: @tutor, status: :created
    else
      render json: @tutor.errors, status: :unprocessable_entity
    end
  end

  private

  def tutor_params
    params.require(:tutor).permit(:name, :email, :course_id)
  end
end
