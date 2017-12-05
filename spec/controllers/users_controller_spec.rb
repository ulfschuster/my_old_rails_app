require 'rails_helper'

describe UsersController, type: :controller  do

  before do
  #@user = User.create!(first_name: 'harry', last_name: 'bonanza', email:'harrybonanza@gmail.com', password: '3456777')
  #@user1 = User.create!(first_name: 'han', last_name: 'solo', email: 'hansolo@gmail.com', password: '4567890')
  @user = FactoryBot.create(:user)
  @user1 = FactoryBot.create(:user)
  end

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        it "loads correct user details" do
          expect(assigns(:user)).to eq @user
          expect(response.status).to eq(302)
        end
      end
    end      

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: {id: @user.id}        
         expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "cannot access second user show page" do
      it "redirects to root" do
        sign_in @user1
      end

      it "redirects to root_path" do
        get :show, params: {id: @user1.id}        
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "valid comment attributes" do
      before do 
        @comment = Comment.new(body:"nice", rating: 5) 
      end

      it "will return comments & rating" do
        expect(@comment.body).to eq "nice"
        expect(@comment.rating).to eq 5
      end
    end
    
  end

end
