class SitemapVisibilityExtension < Radiant::Extension
  version "0.1"
  description "Adds a 'hide from sitemap' flag to pages."
  url "http://yourwebsite.com/no_map_flag"
  
  def activate
    Page.send :include, SitemapVisibilityTags
    admin.page.edit.add :parts_bottom, "hide_from_sitemap_checkbox", :after => "edit_layout_and_type"
  end
  
  def deactivate
  end
  
end
