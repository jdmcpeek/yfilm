class Project < ActiveRecord::Base
	

	scope :find_project, -> (lambda) { where("title like ?", "%#{lambda}%")}

	has_many :roles
	has_many :users, through: :roles
	has_many :auditions
	mount_uploader :image, ImageUploader

	auto_html_for :video do
	    html_escape
	    image
	    youtube(:autoplay => false)
	    link :target => "_blank", :rel => "nofollow"
	    simple_format
  	end


end
