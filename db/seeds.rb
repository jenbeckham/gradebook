# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Teacher.create!(name: "Betty", email: "bestteacher@gmail.com", password: "bestteacher1" )
Teacher.create!(name: "Harry", email: "worstteacher@gmail.com", password: "worstteacher1")
Teacher.create!(name: "Sue", email: "okteacher@gmail.com", password: "okteacher1")
Teacher.create!(name: "Cool Mr. Jackson", email: "coolteacher@gmail.com", password: "coolteacher1")
Teacher.create!(name: "Creepy Mr. Howard", email: "creepyteacher@gmail.com", password: "creepyteacher1")

Student.create!(name: "Lynn Harris", email: "lynn@gmail.com", password: "lynn1", teacher_id: 1)
Student.create!(name: "Henry Jones", email: "henry@gmail.com", password: "henry1", teacher_id: 1)
Student.create!(name: "Liam Jackson", email: "liam@gmail.com", password: "liam1", teacher_id: 2)
Student.create!(name: "Holden Howard", email: "holden@gmail.com", password: "holden1", teacher_id: 3)
Student.create!(name: "Lisa Tanner", email: "lisa@gmail.com", password: "lisa1", teacher_id: 4)

Parent.create!(name: "Becky Harris", email: "becky@gmail.com", password: "becky1", student_id: 1)
Parent.create!(name: "James Jones", email: "james@gmail.com", password: "james1", student_id: 2)
Parent.create!(name: "Bill Jackson", email: "bill@gmail.com", password: "bill1", student_id: 3)
Parent.create!(name: "Jim Howard", email: "jim@gmail.com", password: "jim1", student_id: 4)
Parent.create!(name: "Leslie Tanner", email: "leslie@gmail.com", password: "leslie1", student_id: 5)

Grade.create!(assignment_name: "Homework", score: 4, date: Date.today, student_id: 1)
Grade.create!(assignment_name: "Homework", score: 5, date: Date.today - 1.day, student_id: 1)
Grade.create!(assignment_name: "Homework", score: 2, date: Date.today, student_id: 3)
Grade.create!(assignment_name: "Classwork", score: 3, date: Date.today, student_id: 4)
Grade.create!(assignment_name: "Classwork", score: 4, date: Date.today, student_id: 5)
