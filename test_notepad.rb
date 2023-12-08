  # test_notepad.rb
  
  require 'minitest/autorun'
  require_relative 'notepad'
  
  class TestNotepad < Minitest::Test
    def setup
      @notepad = Notepad.new
      @note1 = Note.new('Meeting', 'Discuss project updates', 'text', ['work', 'meeting'], 2)
      @note2 = Note.new('Shopping List', 'Milk, eggs, bread', 'list', ['grocery'], 1)
      @note3 = Note.new('Idea', 'New app concept', 'text', ['brainstorm'], 3)
      @notepad.add_note(@note1)
      @notepad.add_note(@note2)
      @notepad.add_note(@note3)
    end
  
    def test_search_notes
      result = @notepad.search_notes('Meeting')
      assert_equal [@note1], result
    end
  
    def test_filter_by_type
      result = @notepad.filter_by_type('text')
      assert_equal [@note1, @note3], result
    end
  
    def test_filter_by_time
      result = @notepad.filter_by_time(Time.now - 3600, Time.now + 3600)
      assert_equal [@note1, @note2, @note3], result
    end
  
    def test_sort_by_last_modified
      result = @notepad.sort_by_last_modified
      assert_equal [@note3, @note2, @note1], result
    end
  
    def test_sort_by_priority
      result = @notepad.sort_by_priority
      assert_equal [@note3, @note1, @note2], result
    end
  end
  