Factory.define :user do |user|
  user.name "Fred Hudson"
  user.email "fredjhudson@sympatico.ca"
  user.password "foobar"
  user.password_confirmation "foobar"
end
Factory.define :blank_user do |user|
  user.name ""
  user.email ""
  user.password ""
  user.password_confirmation ""
end
Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end
