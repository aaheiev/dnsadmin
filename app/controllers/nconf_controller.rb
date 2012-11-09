class NconfController < ApplicationController
  layout false
  def list
    @app_services = AppService.all
  end
  def wxs
    @servers = HostRole.find_by_title("wxs").hosts.where(active: true).order(:name)
    @group = @servers.map{|s| s.name}.join(',')
  end

  def wp
    @servers = HostRole.find_by_title("wp").hosts.where(active: true).order(:name)
    @group = @servers.map{|s| s.name}.join(',')
  end
  def wproxy
    @servers = HostRole.find_by_title("wproxy").hosts.where(active: true).order(:name)
    @group = @servers.map{|s| s.name}.join(',')
  end

  def dns
    @servers = AppService.where(:app_id => App.where(:app_type => 'dns', :active => true )).order("name")
    @group = @servers.map{|s| s.name}.join(',')
  end

  def websites
    @sites = AppService.where(
      :app_id => App.where(:app_type => 'website', :active => true, :access_scope => "public" )).order("name")
    @http_sites_group = @sites.map {|s|
      s.name + "." + s.prio.to_s + "." + s.ip_address.host.id.to_s if s.app.ssl_type == "optional" or s.app.ssl_type == nil
    }.compact.join(',')
    @https_sites_group = @sites.map {|s|
      s.name + "." + s.prio.to_s + "." + s.ip_address.host.id.to_s if s.app.ssl_type == "optional" or s.app.ssl_type == "required"
    }.compact.join(',')
  end

end
