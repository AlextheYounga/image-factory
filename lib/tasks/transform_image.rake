require "rubygems"
require "mini_magick"

namespace :assets do
  desc "Transforms an image's type"
  task :transform_image => :environment do
    assets = File.join(File.join(Rails.root.join("app", "assets", "images"))) #put images in lib/assets

    Dir["#{assets}/**/*"].each do |filename|
      image = MiniMagick::Image.open(filename)
      image.path
      #change image file type
      image.format "jpg"
      output = File.join(Rails.root.join("output", "images", "#{File.basename(filename, File.extname(filename))}.jpg"))
      image.write output
      puts "#{output} write"
    end
  end
end
