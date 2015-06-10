class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :grades
  has_many :parents
end
