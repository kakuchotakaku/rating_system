FactoryBot.define do
  factory :user do
    name { "MyString" }
    rate { 1.5 }
    win { 1 }
    lose { 1 }
    draw { 1 }
    successive_win { 1 }
    rate_first { 1.5 }
    rate_second { 1.5 }
  end
end
