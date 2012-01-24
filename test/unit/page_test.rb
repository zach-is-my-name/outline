require 'test_helper'

class PageTest < ActiveSupport::TestCase
  setup do
    @page = Page.new
  end

  test "responds to user" do
    assert_not_nil @page
    assert @page.respond_to?(:context), "Project doesnot respond to :context"
    assert @page.respond_to?(:content), "Project doesnot respond to :content"
  end

  test "Domain responds to pages" do
    assert Domain.first.respond_to?(:pages), "Domain doesnot respond to :pages"
  end

  test "saves and creates content" do
    @page.user = User.first
    @page.domain = Domain.first
    @page.title = "Test"
    assert @page.save
    assert_not_nil @page.content
  end

end