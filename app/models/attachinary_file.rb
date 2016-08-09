class AttachinaryFile < ActiveRecord::Base
  belongs_to :mannequin
  has_attachments :photos
end
