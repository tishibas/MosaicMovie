images = (0..8).map{|num| "test_images/%003d.jpg" % num }.join(' ')

`montage -tile 3x3 -geometry 300x300 #{images} output.jpg`
