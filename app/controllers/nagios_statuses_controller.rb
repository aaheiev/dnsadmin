class NagiosStatusesController < ApplicationController
  layout false
  # GET /nagios_statuses
  # GET /nagios_statuses.json
  def index
    @nagios_statuses = NagiosStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nagios_statuses }
    end
  end

  # GET /nagios_statuses/1
  # GET /nagios_statuses/1.json
  def show
    @nagios_status = NagiosStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nagios_status }
    end
  end

  # GET /nagios_statuses/new
  # GET /nagios_statuses/new.json
  def new
    @nagios_status = NagiosStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nagios_status }
    end
  end

  # GET /nagios_statuses/1/edit
  def edit
    @nagios_status = NagiosStatus.find(params[:id])
  end

  # POST /nagios_statuses
  # POST /nagios_statuses.json
  def create
    monitor_ip = request.env['HTTP_X_REAL_IP'] || request.remote_addr
    monitor = Host.find_by_ip(monitor_ip)

    case params[:object_type]
    when "service"
      @app_service = AppService.find(params[:app_service][:id])
      nagios_status = params[:nagios_status]
      unless monitor.nil?
        nagios_status[:monitor_id] = monitor.id
      end

      @app_service.nagios_statuses.create(nagios_status)

      render :inline => "ok! monitor_ip " + monitor_ip
    else
      render :inline => "unknown object typ emonitor_ip " + monitor_ip
    end

#    @nagios_status = NagiosStatus.new(params[:nagios_status])

#    respond_to do |format|
#      if @nagios_status.save
#        format.html { redirect_to @nagios_status, notice: 'Nagios status was successfully created.' }
#        format.json { render json: @nagios_status, status: :created, location: @nagios_status }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @nagios_status.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PUT /nagios_statuses/1
  # PUT /nagios_statuses/1.json
  def update
    @nagios_status = NagiosStatus.find(params[:id])

    respond_to do |format|
      if @nagios_status.update_attributes(params[:nagios_status])
        format.html { redirect_to @nagios_status, notice: 'Nagios status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nagios_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nagios_statuses/1
  # DELETE /nagios_statuses/1.json
  def destroy
    @nagios_status = NagiosStatus.find(params[:id])
    @nagios_status.destroy

    respond_to do |format|
      format.html { redirect_to nagios_statuses_url }
      format.json { head :no_content }
    end
  end
end
