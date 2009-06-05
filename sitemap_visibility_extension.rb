# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SitemapVisibilityExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/sitemap_visibility"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :sitemap_visibility
  #   end
  # end
  
  def activate
    # admin.tabs.add "Sitemap Visibility", "/admin/sitemap_visibility", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Sitemap Visibility"
  end
  
end
