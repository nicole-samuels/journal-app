class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed 
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  private
      def not_destroyed(e)
        render json: {errors: e.record.errors}, status: :unprocessable_entity
    end

end
