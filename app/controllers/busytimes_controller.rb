class BusytimesController < ApplicationController
  # GET /busytimes
  # GET /busytimes.xml
  def index
    @busytimes = Busytime.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @busytimes }
    end
  end

  # GET /busytimes/1
  # GET /busytimes/1.xml
  def show
    @busytime = Busytime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @busytime }
    end
  end

  # GET /busytimes/new
  # GET /busytimes/new.xml
  def new
    @busytime = Busytime.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @busytime }
    end
  end

  # GET /busytimes/1/edit
  def edit
    @busytime = Busytime.find(params[:id])
  end

  # POST /busytimes
  # POST /busytimes.xml
  def create
    @busytime = Busytime.new(params[:busytime])

    respond_to do |format|
      if @busytime.save
        flash[:notice] = 'Busytime was successfully created.'
        format.html { redirect_to(@busytime) }
        format.xml  { render :xml => @busytime, :status => :created, :location => @busytime }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @busytime.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /busytimes/1
  # PUT /busytimes/1.xml
  def update
    @busytime = Busytime.find(params[:id])

    respond_to do |format|
      if @busytime.update_attributes(params[:busytime])
        flash[:notice] = 'Busytime was successfully updated.'
        format.html { redirect_to(@busytime) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @busytime.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /busytimes/1
  # DELETE /busytimes/1.xml
  def destroy
    @busytime = Busytime.find(params[:id])
    @busytime.destroy

    respond_to do |format|
      format.html { redirect_to(busytimes_url) }
      format.xml  { head :ok }
    end
  end
end
