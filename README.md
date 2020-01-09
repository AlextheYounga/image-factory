# README

This app uses the awesome webffi gem: https://github.com/le0pard/webp-ffi
Please follow the steps from gem Readme


All image manipulation programs are found in the lib/tasks folder.
All images to be manipulated should be placed in the assets/images folder.

Available commands:
rake assets:find_unused_images          # Finds unused images throughout an application
rake assets:precompile                  # Compile all the assets named in config.assets.precompile
rake assets:rename_images               # Easily rename an image
rake assets:resize_image                # Resizes an image to multiple specific sizes
rake assets:transform_image             # Transforms an image's type
rake assets:webp                        # Create .webp versions of assets
