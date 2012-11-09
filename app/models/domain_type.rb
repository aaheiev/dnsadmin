# == Schema Information
#
# Table name: domain_types
#
#  id    :integer          not null, primary key
#  title :string(255)      not null
#

class DomainType < ActiveRecord::Base
   attr_accessible :domain_type
   has_many :domains
end
