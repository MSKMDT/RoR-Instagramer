class Profile < ActiveRecord::Base
	belongs_to :user 
	has_many :posts, :through => :user

	Profile.posts

	has_attached_file :profile_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/

  	validates :user_name, :profile_pic, :presence => true
  	validates :user_name, length: {
  		minimum: 2,
  		maximum: 15
  	}

end
