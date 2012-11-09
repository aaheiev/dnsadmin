class DnsController < ApplicationController
  def index
    @domain_types = DomainType.all().map{|t| t unless t.domains.empty? }.compact
    if params[:domain_type_id]
#      @s_types = params[:domain_type_id].keys.map{ |t| t.to_i }
      @s_types = DomainType.find(params[:domain_type_id].keys.map{ |t| t.to_i })
      @domains = Domain.where( :domain_type_id => DomainType.find(params[:domain_type_id].keys.map{ |t| t.to_i }) )
    else
      @domains = Domain.all()
    end

    @signed_in = true

  end
  def test
    
  end
end
