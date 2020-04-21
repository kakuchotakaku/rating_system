# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            name: 'Name',
                            rate: 2.5,
                            win: 3,
                            lose: 4,
                            draw: 5,
                            successive_win: 6,
                            rate_first: 7.5,
                            rate_second: 8.5
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7.5/)
    expect(rendered).to match(/8.5/)
  end
end
