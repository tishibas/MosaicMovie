require 'optparse'

origin_movie = ""

#opt = OptionParser.new
#opt.on('--filename') {|v| origin_movie = v }

origin_movie = ARGV[0]  
#puts origin_movie

=begin
`ffmpeg -i IMG_4214.MOV -s 640x1138 -r 20 -vf transpose=1 IMG_4214.avi`
`mkdir IMG_4214_script_test`
`ffmpeg -i IMG_4214.avi -f image2 -vcodec png "./IMG_4214_script_test/img_%04d.png"`
`mogrify -gravity center -crop 640x640+0+0 ./IMG_4214_script_test/*.png`

`ffmpeg -i IMG_4215.MOV -s 640x1138 -r 20 -vf transpose=1 IMG_4215.avi`
`mkdir IMG_4215_script_test`
`ffmpeg -i IMG_4215.avi -f image2 -vcodec png "./IMG_4215_script_test/img_%04d.png"`
`mogrify -gravity center -crop 640x640+0+0 ./IMG_4215_script_test/*.png`
=end


movie_file = "#{origin_movie}" + ".MOV"
convert_movie_file = "#{origin_movie}" + ".avi"
#puts [movie_file, convert_movie_file]

`ffmpeg -i "#{movie_file}" -s 640x1138 -r 20 -vf transpose=1 "#{convert_movie_file}"`
`mkdir #{origin_movie}`
#`ffmpeg -i "#{convert_movie_file}" -f image2 -vcodec png "./#{origin_movie}/img_%04d.png"`
`ffmpeg -i "#{convert_movie_file}" -f image2 "./#{origin_movie}/img_%04d.jpg"`
#`mogrify -format png "./#{origin_movie}/*.jpg"`
#`mogrify -gravity center -crop 640x640+0+0 "./#{origin_movie}/*.png"`
`mogrify -gravity center -crop 640x640+0+0 "./#{origin_movie}/*.jpg"`
