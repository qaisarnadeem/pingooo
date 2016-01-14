class PrizeCategory < ActiveRecord::Base
  validates_presence_of :title,:amount
  validates :amount ,:numericality=>{:greater_than=>0}
  has_many :country_specific_prizes

  has_attached_file :icon, styles: { medium: "300x300>"}, default_url: "/assets/:style/missing.png"
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/
 

end
