module Api
    module V1
        class UsersController < Api::V1::ApplicationController
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
        end
    end
end

