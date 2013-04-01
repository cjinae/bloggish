class Post < ActiveRecord::Base
	attr_accessible :title, :name, :content, :tags_attributes

	validates :title, 	:presence => true
	validates :name, 	:presence => true
	validates :content, :presence => true,
						:length => { :maximum => 40 }

	has_many :comments, :dependent => :destroy
	has_many :tags

	accepts_nested_attributes_for :tags, :allow_destroy => :true, 
	:reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

end
