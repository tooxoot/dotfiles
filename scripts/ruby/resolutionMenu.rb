require File.expand_path('ConsoleMenu.rb', File.dirname(__FILE__))
require File.expand_path('ConsoleMenuHeader.rb', File.dirname(__FILE__))

system("xrandr --newmode \"1920x1080\"  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync")
system("xrandr --newmode \"1600x900\"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync")

# system("xrandr --newmode \"test3\"   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync")

resolution = ""

MenuHash = {
  #16:9
  # "\t\t test"       => lambda { resolution = 'test3' },
  "\t\t 960x540"       => lambda { resolution = '960x540' },
  "\t\t 1024x576"      => lambda { resolution = '1024x576' },
  "\t\t 1280x720"      => lambda { resolution = '1280x720' },
  "\t\t 1366x768"      => lambda { resolution = '1366x768' },
  "\t\t 1600x900"      => lambda { resolution = '1600x900' },
  "\t\t 1920x1080"      => lambda { resolution = '1920x1080' },
  #4:3
  "\t\t 800x600"       => lambda { resolution = '800x600' },
  "\t\t 960x720"       => lambda { resolution = '960x720' },
  "\t\t 1024x768"      => lambda { resolution = '1024x768' },
  "\t\t 1200x900"      => lambda { resolution = '1200x900' }
}

menu = ConsoleMenu.new(MenuHash.keys, MenuHash.values)
ConsoleMenuHeader.new("Resolution Menu        \n", menu, 4)
menu.addEvent(:beforePrintingItemN, lambda { |i| if i == 0 then puts"\t16:9" end })
menu.addEvent(:beforePrintingItemN, lambda { |i| if i == 6 then puts"\t4:3" end })
menu.enter
unless resolution == ""
  puts("\nPicked #{resolution}")
  system("xrandr --addmode HDMI1 #{resolution}")
  system("xrandr --output HDMI1 --mode #{resolution} --right-of eDP1&")
  system("sleep 3")
end
