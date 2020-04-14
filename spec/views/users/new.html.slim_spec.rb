require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :name => "MyString",
      :rate => 1.5,
      :win => 1,
      :lose => 1,
      :draw => 1,
      :successive_win => 1,
      :rate_first => 1.5,
      :rate_second => 1.5
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[rate]"

      assert_select "input[name=?]", "user[win]"

      assert_select "input[name=?]", "user[lose]"

      assert_select "input[name=?]", "user[draw]"

      assert_select "input[name=?]", "user[successive_win]"

      assert_select "input[name=?]", "user[rate_first]"

      assert_select "input[name=?]", "user[rate_second]"
    end
  end
end
