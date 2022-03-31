class Task < ApplicationRecord
  has_one_attached :file
  belongs_to :category
  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  # lineas 3 y 4 se copian directamente desde category, funcionan igual


  # Validación personalizada
  # Se escribe en singular como "validate", en lugar de "validates"
  # Generando una función personalizada, podemos crear validaciones personalizadass

  validate :due_date_validity

  def due_date_validity
    return if due_date.blank?
    return if due_date > Date.today
    #Para agregar mensajes de error relativos a la validación
    errors.add(:due_date, "La fecha no puede estar en el pasado o en blanco.")
  end
end
