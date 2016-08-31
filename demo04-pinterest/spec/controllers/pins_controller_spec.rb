require 'rails_helper'
RSpec.describe PinsController, type: :controller do
	before :each do
    @user = create(:user)
    @pin = create(:pin)
	end

	describe 'GET #index' do
		it "populates an array of pins" do
			get :index
			expect(response).to be_success
			expect(response.status).to eq(200)
		end

		it "renders the :index template" do
			get :index
			expect(response).to render_template :index
		end
	end

	describe 'GET #show' do
		it "assigns the requested pin to @pin" do
			get :show, params: { id: @pin }
			expect(assigns(:pin)).to eq @pin
		end

		it "renders the :show template" do
			get :show, params: { id: @pin }
			expect(response).to render_template :show
		end
	end

	# describe 'GET #new' do
	# 	it "assigns a new pin to @pin" do
	# 		get :new
	# 		expect(assigns(:pin)).to be_a_new(@pin)
	# 	end

	# 	it "renders the :new template" do 
	# 		get :new
	# 		expect(response).to render_template :new 
	# 	end
	# end

	# describe 'DELETE #destroy' do 
	# 	before :each do
	# 		@pin = create(:pin) 
	# 	end

	# 	it "deletes the pin" do 
	# 		expect{ delete :destroy, id: @pin }.to change(Pin,:count).by(-1)
	# 	end

	# 	it "redirects to pin#index" do
	# 		delete :destroy, id: @pin 
	# 		expect(response).to redirect_to pins_url
	# 	end 
	# end
end