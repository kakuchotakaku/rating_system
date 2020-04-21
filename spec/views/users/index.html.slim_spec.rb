# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               name: 'Name',
               rate: 2.5,
               win: 3,
               lose: 4,
               draw: 5,
               successive_win: 6,
               rate_first: 7.5,
               rate_second: 8.5
             ),
             User.create!(
               name: 'Name',
               rate: 2.5,
               win: 3,
               lose: 4,
               draw: 5,
               successive_win: 6,
               rate_first: 7.5,
               rate_second: 8.5
             )
           ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 2.5.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: 4.to_s, count: 2
    assert_select 'tr>td', text: 5.to_s, count: 2
    assert_select 'tr>td', text: 6.to_s, count: 2
    assert_select 'tr>td', text: 7.5.to_s, count: 2
    assert_select 'tr>td', text: 8.5.to_s, count: 2
  end
end
