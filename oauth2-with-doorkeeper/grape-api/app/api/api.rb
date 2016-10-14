class API < Grape::API
	prefix "api"
	version "v1", using: :path
	default_format :json
	format :json
	# formatter :json, Grape::Formatter::ActiveModelSerializers
  mount Users::UserApi
end
