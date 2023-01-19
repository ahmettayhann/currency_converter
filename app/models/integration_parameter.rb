class IntegrationParameter < ApplicationRecord
  belongs_to :integration, class_name: 'Integration'
end