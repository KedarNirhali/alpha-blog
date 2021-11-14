class Article < ApplicationRecord 
	validates :title, presence: true, lenght: {minimum: 6, maximum:100 }
	validates :description, presence: true, lenght: {minimum: 10 , maximum: 500 }
end