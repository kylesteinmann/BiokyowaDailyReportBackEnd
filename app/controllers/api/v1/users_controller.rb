module Api
    module V1
        class UsersController < Api::V1::ApplicationController
            skip_before_action :authenticate, only: [:create, :login]

            def create
                # Step 1: get the result from the service
                result = BaseApi::Users.new_user(params)
                # Step 2: return an error if the result was unsuccessful
                render_error(errors: "There was a problem creating a new user",
                    status: 400) and return  unless result.success?
                # Step 3: otherwise, build a payload
                payload = {
                    user: UserBlueprint.render_as_hash(result.payload, view:
                    :normal)
                }
                # Step 4: return a successful response attached with the payload
                render_success(payload: payload, status: 201)
            end

            def login
                result = BaseApi::Auth.login(params[:email], params[:password], @ip)
                render_error(errors: "User not authenticated", status: 401) and return unless result.success?
                payload = {
                    user: UserBlueprint.render_as_hash(result.payload[:user], view: :login),
                    token: TokenBlueprint.render_as_hash(result.payload[:token]),
                    status: 200
                }
                render_success(payload: payload, status: 200)
            end

            def me
                render_success(payload: UserBlueprint.render_as_hash(@current_user), status: 200)
            end

            def logout
                result = BaseApi::Auth.logout(@current_user, @token)
                render_error(errors: "There was a problem logging out", status: 401) and return unless result.success?

                render_success(payload: "You have been logged out!", status: 200)
            end
        end
    end
end

