# notepad.rb

class Note
	attr_accessor :title, :content, :type, :tags, :timestamp, :priority
 
	def initialize(title, content, type, tags, priority)
	  @title = title
	  @content = content
	  @type = type
	  @tags = tags
	  @timestamp = Time.now
	  @priority = priority
	end
 end
 
 class Notepad
	attr_accessor :notes
 
	def initialize
	  @notes = []
	end
 
	def add_note(note)
	  @notes << note
	end
 
	def search_notes(query)
	  @notes.select { |note| note.title.include?(query) || note.content.include?(query) || note.tags.include?(query) }
	end
 
	def filter_by_type(type)
	  @notes.select { |note| note.type == type }
	end
 
	def filter_by_time(start_time, end_time)
	  @notes.select { |note| note.timestamp.between?(start_time, end_time) }
	end
 
	def sort_by_last_modified
	  @notes.sort_by { |note| note.timestamp }.reverse
	end
 
	def sort_by_priority
	  @notes.sort_by { |note| note.priority }.reverse
	end
 end
 