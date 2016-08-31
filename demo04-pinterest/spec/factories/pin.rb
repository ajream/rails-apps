FactoryGirl.define do 
	factory :pin do
		title { Faker::Name.title }
		description { Faker::Lorem.sentence }
		# sequence(:email) { |n| "johndoe#{n}@example.com"}
	end 
end