require 'test/unit'
require_relative '../../lib/pages/mio_page'
require_relative '../../lib/mio_exceptions/mio_exceptions'
require_relative '../test_helper'

class MioPageTest < MioTest
  include MioExceptions

  def setup
    @browser = Watir::Browser.new :phantomjs
    @base_page = MioPage.new @browser
  end

  def test_is_a_mio_page
    assert_kind_of(MioPage, @base_page)
  end

  def teardown
    @browser.close
  end

end
