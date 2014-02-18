require 'optparse'

origin_movie = {}

i=0
while ARGV[i] do 
origin_movie[i] = ARGV[i]
i += 1  
end

j=0

while j<=i do 
  movie_file = "#{origin_movie[j]}" + ".MOV"
  convert_movie_file = "#{origin_movie[j]}" + ".avi"

  `ffmpeg -i "#{movie_file}" -s 640x1138 -r 20 -b 64000k -vf transpose=1 -vcodec libx264 "#{convert_movie_file}"`
  `mkdir #{origin_movie[j]}`
  `ffmpeg -i "#{convert_movie_file}" -f image2 "./#{origin_movie[j]}/img_%04d.jpg"`
  `mogrify -gravity center -crop 640x640+0+0 "./#{origin_movie[j]}/*.jpg"`

  j += 1
end
