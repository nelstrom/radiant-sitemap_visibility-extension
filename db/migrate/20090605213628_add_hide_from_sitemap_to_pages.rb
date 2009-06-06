class AddHideFromSitemapToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :hide_from_sitemap, :boolean, :default => 0
  end

  def self.down
    remove_column :pages, :hide_from_sitemap
  end
end
