class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :concerns,
             :required => false,
             :class_name => "Concern"

  belongs_to :products,
             :class_name => "Product",
             :counter_cache => true

  belongs_to :brands,
             :class_name => "Brand",
             :counter_cache => true

  belongs_to :user,
             :foreign_key => "users_id",
             :counter_cache => true

  # Indirect associations

  # Validations

end
