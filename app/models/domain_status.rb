# == Schema Information
#
# Table name: domain_statuses
#
#  id    :integer          not null, primary key
#  title :string(255)      not null
#

class DomainStatus < ActiveRecord::Base
   attr_accessible :title
   has_many :domains
   # default_scope order('id')
   default_scope :order => 'id'
end
