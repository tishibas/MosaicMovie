# -*- coding: undecided -*-
FRAME = 405
#
# 20x20の位置にオープニングムービーを配置
#
1.upto(FRAME) do |f|
  src = "/root/movies/IMG_0225/img_#{1252+f}.jpg"    
  dist = "20_20/%04d.jpg" % f
  p dist
  `ln -f -s #{src} #{dist}`
end

