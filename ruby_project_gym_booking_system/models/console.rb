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

binding.pry
nil