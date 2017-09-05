require "spec_helper"

class GenericPageObject
  include Capybara::Status::Error

  def visit(path)
    note_error(path)
  end

  def find(_)
    FakeElement.new
  end

  def find_all(_)
    [FakeElement.new]
  end

  def status_code
    500
  end

  class FakeElement
    def text
      "Success!"
    end
  end
end

RSpec.describe Capybara::Status::Error do
  it "has a version number" do
    expect(Capybara::Status::Error::VERSION).not_to be nil
  end

  it "reports useful error messages" do
    url = "http://google.com/capybara-status-error"
    expect { GenericPageObject.new.visit(url) }.to raise_error(Capybara::WindowError)
  end
end
