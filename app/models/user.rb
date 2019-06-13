class User < ApplicationRecord
  # Direct associations

  has_many   :restaurants,
             :foreign_key => "creator_id",
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
