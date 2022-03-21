class Category < ApplicationRecord
  has_many :tasks
  # Valida que los campos name y description no se admitan vacios.
  validates :name, :description, presence: true

  # Validación de unicidad
  validates :name, uniqueness: { case_sensitive: false }
  # Usando el ejemplo de platzi no funciona, funciona con sensitive
  # https://stackoverflow.com/questions/63165940/warnings-about-case-sensitive-cant-be-erased
end
