file = "/user/system/test.rb"
# file name
fbname = File.basename file  
puts "File name: "+fbname 
# basename
bname = File.basename file,".rb"
puts "Base name: "+bname 
# file extention
ffextn = File.extname  file   
puts "Extention: "+ffextn 
# path name
path_name= File.dirname  file 
puts "Path name: "+path_name