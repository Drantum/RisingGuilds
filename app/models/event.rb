class Event < ActiveRecord::Base
  belongs_to :character
  belongs_to :guild
end
