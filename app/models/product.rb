class Product < ApplicationRecord
  # Direct associations

  has_many   :favorites,
             :foreign_key => "products_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :concerns,
             :through => :favorites,
             :source => :concerns

  has_many   :brands,
             :through => :favorites,
             :source => :brands

  # Validations

end
