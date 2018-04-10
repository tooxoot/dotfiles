Primary   = `xclip -o -selection primary`
Clipboard = `xclip -o -selection clipboard`

puts Clipboard
puts Primary

system("echo '#{Primary}' | xclip -selection c")
system("echo  '#{Clipboard}' | xclip -selection primary")
