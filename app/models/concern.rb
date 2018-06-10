class Concern < ApplicationRecord
  # Direct associations

  has_many   :favorites,
             :foreign_key => "concerns_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
