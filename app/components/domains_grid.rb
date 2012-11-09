class DomainsGrid < Netzke::Basepack::GridPanel

  def configure(c)
    super
    c.model = "Domain"
    c.columns = [
      { :name => :name,:width => 200 },
      { :name => :provider__title, :header => "Registrator", :width => 150 },
      { :name => :domain_type__title, :header => "Type", :width => 170 },
      { :name => :domain_status__title, :header => "Status", :width => 170 },
      :expiration_date
    ]
  end
end