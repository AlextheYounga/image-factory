require "rubygems"
require "mini_magick"

namespace :assets do
  desc "Resizes an image to multiple specific sizes"
  task :resize_image => :environment do
    SIZES = ["348", "375", "480", "757", "1600"]

    assets = File.join(File.join(Rails.root.join("app", "assets", "images"))) #put images in lib/assets

    Dir["#{assets}/**/*"].each do |filename|
      SIZES.each do |size|
        next if filename.include? size
        next if filename.include? "thumb"
        image = MiniMagick::Image.open(filename)
        image.path

        if size == "348"
          if image.width > image.height
            image.resize "#{image.width}x235"
            crop_pixels = 348 - image.width
            image.crop "#{crop_pixels}x0+0+0"
          else
            image.resize "348x#{image.height}"
            crop_pixels = 235 - image.height
            image.crop "0x#{crop_pixels}+0+0"
          end
          image.format File.extname(filename)
          output = File.join(Rails.root.join("lib", "assets", "#{File.basename(filename, File.extname(filename))}-thumb#{File.extname(filename)}"))
          image.write output
          puts "#{output} write"
        else
          image.resize "#{size}x#{image.height}"
          image.format File.extname(filename)
          output = File.join(Rails.root.join("lib", "assets", "#{File.basename(filename, File.extname(filename))}-#{size}#{File.extname(filename)}"))
          image.write output
          puts "#{output} write"
        end
      end
    end
  end
end