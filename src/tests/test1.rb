require 'test/unit'

require_relative "../classes/methods.rb"

class NewClass < Test::Unit::TestCase
    def test1
        assert_equal ticket_edit(), ['from','subject','description','status','priority']
    end
end