class Need < ApplicationRecord
  # Direct associations

  has_many   :favorites,
             :foreign_key => "needs_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :products,
             :through => :favorites,
             :source => :products

  # Validations

end
