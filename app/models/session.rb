class Session < ApplicationRecord
  belongs_to :user

  before_create { self.key = SecureRandom.hex(40) }
end
