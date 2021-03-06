namespace :radiant do
  namespace :extensions do
    namespace :sitemap_visibility do
      
      desc "Runs the migration of the Sitemap Visibility extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          SitemapVisibilityExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          SitemapVisibilityExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Sitemap Visibility to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from SitemapVisibilityExtension"
        Dir[SitemapVisibilityExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(SitemapVisibilityExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end
      
      desc "Delete all 'no-map' page parts, and mark associated pages as hidden from sitemap"
      task :mark => :environment do
        PagePart.find_all_by_name("no-map").each do |target|
          target.page.update_attributes(:hide_from_sitemap => true)
          target.destroy
          print "."
        end
        print "\n"
      end
      
    end
  end
end
