require_relative("member")
require_relative("lesson")
require_relative("booking")

require("pry")

Member.delete_all()

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

binding.pry
nil