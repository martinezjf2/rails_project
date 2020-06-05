class User < ApplicationRecord
    has_secure_password
    # Do validations for each model
end
