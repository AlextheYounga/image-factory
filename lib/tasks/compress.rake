require 'rubygems'
require 'mini_magick'

namespace :images do
  desc "Transforms an image's type"
  task compress: :environment do
    assets = File.join(File.join(Rails.root.join('lib', 'assets'))) # put images in lib/assets

    Dir["#{assets}/**/*"].each do |filename|
      image = MiniMagick::Image.open(filename)
      output = File.join(Rails.root.join('lib', 'output', "#{File.basename(filename, File.extname(filename))}.jpg"))
      image.write(output) do
        self.format = 'JPEG'
        self.quality = 10
      end
      puts "#{output} write"
    end
  end
end
