require 'rails_helper'
describe PinsController do
	before :each do
    user = create(:user)
		session[:user_id] = user.id 
	end

	describe 'GET #index' do
		it "populates an array of pins"

		it "renders the :index template" do
			get :index
			expect(response).to render_template :index
		end
	end

	describe 'GET #show' do
		it "assigns the requested pin to @pin" do
			pin = create(:pin)
			get :show, params: { id: pin.id }
			expect(assigns(:pin)).to eq pin
		end

		it "renders the :show template" do
			pin = create(:pin)
			get :show, params: { id: pin.id }
			expect(response).to render_template :show
		end
	end

	describe 'GET #new' do
		it "assigns a new pin to @pin" do
			get :new
			expect(assigns(:pin)).to be_a_new(Pin)
		end

		it "renders the :new template" do 
			get :new
			expect(response).to render_template :new 
		end
	end

	describe 'DELETE #destroy' do 
		before :each do
			@pin = create(:pin) 
		end
		it "deletes the pin" do 
			expect{ delete :destroy, id: @pin }.to change(Pin,:count).by(-1)
		end

		it "redirects to pin#index" do
			delete :destroy, id: @pin 
			expect(response).to redirect_to pins_url
		end 
	end
end