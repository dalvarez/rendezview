class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.xml
  
  def index
    @meetings = Meeting.find(:all)
    @user = get_user
    @yourmeetings = Usermeeting.find_all_by_user_id_and_is_attending(@user.id, 1)
    
    #Meetings you've RSVP'd...
    @temp = []
    for meeting in @yourmeetings
      @temp << Meeting.find_by_id(meeting.meeting_id)
    end
    
    #Meetings you've been invited to...
    @invited = []
    for m in @meetings
      if m.attendees.include?(@user.email)
        @invited << m
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meetings }
    end
  end

  # GET /meetings/1
  # GET /meetings/1.xml
  def show
    @user = get_user
    @hash = {}
    @meeting = Meeting.find(params[:id])
    @attendees = Usermeeting.find_all_by_meeting_id_and_is_attending(@meeting.id, 1)
    @host = Usermeeting.find_by_meeting_id_and_is_host(@meeting.id, 1)
     
    @actual = []
    for attendee in @attendees
      @actual << User.find_by_id(attendee.user_id)
    end
    @comments = Comment.find_all_by_meeting_id(@meeting.id)
    
    for c in @comments
      @hash[c] = User.find_by_id(c.user_id)
    end
    # hash[comment] = author
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meeting }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.xml
  def new
    @meeting = Meeting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meeting }
    end
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
  end

  # POST /meetings
  # POST /meetings.xml
  def create
    @user = get_user
    @meeting = Meeting.new(params[:meeting])
    @attendees = Usermeeting.find_all_by_meeting_id_and_is_attending(@meeting, 1)
    @actual = []
    for attendee in @attendees
      @actual << User.find_by_id(attendee.user_id)
    end
    respond_to do |format|
      if @meeting.save
        flash[:notice] = 'Meeting was successfully created.'
        
        Usermeeting.create(:user_id => @user.id, :meeting_id => @meeting.id, :is_host => 1, :is_attending => 1)
        
        #*************************************************************
        for attendee in @actual
          Meetingmailer.deliver_meeting_notification(attendee,@meeting)
        end
        #*************************************************************
        format.html { redirect_to(@meeting) }
        format.xml  { render :xml => @meeting, :status => :created, :location => @meeting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.xml
  def update
    @meeting = Meeting.find(params[:id])
    @attendees = Usermeeting.find_all_by_meeting_id_and_is_attending(@meeting, 1)
    @actual = []
    for attendee in @attendees
      @actual << User.find_by_id(attendee.user_id)
    end
    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        flash[:notice] = 'Meeting was successfully updated.'
        #*************************************************************
        @temp = @meeting.attendees.split(",\s")
        for attendee in @temp
          Meetingmailer.deliver_meeting_notification(attendee,@meeting)
        end
        #*************************************************************
        
        format.html { redirect_to(@meeting) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def is_host(user, meeting)
    Usermeeting.find_by_user_id_and_meeting_id(user.id, meeting.id).is_host == 1
  end
  
  # DELETE /meetings/1
  # DELETE /meetings/1.xml
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to(meetings_url) }
      format.xml  { head :ok }
    end
  end
  
  def find_schedule(user)
    @schedule = Schedule.find_by_user_id(user.id) 
  end
end
