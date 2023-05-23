class Obra < ApplicationRecord
  has_many :anticipos
  belongs_to :arquitecto
end
