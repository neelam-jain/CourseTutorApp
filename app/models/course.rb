class Course < ActiveRecord::Base
  has_many :tutors
  accepts_nested_attributes_for :tutors
  validates :name, presence: true, on: :create
end
