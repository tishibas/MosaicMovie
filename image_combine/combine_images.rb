def combine_images(img_count, f_count, size)
  p "combine_images start!"
  1.upto(f_count) do |f|
    images = []
    1.upto(img_count) do |j|
      1.upto(img_count) do |i|
        images << "images/#{i}_#{j}/img_%04d.jpg" % f
      end
    end

    output_filename = "output/tmp%04d.jpg" % f
    `montage -tile #{img_count}x#{img_count} -geometry #{size}x#{size} #{images.join(' ')} #{output_filename}`
  end
end

def trim_image(size, f_count) 
  p "trim_image start!"
  1.upto(f_count) do |f|
    trim_size = size + ((f - 40) * 10)
    tmp = "output/tmp%04d.jpg" % f
    output = "output/output%04d.jpg" % f
    `convert -gravity center -crop #{trim_size}x#{trim_size}+0+0 #{tmp} #{output}`

    `convert -define jpeg:size=#{size}x#{size} -resize #{size}x#{size} #{tmp} #{output}`
  end
end

combine_images(3, 3, 183, 640, 640)
trim_image(640, 640, 183)
