class GamePicture < ActiveRecord::Base
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/:style/missing.png",:path =>
      ":rails_root/private/system/:class/:attachment/:id/:style/:filename",
                    :url => '/:class/:attachment/:id/:style/:filename'
  has_attached_file :competition_picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/:style/missing.png",:path =>
      ":rails_root/private/system/:class/:attachment/:id/:style/:filename",
                    :url => '/:class/:attachment/:id/:style/:filename'
  validates_attachment_content_type :picture,:competition_picture, content_type: /\Aimage\/.*\Z/
  belongs_to :game

  scope :un_used , ->{where(:is_used => false)}
  validates_presence_of :picture,:competition_picture
end
