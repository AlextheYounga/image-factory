require 'webp-ffi'

namespace :images do
  desc 'Create .webp versions of assets'
  task webp: :environment do
    image_types = /\.(?:png|jpe?g)$/

    public_assets = File.join(
      Rails.root.join('lib', 'assets')
    )

    Dir["#{public_assets}/**/*"].each do |filename|
      next if filename.include? 'adventure-quest-5' # unsupported color conversion
      next unless filename =~ image_types

      mtime = File.mtime(filename)
      webp_file = "#{filename}.webp"
      next if File.exist?(webp_file) && File.mtime(webp_file) >= mtime

      begin
        WebP.encode(filename, webp_file, quality: 80)
        File.utime(mtime, mtime, webp_file)
        puts "Webp converted image #{webp_file}".green
      rescue StandardError => e
        puts "Webp convertion error of image #{webp_file}. Error info: #{e.message}".red
      end
    end
  end
end
