namespace :images do
  desc "Transforms an image's type"
  task clear: :environment do
    assets = File.join(File.join(Rails.root.join('lib', 'assets'))) # put images in lib/assets

    Dir["#{assets}/**/*"].each do |filename|
      File.delete(filename)
      puts "#{filename} deleted"
    end
  end
end
