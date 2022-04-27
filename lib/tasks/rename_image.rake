require 'rubygems'

namespace :images do
  desc 'Easily rename an image'
  task rename: :environment do
    assets = File.join(Rails.root.join('lib', 'assets')) # put images in lib/assets

    Dir["#{assets}/**/*"].each_with_index do |filename, i|
      i += 1
      image_name = File.basename(filename, File.extname(filename))
      image_rename = "grand-canyon-wedding-gallery-#{i}.jpg"
      filerenamed = File.join(assets, image_rename)

      File.rename(filename, filerenamed)
      puts "renamed #{image_name}".yellow
      puts "to #{image_rename}".green
    end
  end
end
