class Api::V1::CoursesController < ApplicationController
  before_action :set_course, only: [:show]

  def index
    @courses = Course.all
    render json: @courses, include: :tutors
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      render json: @course, status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def show
    if @course.present?
      status = :ok
    else
      status = :not_found
    end
    render json: @course, include: :tutors, status: status
  end

  private

  def set_course
  	@course ||= Course.where(id: params[:id]).first
  end

  def course_params
    params.require(:course).permit(:name, tutors_attributes: [:name, :email])
  end
end
