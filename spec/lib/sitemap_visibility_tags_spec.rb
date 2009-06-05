require File.dirname(__FILE__) + '/../spec_helper'

describe "sitemap_visibility" do
  dataset :pages
  
  describe "unless_hidden tag" do
    before :each do
      @visible = Page.new(page_params(:hide_from_sitemap => false))
      @hidden  = Page.new(page_params(:hide_from_sitemap => true))
    end
  
    it "should expand for visible page" do
      @visible.should render("<r:sitemap_visibility:unless_hidden>YES!</r:sitemap_visibility:unless_hidden>").
      as("YES!")
    end
  
    it "should not expand for hidden page" do
      @hidden.should render("<r:sitemap_visibility:unless_hidden>invisible</r:sitemap_visibility:unless_hidden>").
      as("")
    end

  end
  
  describe "if_hidden tag" do
    before :each do
      @visible = Page.new(page_params(:hide_from_sitemap => false))
      @hidden  = Page.new(page_params(:hide_from_sitemap => true))
    end
  
    it "should not expand for visible page" do
      @visible.should render("<r:sitemap_visibility:if_hidden>invisible</r:sitemap_visibility:if_hidden>").
      as("")
    end
  
    it "should expand for hidden page" do
      @hidden.should render("<r:sitemap_visibility:if_hidden>YES!</r:sitemap_visibility:if_hidden>").
      as("YES!")
    end

  end
  
  
end