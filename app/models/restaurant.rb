class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  has_many   :meals,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
