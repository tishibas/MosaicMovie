# -*- coding: undecided -*-
require 'optparse'

origin_movie = ""
origin_movie = ARGV[0]  

movie_file = "#{origin_movie}" + ".MOV"

convert_movie_file = "#{origin_movie}" + ".avi"
#convert_movie_file = "#{origin_movie}" + ".mp4"

# MOVを横幅640のaviに変換
`ffmpeg -i "#{movie_file}" -s 640x1138 -r 20 -b 64000k -vf transpose=1 -vcodec libx264 "#{convert_movie_file}"`

#`ffmpeg -i "#{movie_file}" -s 640x1138 -r 20 -b 64000k -vcodec libx264 -strict -2 "#{convert_movie_file}"`

`mkdir #{origin_movie}`

# aviを連番のjpgに変換
`ffmpeg -i "#{convert_movie_file}" -f image2 "./#{origin_movie}/img_%04d.jpg"`

# jpgを中心から640x640でリサイズ
`mogrify -gravity center -crop 640x640+0+0 "./#{origin_movie}/*.jpg"`

