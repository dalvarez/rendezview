class UsergroupsController < ApplicationController
  # GET /usergroups
  # GET /usergroups.xml
  def index
    @usergroups = Usergroup.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usergroups }
    end
  end

  # GET /usergroups/1
  # GET /usergroups/1.xml
  def show
    @usergroup = Usergroup.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @usergroup }
    end
  end

  # GET /usergroups/new
  # GET /usergroups/new.xml
  def new
    @usergroup = Usergroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @usergroup }
    end
  end

  # GET /usergroups/1/edit
  def edit
    @usergroup = Usergroup.find(params[:id])
  end

  # POST /usergroups
  # POST /usergroups.xml
  def create
    @usergroup = Usergroup.new(params[:usergroup])

    respond_to do |format|
      if @usergroup.save
        flash[:notice] = 'Usergroup was successfully created.'
        format.html { redirect_to(@usergroup) }
        format.xml  { render :xml => @usergroup, :status => :created, :location => @usergroup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usergroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /usergroups/1
  # PUT /usergroups/1.xml
  def update
    @usergroup = Usergroup.find(params[:id])

    respond_to do |format|
      if @usergroup.update_attributes(params[:usergroup])
        flash[:notice] = 'Usergroup was successfully updated.'
        format.html { redirect_to(@usergroup) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usergroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usergroups/1
  # DELETE /usergroups/1.xml
  def destroy
    @usergroup = Usergroup.find(params[:id])
    @usergroup.destroy

    respond_to do |format|
      format.html { redirect_to(usergroups_url) }
      format.xml  { head :ok }
    end
  end
end
