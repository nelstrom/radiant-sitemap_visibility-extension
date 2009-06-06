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
  
  desc %{
    Renders the contained elements only if the current contextual page has one or
    more child pages which have not been hidden from the sitemap.

    *Usage:*
    
    <pre><code><r:if_children_visible_to_sitemap>...</r:if_children_visible_to_sitemap></code></pre>
  }
  tag "if_children_visible_to_sitemap" do |tag|
    conditions = children_find_options(tag)[:conditions]
    conditions.first << " and (hide_from_sitemap = ?)"
    conditions       << 0
    children = tag.locals.page.children.count(:conditions => conditions)
    tag.expand if children > 0
  end
  
end