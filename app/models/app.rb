# == Schema Information
#
# Table name: apps
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  domain_id      :integer
#  app_type       :string(255)
#  access_scope   :string(255)      default("public"), not null
#  ssl_type       :string(255)
#  active         :boolean          default(TRUE)
#  http_auth_user :string(255)
#  http_auth_pass :string(255)
#  comments       :text
#

class App < ActiveRecord::Base

  has_many :app_services
  belongs_to :domain

  attr_accessible :name, :domain, :app_type, :access_scope,
      :ssl_type, :active, :http_auth_user,
      :http_auth_pass, :comments, :app_services

end
