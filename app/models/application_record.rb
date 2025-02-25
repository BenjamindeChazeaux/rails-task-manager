class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  validates :title, presence: true
  validates :details, presence: true
end
