class Category < ApplicationRecord
    has_many :reports
    has_many :locations, through: :reports
end
