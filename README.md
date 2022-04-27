# README

This app uses the awesome webffi gem: https://github.com/le0pard/webp-ffi

## Required libraries
Linux:

```sudo apt-get install libjpeg-dev libpng-dev libtiff-dev libwebp-dev```

MacOS:

```brew install libjpg libpng libtiff webp```

All image manipulation programs are found in the lib/tasks folder.
All images to be manipulated should be placed in the lib/assets folder.

Available commands:

rake images:rename                      # Easily rename an image

rake images:resize                      # Resizes an image to multiple specific sizes

rake images:transform                   # Transforms an image's type

rake images:webp                        # Create .webp versions of assets

rake images:clear                       # Delete old assets placed in the lib/assets folder