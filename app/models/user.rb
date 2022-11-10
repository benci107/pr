class User < ApplicationRecord
    belongs_to :organization
    validates :first_name, presence: true
    validates :last_name, presence: true
end
