class UsermeetingsController < ApplicationController
  # GET /usermeetings
  # GET /usermeetings.xml
  def index
    @usermeetings = Usermeeting.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usermeetings }
    end
  end

  # GET /usermeetings/1
  # GET /usermeetings/1.xml
  def show
    @usermeeting = Usermeeting.find(params[:id])
    @currentuser = User.find_by_id(@usermeeting.user_id)
    @currentmeeting = Meeting.find_by_id(@usermeeting.meeting_id)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @usermeeting }
    end
  end

  # GET /usermeetings/new
  # GET /usermeetings/new.xml
  def new
    @usermeeting = Usermeeting.new
    @user = get_user

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @usermeeting }
    end
  end

  # GET /usermeetings/1/edit
  def edit
    @usermeeting = Usermeeting.find(params[:id])
    @user = get_user
  end

  # POST /usermeetings
  # POST /usermeetings.xml
  def create
    @usermeeting = Usermeeting.new(params[:usermeeting])

    respond_to do |format|
      if @usermeeting.save
        flash[:notice] = 'Your RSVP was successfully recorded.'
        format.html { redirect_to(@usermeeting) }
        format.xml  { render :xml => @usermeeting, :status => :created, :location => @usermeeting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usermeeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /usermeetings/1
  # PUT /usermeetings/1.xml
  def update
    @usermeeting = Usermeeting.find(params[:id])
    @currentuser = User.find_by_id(@usermeeting.user_id)

    respond_to do |format|
      if @usermeeting.update_attributes(params[:usermeeting])
        flash[:notice] = 'RSVP recorded.'
        format.html { redirect_to(@usermeeting) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usermeeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usermeetings/1
  # DELETE /usermeetings/1.xml
  def destroy
    @usermeeting = Usermeeting.find(params[:id])
    @usermeeting.destroy

    respond_to do |format|
      format.html { redirect_to(usermeetings_url) }
      format.xml  { head :ok }
    end
  end
end
