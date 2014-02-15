def combine_images(x_count, y_count, f_count, width, height)
  p "combine_images start!"
  1.upto(f_count) do |f|
    images = []
    1.upto(y_count) do |j|
      1.upto(x_count) do |i|
        images << "images/#{i}_#{j}/img_%04d.jpg" % f
      end
    end

    output_filename = "output/tmp%04d.jpg" % f
    `montage -tile #{x_count}x#{y_count} -geometry #{width}x#{height} #{images.join(' ')} #{output_filename}`
  end
end

def trim_image(width, height, f_count) 
  p "trim_image start!"
  169.upto(f_count) do |f|
    #trim_size = width + ((f - 40) * 10)
    tmp = "output/tmp%04d.jpg" % f
    output = "output/output%04d.jpg" % f
    #`convert -gravity center -crop #{trim_size}x#{trim_size}+0+0 #{tmp} #{output}`

    # for jpeg
    `convert -define jpeg:size=#{width}x#{height} -resize #{width}x#{height} #{tmp} #{output}`
    # for png
    #`convert -resize #{width}x#{height} #{output} #{output}`
  end
end

#combine_images(3, 3, 183, 640, 640)
trim_image(640, 640, 183)
