# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def guest_sign_in
      user = User.guest
      sign_in user
      redirect_to user_path(user), notice: 'guestuserでログインしました。'
    end
  end
end
