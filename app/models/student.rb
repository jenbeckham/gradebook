class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :grades
  has_many :parents
  has_secure_password
end
