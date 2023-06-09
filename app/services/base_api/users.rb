module BaseApi
    module Users
        def self.new_user(params)
            user = User.new(email: params[:email],
                first_name: params[:first_name],
                last_name: params[:last_name],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                department: params[:department],
                role: params[:role])

            begin
                user.save!
            rescue
                return ServiceContract.error("Error saving
                    message") unless user.valid?
            end

            ServiceContract.success(user)
        end
    end
end