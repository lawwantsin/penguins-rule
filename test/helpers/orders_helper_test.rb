require 'test_helper'

describe OrdersHelper do

  describe '#clouds' do

    class DummyClass < ActionView::Base
      include OrdersHelper
    end

    def helper
      @helper ||= DummyClass.new
    end

    it 'splits out clouds' do
      output = helper.clouds
      assert_match(/img class=\"cloud\"/, output)
    end

  end

end
