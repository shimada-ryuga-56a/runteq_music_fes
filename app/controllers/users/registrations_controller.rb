# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters
    # before_action :configure_account_update_params, only: [:update]

    def attend_status_update
      @user = current_user
      if @user.attend?
        @user.update(attend?: false)
        redirect_to attendees_path, notice: '参加をキャンセルしました🥺🥺🥺🥺🥺🥺🥺'
      else
        @user.update(attend?: true)
        redirect_to attendees_path, notice: "参加を申し込みました！🎉\n後ほど、Mattermostのグループに招待します。"
      end
    end

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    # def create
    #   super
    # end

    # GET /resource/edit
    def edit
      @user = current_user
      10.times { @user.playable_instruments.build }
    end

    # PUT /resource

    private

    def after_sign_up_path_for(_resource)
      attendees_path
    end

    def after_update_path_for(_resource)
      attendees_path
    end
  end
end
