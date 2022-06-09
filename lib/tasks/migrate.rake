require 'io/console'

namespace :app do
  desc "Add images"
  task :migrate_images => :environment do
    Dir.chdir('image_folder')
    route = Dir.new(Dir.pwd)
    route.each do |r|
      if r != '.' && r != '..'
        category = Category.find_or_create_by(title: r.to_s, user_id: 1)
        photo = Dir.new(r)
        puts "Category '#{r.to_s}' created"

        photo.each do |p|
          if p != '.' && p != '..'
          
            Photo.create(user_id: 1, category_id: category.id, image: File.open(File.join(route.path, r, p)))
            puts "Photo '#{p.to_s}' created"
          end
        end
      end
    end
  end
end
