trim_size = 300
num = 0
while trim_size <= 900 do
  output = "output_images/output%003d.jpg" % num
  `convert -gravity center -crop #{trim_size}x#{trim_size}+0+0 output.jpg #{output}`
  `convert -define jpeg:size=300x300 -resize 300x300 #{output} #{output}`
  trim_size += 10
  num += 1
end
