class Dress < ActiveRecord::Base
  has_many :colors
  has_many :dress_types
end
