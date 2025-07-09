class Customer < ApplicationRecord
  has_one_attached :image

  # Add validations
  validates :full_name, presence: true
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :phone_number, format: { with: /\A[\d\-\s\+\(\)]+\z/ }, allow_blank: true

  def self.ransackable_associations(auth_object = nil)
    [ "image_attachment", "image_blob" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "email_address", "full_name", "id", "notes", "phone_number", "updated_at" ]
  end
end
