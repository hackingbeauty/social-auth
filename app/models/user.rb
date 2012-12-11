class User < ActiveRecord::Base
  attr_accessible :weight
  
  has_many :authentications
  has_one :qrcode, :dependent => :destroy
end
