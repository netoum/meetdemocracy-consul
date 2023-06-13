class UsersController < ApplicationController
  load_and_authorize_resource
  helper_method :valid_interests_access?

  def show
    raise CanCan::AccessDenied if params[:filter] == "follows" && !valid_interests_access?(@user)
  end

  def accept_cookies
    current_user.update!(cookies_accepted: true)
    render json: { message: "Success" }, status: :ok
  end

  private

    def valid_interests_access?(user)
      user.public_interests || user == current_user
    end
end
