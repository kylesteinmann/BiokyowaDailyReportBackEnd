class User < ApplicationRecord
    has_secure_password validations: true
    validates :email, uniqueness: true
    has_many :tokens

    enum role: {
        manager: 0,
        supervisor: 1,
        operator: 2,
        supervisor_fermentation: 3,
        supervisor_extraction: 4,
        supervisor_packaging: 5,
        operator_fermentation: 6,
        operator_extraction: 7,
        operator_packaging: 8
    }

    def name
        "#{first_name} #{last_name}"
    end

    def generate_token!(ip)
        token = Token.create(
            value: SecureRandom.hex,
            user_id: id,
            expiry: DateTime.current + 7.days,
            ip: ip
        )
    end
end
