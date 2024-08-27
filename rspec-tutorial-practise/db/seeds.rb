# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)




20.times do |i|
puts "Creating Student #{i+1}"
@student = Student.create(
  first_name: "Student #{i + 1}",
  last_name: "Lname #{i + 1}",
  email: "student#{i+ 1}@gmail.com"
)
end

Student.all.each do |student|
  student.blogs.create(title: "Dummy blog for student #{student.id}", content: "  Custom content pending")
end

15.times do |i|
  student = Student.new(
    first_name:   Faker::Name.name_with_middle,
    last_name:    Faker::Name.name_with_middle,
    email:        Faker::Internet.email,
    password: Faker::Internet.password,
    contact_no:   Faker::Number.number(digits: 10),
    city:         Faker::Address.city,
    state:        Faker::Address.state,
    country:      Faker::Address.country_code,
    birthdate:    Faker::Date.birthday(min_age: 18, max_age: 65)
  )

  if student.save
    puts "Student ##{i + 1} created successfully"
  else
    puts "Error creating student ##{i + 1}: #{student.errors.full_messages.join(', ')}"
  end
end

Student.all.each do |student|
  student.update(password: '123456789')
end

FrontEndSkill.find_or_create_by(name:'HTML')
FrontEndSkill.find_or_create_by(name:'CSS')
FrontEndSkill.find_or_create_by(name:'Javascript')
FrontEndSkill.find_or_create_by(name:'Bootstrap')
FrontEndSkill.find_or_create_by(name:'JQuery')
FrontEndSkill.find_or_create_by(name:'React JS')
FrontEndSkill.find_or_create_by(name:'Angular JS')
FrontEndSkill.find_or_create_by(name:'Vue JS')

BackEndSkill.find_or_create_by(name:'Ruby')
BackEndSkill.find_or_create_by(name:'Rails')
BackEndSkill.find_or_create_by(name:'Java')
BackEndSkill.find_or_create_by(name:'Node JS')
BackEndSkill.find_or_create_by(name:'PHP / Laraval')
BackEndSkill.find_or_create_by(name:'Python')
BackEndSkill.find_or_create_by(name:'MySql')
BackEndSkill.find_or_create_by(name:'Postgresql')
BackEndSkill.find_or_create_by(name:'CURL')
BackEndSkill.find_or_create_by(name:'Rest API')
BackEndSkill.find_or_create_by(name:'MongoDB')

StudentSkill.create(student: Student.first , skill: Skill.find(1), rating: 8)
StudentSkill.create(student: Student.first , skill: Skill.find(3), rating: 8)
StudentSkill.create(student: Student.first , skill: Skill.find(4), rating: 8)
StudentSkill.create(student: Student.first , skill: Skill.find(5), rating: 8)
StudentSkill.create(student: Student.first , skill: Skill.find(8), rating: 8)


StudentSkill.create(student: Student.last , skill: Skill.find(1), rating: 8)
StudentSkill.create(student: Student.last , skill: Skill.find(5), rating: 8)
StudentSkill.create(student: Student.last , skill: Skill.find(8), rating: 8)
StudentSkill.create(student: Student.last , skill: Skill.find(6), rating: 8)
StudentSkill.create(student: Student.last , skill: Skill.find(7), rating: 8)
StudentSkill.create(student: Student.last , skill: Skill.find(9), rating: 8)



TechnicalCourse.find_or_create_by(course_name:'CCC' , price:'100$')
TechnicalCourse.find_or_create_by(course_name:'B.Tech' , price:'75$')
TechnicalCourse.find_or_create_by(course_name:'BCA' , price:'200$')
TechnicalCourse.find_or_create_by(course_name:'B.Arch' , price:'150$')


NonTechnicalCourse.find_or_create_by(course_name:'Sales' , price:'90$')
NonTechnicalCourse.find_or_create_by(course_name:'Accounting' , price:'120$')
NonTechnicalCourse.find_or_create_by(course_name:'Designing' , price:'170$')
NonTechnicalCourse.find_or_create_by(course_name:'LLB' , price:'200$')
NonTechnicalCourse.find_or_create_by(course_name:'MBA' , price:'190$')
NonTechnicalCourse.find_or_create_by(course_name:'Finance' , price:'70$')


StudentCourse.create(student: Student.first , course: Course.find(1), course_rating: 9)
StudentCourse.create(student: Student.first , course: Course.find(3), course_rating: 8)

StudentCourse.create(student: Student.last , course: Course.find(1), course_rating: 9)
StudentCourse.create(student: Student.last , course: Course.find(2), course_rating: 8)
StudentCourse.create(student: Student.last , course: Course.find(3), course_rating: 8)
StudentCourse.create(student: Student.last , course: Course.find(4), course_rating: 8)

