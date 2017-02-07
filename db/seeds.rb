# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
	{ username: 'Mr. Wasson', email: "wasson@wasson.com", password: "password", is_teacher: true},
	{ username: 'Ms. Smith', email: "smith@smith.com", password: "password", is_teacher: true},
	{ username: 'Ms. Brown', email: "brown@brown.com", password: "password", is_teacher: true},
	{ username: 'Timmy', email: "timmy@timmy.com", password: "password", is_student: true},
	{ username: 'Suzy', email: "suzy@suzy.com", password: "password", is_student: true},
	{ username: 'Johnny', email: "Johnny@Johnny.com", password: "password", is_student: true},
	{ username: 'Jane', email: "Jane@Jane.com", password: "password", is_student: true},
	{ username: 'David', email: "David@David.com", password: "password", is_student: true},
	{ username: 'Kyle', email: "Kyle@Kyle.com", password: "password", is_student: true},
	{ username: 'Stan', email: "Stan@Stan.com", password: "password", is_student: true},
	{ username: 'Laura', email: "Laura@Laura.com", password: "password", is_student: true},
	{ username: 'Crystal', email: "Crystal@Crystal.com", password: "password", is_student: true},
	{ username: 'Courtney', email: "Courtney@Courtney.com", password: "password", is_student: true},
	{ username: 'Lisa', email: "Lisa@Lisa.com", password: "password", is_student: true},
	{ username: 'Kenneth', email: "Kenneth@Kenneth.com", password: "password", is_student: true},
	{ username: 'Max', email: "Max@Max.com", password: "password", is_student: true},
	{ username: 'Jim', email: "Jim@Jim.com", password: "password", is_student: true},
	{ username: 'Mikey', email: "Mikey@Mikey.com", password: "password", is_student: true},
	{ username: 'Walker', email: "Walker@Walker.com", password: "password", is_student: true},
	{ username: 'Louis', email: "Louis@Louis.com", password: "password", is_student: true},
	])

Course.create([
	{ name: "Geometry", instructor_id: 3 },
	{ name: "Algebra", instructor_id: 3 },
	{ name: "Calculus", instructor_id: 3 },
	{ name: "English", instructor_id: 1 },
	{ name: "History", instructor_id: 1 },
	{ name: "Writing", instructor_id: 1 },
	{ name: "Chemistry", instructor_id: 2 },
	{ name: "Biology", instructor_id: 2 },
	{ name: "Physics", instructor_id: 2 }
	])