class Product < ApplicationRecord
  # Direct associations

  has_many   :favorites,
             :foreign_key => "products_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
