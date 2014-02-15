IMG_SIZE = 640
FPS = 20
MOVE_SEC = 1
START_NUM = 160

def combine_images(img_count, size, sec)
  p "combine_images start!"
  frame = FPS * sec
  frame.times do |i|
    num = START_NUM + i
    images = []
    size_tmp = size * 2 / img_count

    p "resize!"
    1.upto(img_count) do |y|
      1.upto(img_count) do |x|
        src = "images/#{x}_#{y}/img_%04d.jpg" % num
        res = "images/#{x}_#{y}/img_r%04d.jpg" % num
        `convert -define jpeg:size=#{size_tmp}x#{size_tmp} -resize #{size_tmp}x#{size_tmp} #{src} #{res}`
        images << res
      end
    end

    tmp = "output/tmp%04d.jpg" % num
    output = "output/output%04d.jpg" % num

    p "montage!"
    `montage -tile #{img_count}x#{img_count} -geometry #{size_tmp}x#{size_tmp} #{images.join(' ')} #{tmp}`

    #trim_size = (i < FPS * MOVE_SEC) ? (IMG_SIZE + (IMG_SIZE / (FPS * MOVE_SEC)) * i) : IMG_SIZE * 2
    trim_size = IMG_SIZE + (IMG_SIZE / (FPS * MOVE_SEC)) * i
    p "trim!"
    `convert -gravity center -crop #{trim_size}x#{trim_size}+0+0 #{tmp} #{output}`

    p "resize!"
    `convert -define jpeg:size=#{size}x#{size} -resize #{size}x#{size} #{output} #{output}`
  end
end

combine_images(4, 640, 1)
