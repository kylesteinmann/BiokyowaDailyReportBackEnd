class Api::V1::ApplicationController < ActionController:: API
    
    def render_error(errors:, status: :internal_server_error)
        render json: {
            errors: errors,
            status: status,
            success: false
        }, status: status 
    end

    def render_success

    end
end