class Cover < ApplicationRecord
  belongs_to :post
  
  accepts_nested_attributes_for :post

  mount_uploader :picture, CoverUploader

  validate  :picture_size

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
