class Transaction < ApplicationRecord
	belongs_to :profile
	belongs_to :game
end
