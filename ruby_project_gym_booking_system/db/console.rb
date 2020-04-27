require_relative("../models/member")
require_relative("../models/lesson")
require_relative("../models/booking")

require("pry")

Booking.delete_all
Member.delete_all()
Lesson.delete_all()

member1 = Member.new({
    'first_name' => 'Steve',
    'last_name' => 'Jones',
    'date_of_birth' => '30/04/75'
})
member1.save()

member2 = Member.new({
    'first_name' => 'Karen',
    'last_name' => 'Maxwell',
    'date_of_birth' => '15/08/84'
})
member2.save()

lesson1 = Lesson.new({
    "lesson_name" => "Step Aerobics",
    "lesson_type" => "Keep Fit",
    "day_of_lesson" => "Tuesday",
    "time_lesson_is_on" => "10 am",
    "week_number_lesson_is_on" => 13
})
lesson1.save()

lesson2 = Lesson.new({
    "lesson_name" => "Kick Boxing",
    "lesson_type" => "Martial Arts",
    "day_of_lesson" => "Wednesday",
    "time_lesson_is_on" => "8 pm",
    "week_number_lesson_is_on" => 27
})
lesson2.save()

booking1 = Booking.new({
    "member_id" => member1.id,
    "lesson_id" => lesson1.id
})
booking1.save()

booking2 = Booking.new({
    "member_id" => member2.id,
    "lesson_id" => lesson2.id
})
booking2.save()  

booking3 = Booking.new({
    "member_id" => member2.id,
    "lesson_id" => lesson1.id
})
booking3.save() 

binding.pry
nil