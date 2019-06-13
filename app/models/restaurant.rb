class Restaurant < ApplicationRecord
  # Direct associations

  belongs_to :creator,
             :class_name => "User"

  has_many   :likes,
             :dependent => :destroy

  has_many   :meals,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
