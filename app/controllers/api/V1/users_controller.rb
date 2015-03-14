module Api
  module V1
    class UserController < ApplicationController

      set_pagination_headers only: [:index]

      # GET api/v1/users
      def index
        @users = User.filter(params.slice(*User.allow_filterable_params)).paginate(page: params[:page], per_page: params[:per_page] || 10)

        respond_to do |format|
          format.json
        end
      end

      # GET api/v1/users/:id
      def show
        @user = User.find(params[:id])

        respond_to do |format|
          format.json
        end
      end

      # POST api/v1/users
      def create
        @user = User.new(user_params)

        respond_to do |format|
          if @notification.save
            format.json { render json: @user, status: :created }
          else
            format.json { render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity }
          end
        end
      end

      # PUT api/v1/users/:id
      def update
        @user = User.find(params[:id])

        respond_to do |format|
          if @user.update_attributes(params[:user])
            format.json { render json: @user, status: :ok }
          else
            format.json { render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity }
          end
        end
      end

      private

      # Strong parameters
      # See http://guides.rubyonrails.org/action_controller_overview.html#more-examples
      def user_params
        params.require(:user).permit(:tw_id, :is_welcomed)
      end
    end
  end
end