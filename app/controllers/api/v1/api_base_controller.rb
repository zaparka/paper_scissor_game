module Api
  module V1
    class APIBaseController < ActionController::Base
      protect_from_forgery with: :exception
    end
  end
end
