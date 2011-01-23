class Meetingmailer < ActionMailer::Base
  
  def meeting_notification(attendees, meeting)
    recipients attendees
    from "Rendezview.org"
    subject "You've been invited to a Meeting"
    body :attendees => attendees, :meeting => meeting
  end
  

end
