#! bin/bash
echo "+++++++++++++++++++++++++++++++++"
echo ""
echo "Enter number to pick resolution:"
echo ""
echo "16:9"
echo "  1)  960x540"
echo "  2)  1024x576"
echo "  3)  1280x720"
echo "  4)  1366x768"
echo ""
echo "4:3"
echo "  5)  800x600"
echo "  6)  960x720"
echo "  7)  1024x768"
echo "  8)  1200x900"
echo ""
echo "q)  exit"
echo ""
echo "+++++++++++++++++++++++++++++++++"
while [[ true ]]; do
  read input
  case "$input" in
    1)  echo "Picked resoltuion: 960x540"
        exec xrandr --addmode HDMI1 960x540 &
        exec xrandr --output HDMI1 --mode 960x540 --right-of eDP1 &
        sleep 0.5
        exit
        ;;
    2)  echo "Picked resoltuion: 1024x576"
        exec xrandr --addmode HDMI1 1024x576 &
        exec xrandr --output HDMI1 --mode 1024x576 --right-of eDP1 &
        sleep 0.5
        exit
        ;;
    3)  echo "Picked resoltuion: 1280x720"
        exec xrandr --addmode HDMI1 1280x720 &
        exec xrandr --output HDMI1 --mode 1280x720 --right-of eDP1 &
        sleep 0.5
        exit
        ;;
    4)  echo "Picked resoltuion: 1366x768"
        exec xrandr --addmode HDMI1 1366x768 &
        exec xrandr --output HDMI1 --mode 1366x768 --right-of eDP1 &
        sleep 0.5
        exit
        ;;
    5)  echo "Picked resoltuion: 800x600"
        exec xrandr --addmode HDMI1 800x600 &
        exec xrandr --output HDMI1 --mode 800x600 --right-of eDP1 &
        sleep 0.5
        exit
        ;;
    6)  echo "Picked resoltuion: 960x720"
        exec xrandr --addmode HDMI1 960x720 &
        exec xrandr --output HDMI1 --mode 960x720 --right-of eDP1 *
        sleep 0.5
        exit
        ;;
    7)  echo "Picked resoltuion: 1024x768"
        exec xrandr --addmode HDMI1 1024x768 &
        exec xrandr --output HDMI1 --mode 1024x768 --right-of eDP1 &
        sleep 0.5
        exit
        ;;
    8)  echo "Picked resoltuion: 1200x900"
        exec xrandr --addmode HDMI1 960×540 &
        exec xrandr --output HDMI1 --mode 960x540 --right-of eDP1 *
        sleep 0.5
        exit
        ;;
    q)  echo "Exit without changes"
        sleep 0.5
        exit
        ;;
  esac
done
