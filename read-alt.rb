require 'exifr/jpeg'
require 'chunky_png'

def read_alt(image_path)
  file_format = File.extname(image_path).downcase
  
  if file_format == ".jpg" || file_format == ".jpeg"
    read_alt_from_jpg(image_path)
  elsif file_format == ".png"
    read_alt_from_png(image_path)
  else
    raise RuntimeError, "Unsupported image format"
  end
end

def read_alt_from_jpg(image_path)
  exif_data = EXIFR::JPEG.new(image_path)
  return exif_data.image_description  
end

def read_alt_from_png(image_path)
  png = ChunkyPNG::Image.from_file(image_path)
  return png.metadata['Description']
end

dir_path = 'examples'

Dir.foreach(dir_path) do |file_name|
  next if file_name == '.' || file_name == '..'
  
  file_path = File.join(dir_path, file_name)
  
  # Process the file here
  puts read_alt(file_path)
end