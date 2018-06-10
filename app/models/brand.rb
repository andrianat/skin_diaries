class Brand < ApplicationRecord
  # Direct associations

  has_many   :favorites,
             :foreign_key => "brands_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
