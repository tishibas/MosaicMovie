# -*- coding: utf-8 -*-
FRAME = 405
num = 0
row = 0
col = 0

file = File.open("patch_shuzo3")
src_list = file.readlines.map{ |a| a.strip }

0.upto(3) do |k|
  1.upto(20) do |j|
    1.upto(20) do |i|
    
     img_num = (/\d+/.match((src_list[num]).gsub(/size32\//,'').gsub(/IMG_\d+/,''))).to_s
     
     1.upto(FRAME) do |f|
        n = img_num.to_i + f - FRAME
        count = n < 1 ? 1 : n
        src_filename = "%04d.jpg" % (count) 
        src = src_list[num].gsub(/size32\//,'').gsub(/\d+\.jpg/, src_filename)

        col = i
        row = j

        # 4x4のブロック毎（1ブロック400枚）に画像を配置
        if k == 1 then
          col += 20
        elsif k == 2 then
          row += 20
        elsif k == 3 then
          col += 20
          row += 20
        end
     
        dist = "#{col}_#{row}/%04d.jpg" % f
        p dist
        # 各フォルダにシンボリックリンクを作成
       `ln -f -s #{src} #{dist}`
      end
      num += 1
    end
  end
end

file.close
