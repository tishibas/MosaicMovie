IMG_SIZE = 640
FPS = 20
MOVE_SEC = 1
START_NUM = 60

def combine_images(img_count, size, sec)
  p "combine_images start!"
  frame = FPS * sec
  frame.times do |i|
    num = START_NUM + i
    images = []
    1.upto(img_count) do |y|
      1.upto(img_count) do |x|
        images << "images/#{x}_#{y}/img_%04d.jpg" % num
      end
    end

    tmp = "output/tmp%04d.jpg" % num
    output = "output/output%04d.jpg" % num

    `montage -tile #{img_count}x#{img_count} -geometry #{size}x#{size} #{images.join(' ')} #{tmp}`

    trim_size = (i < FPS * MOVE_SEC) ? (IMG_SIZE + (IMG_SIZE / (FPS * MOVE_SEC)) * i) : IMG_SIZE * 2
    `convert -crop #{trim_size}x#{trim_size}+0+0 #{tmp} #{output}`

    `convert -define jpeg:size=#{size}x#{size} -resize #{size}x#{size} #{output} #{output}`
  end
end

combine_images(2, 640, 5)
