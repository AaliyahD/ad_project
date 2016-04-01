# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
administrator = Administrator.create(
	fullname: "Aaliyah Davis",
	username: "test@example.com",
	password: "test")

30.times do
post = Post.create(
	title: Faker::Lorem.sentence(20),
	content: Faker::Lorem.paragraph(500),
	publish: true,
	administrator: administrator)

tag = Tag.create(name: Faker::Lorem.word)

post_tag = PostTag.create(post: post, tag: tag)

visitor = Visitor.create(
	fullname:Faker::Name.name, 
	email: Faker::Internet.email) 

user = User.create(
	first_name:Faker::Name.first_name,
	last_name:Faker::Name.last_name,
	email:Faker::Internet.email,
	password: "password",
	username:Faker::Internet.user_name,
	#location: "Dulwich"
	location: "Greenwich")

diarylog = Diarylog.create(
	meal_type: Faker::Lorem.word,
	description: Faker::Lorem.sentence(20),
	calories:Faker::Number.between(100, 300),
	sugar: Faker::Number.between(0, 50),
	fat: Faker::Number.between(0, 10),
	sodium: Faker::Number.between(0, 600),
	sat_fat:Faker::Number.between(0, 600),
	fiber:Faker::Number.between(0, 600),
	date:Faker::Date.between(2.days.ago, Date.today),
	user: user,
	carbs: Faker::Number.between(0, 600),
	protein:Faker::Number.between(0, 600))

comment = Comment.create(
	message: Faker::Lorem.paragraph,
	status: [true, false].sample,
	post: post, 
	#visitor: visitor,
	user: user)

message = Message.create(
	content: Faker::Lorem.paragraph,
	status: [true, false].sample,
	visitor: visitor)

notifiable = [visitor, comment].sample

notification = Notification.create(
	notifiable_id: notifiable.id,
	notifiable_type: notifiable.class.name)

end