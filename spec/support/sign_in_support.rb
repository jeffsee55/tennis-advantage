module SignUserIn
def sign_in(user)
   visit new_user_session_path
   within '.form-inputs' do
     fill_in "Email",    with: user.email
     fill_in "Password", with: user.password
   end

   click_button "Sign in"
end
end
