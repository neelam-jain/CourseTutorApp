# spec/requests/api/v1/courses_spec.rb
require 'rails_helper'

RSpec.describe "Api::V1::Courses", type: :request do
  describe "POST /create" do
    it "creates a new course with tutors" do
      post "/api/v1/courses",
        course: {
          name: "Math",
          tutors_attributes: [
            { name: "John Doe", email: "john@example.com" },
            { name: "Jane Doe", email: "jane@example.com" }
          ]
        }

      expect(response).to have_http_status(:created)
      expect(Course.count).to eq(1)
      expect(Tutor.count).to eq(2)
    end

    it "returns unprocessable_entity if course creation fails" do
      post "/api/v1/courses", course: { name: nil }

      expect(Tutor.count).to eq(0) 
      expect(Course.count).to eq(0)
    end
  end

  describe "GET /index" do
    it "returns a list of courses with tutors" do
      courses = create_list(:course, 3)
      tutors = create_list(:tutor, 2, course: courses[0])
      
      get "/api/v1/courses"

      expect(response).to have_http_status(:ok)
      courses.each do |course|
        expect(response.body).to include(course.name)
      end
      tutors.each do |tutor|
        expect(response.body).to include(tutor.name)
      end
    end
  end

  describe "GET /show" do
    it "returns a course with tutors" do
      course = create(:course, name: "History")
      tutor = create(:tutor, name: "Professor X", email: "professor@example.com", course: course)

      get "/api/v1/courses/#{course.id}"

      expect(response).to have_http_status(:ok)
      expect(response.body).to include(course.name)
      expect(response.body).to include(tutor.name)
    end

    it "returns not found if the course does not exist" do
      get "/api/v1/courses/99"

      expect(response).to have_http_status(:not_found)
    end
  end
end
