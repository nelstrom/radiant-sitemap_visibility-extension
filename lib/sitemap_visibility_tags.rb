module SitemapVisibilityTags
  include Radiant::Taggable
  
  tag 'sitemap_visibility' do |tag|
    tag.expand
  end
  
  desc %Q{
    Contents of this tag are rendered only if the current page is 
    *not* hidden from the sitemap.
  }
  tag 'sitemap_visibility:unless_hidden' do |tag|
    tag.expand unless tag.locals.page.hide_from_sitemap
  end
  
  desc %Q{
    Contents of this tag are rendered only if the current page is 
    hidden from the sitemap.
  }
  tag 'sitemap_visibility:if_hidden' do |tag|
    tag.expand if tag.locals.page.hide_from_sitemap
  end
  
end