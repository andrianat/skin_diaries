class Brand < ApplicationRecord
  # Direct associations

  has_many   :favorites,
             :foreign_key => "brands_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :products,
             :through => :favorites,
             :source => :products

  # Validations

end
