class Arquitecto < ApplicationRecord
  has_many :anticipos
  has_many :obras
end
