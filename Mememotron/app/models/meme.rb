class Meme < ActiveRecord::Base
  attr_accessible :name, :url

  validates :name, presence: true
end
