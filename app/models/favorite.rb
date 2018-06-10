class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :foreign_key => "users_id",
             :counter_cache => true

  # Indirect associations

  # Validations

end
