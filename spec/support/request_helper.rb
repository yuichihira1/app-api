module RequestMacros
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def application_json
      before do
        set_content_type 'application/json'
        set_accept 'application/json'
      end
    end
  end

  module RequestHelpers
    def login_user(user)
      login_as user, scope: :user
    end
  end

  module AuthenticateHelpers
    def authenticate
      @env ||= {}
      @env['Autnorization'] = "Bearer #{ENV['access_token']}"
    end
  end
end