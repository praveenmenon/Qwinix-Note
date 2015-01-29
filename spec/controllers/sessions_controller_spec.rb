RSpec.describe User::SessionsController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}
  
  it "should create session" do
      user_params = {
         username: "Mystring",
         password: "Password"
     }
      session[:user_id] = nil
      post :create, user_params
      expect(session[:user_id]).should_not be_nil
    end

    it "should delete session of user" do
      session[:user_id] = user.id
      expect(session[:user_id]).to eq(user.id)
      delete :destroy,:id => user.id
      session[:user_id].should be_nil
  end
end