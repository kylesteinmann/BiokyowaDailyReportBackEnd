module BaseApi
    module Auth
        def self.login(email, password, ip)
            #will return nill if not found
            #will return false if the try method doesn't match password with email
            user = User.find_by(email: email).try(:authenticate, password)

            #if we couldn't find the user
            return ServiceContract.error('User not found') if user.nil?

            #if the password wasn't correct
            return ServiceContract.error('Incorrect password') unless user

            #generate a token on the user instance
            token = user.generate_token!(ip)
            ServiceContract.success({user: user, token: token})
        end

        def self.logout(user, token)
            return ServiceContract.success(true) if user && token.update(revocation_date: DateTime.now)

            ServiceContract.error("Error logging user out")
        end
    end
end