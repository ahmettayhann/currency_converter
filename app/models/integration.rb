class Integration < ApplicationRecord

  has_many :parameters, class_name: 'IntegrationParameter', foreign_key: :integration_id, dependent: :destroy
  accepts_nested_attributes_for :parameters

  validates :name, presence: true
end