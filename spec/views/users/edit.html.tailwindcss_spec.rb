require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!(
      name: "MyString",
      username: "MyString",
      password: "MyString",
      email: "MyString"
    )
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[username]"

      assert_select "input[name=?]", "user[password]"

      assert_select "input[name=?]", "user[email]"
    end
  end
end
