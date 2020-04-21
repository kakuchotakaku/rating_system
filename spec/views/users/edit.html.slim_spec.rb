# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            name: 'MyString',
                            rate: 1.5,
                            win: 1,
                            lose: 1,
                            draw: 1,
                            successive_win: 1,
                            rate_first: 1.5,
                            rate_second: 1.5
                          ))
  end

  it 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
      assert_select 'input[name=?]', 'user[name]'

      assert_select 'input[name=?]', 'user[rate]'

      assert_select 'input[name=?]', 'user[win]'

      assert_select 'input[name=?]', 'user[lose]'

      assert_select 'input[name=?]', 'user[draw]'

      assert_select 'input[name=?]', 'user[successive_win]'

      assert_select 'input[name=?]', 'user[rate_first]'

      assert_select 'input[name=?]', 'user[rate_second]'
    end
  end
end
