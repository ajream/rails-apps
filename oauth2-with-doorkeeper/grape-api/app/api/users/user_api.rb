require 'doorkeeper/grape/helpers'

module Users
  class UserApi < Grape::API
    helpers Doorkeeper::Grape::Helpers
    helpers APIHelpers
    
    before do
      doorkeeper_authorize!
    end

    resource :users do
      desc "Return all users"
      get "" do
        User.all
      end

      desc "Return a user"
      params do
        requires :id, type: String, desc: "ID of the user"
      end

      get ":id", root: "user" do
        # User.where(id: params[:id]).first!
        current_user.as_json()
      end
    end
  end
end
