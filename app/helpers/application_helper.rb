module ApplicationHelper
	#When you are in a ruby file you dont need the tags '<% %>'
	#Helper methods help to speed things up & removes repetition
	#Could be in views/admin but this enables a tidy code / easy to read

	#Default truth is Active. Default falsey is Pending 
	#Otherwise.status_converter(status, truthy:nil, falsey:nil)
	#and do it manuallly for the others.
	def status_converter(status, truthy:'Active', falsey: 'Pending')
	if status
	truthy
else
	falsey
end
end
#time_ago_in_words(@post.created_at) .. making it into a helper so I dont have to keep repeating myself
def time_ago time
	"#{time_ago_in_words(time)} ago"
end

def double_digit_number n
	'%02d' % n
end 
end

def current_administrator
		@administrator ||= Administrator.find(session[:current_administrator_id]) if session[:current_administrator_id]
	end
