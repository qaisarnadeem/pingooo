class User < ActiveRecord::Base
  belongs_to :country
  validates_presence_of :nickname
  validates_uniqueness_of :nickname
  APP_SECRET="c4ca423gf8a0b9c2f3820dcc509a6f75849b"
  after_save :set_secret_code
  validates_uniqueness_of :email,:allow_blank => true
  def set_secret_code
    if self.secret_code.blank?
      self.secret_code=Digest::MD5.hexdigest(self.id.to_s+Time.now.to_i.to_s)
      self.save
    end
  end


end
