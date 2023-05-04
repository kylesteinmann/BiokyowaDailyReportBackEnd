class UserBlueprint < Blueprinter::Base
    identifier :id
    fields :first_name, :last_name, :name, :email

    view :normal do
        fields :tokens
    end
end