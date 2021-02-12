
  images = Dir.glob("app/assets/images/**/*")

  images_to_delete = []
  images.each do |image|
    unless File.directory?(image)
      # print "\nChecking #{image}..."
      print "."
      result = `ack -g -i '(app|public)' | ack -x -w '#{File.basename(image)}'`
      if result.empty?
        images_to_delete << image
      else
      end
    end
  end
  puts "\n\nMove unused files running the command below:"
  puts "mv #{images_to_delete.join(" ")} app/assets/images/archived"

