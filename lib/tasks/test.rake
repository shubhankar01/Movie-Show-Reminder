# lib/tasks/test.rake
namespace :crono do
  desc 'Update all tables'
  task :hello => :environment do
    puts "Started Sending Reminder"
    @maildata = User.get_channel_movie_data
    @userdata = User.get_user_slot_data

    @maildata.each do |row|
        @userrow = @userdata.find{|r| r.slot_id.to_i == row.slot_id.to_i} 
	if !@userrow.nil? then
                puts "Email Sent"
        	Usermailer.welcome_email(row,@userrow).deliver_now!
        end
    end
    
  end
end
