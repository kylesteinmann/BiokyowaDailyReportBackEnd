class UserBlueprint < Blueprinter::Base
    identifier :id
    fields :first_name, :last_name, :name, :email, :department, :role

    view :normal do
        fields :tokens
    end

    view :login do
        association :token , blueprint: TokenBlueprint do |user, _options|
            user.tokens.last
        end
    end
end