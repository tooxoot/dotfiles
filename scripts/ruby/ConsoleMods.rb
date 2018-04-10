# Adds colorizations to the String class
class String

  # Colorizes the Sting using following integer codes:
  # (Note that not all codes are supported in every Environment)
  #
  # 0:	Reset / Normal
  # 1:	Bold or increased intensity
  # 2:	Faint (decreased intensity)	- Not widely supported.
  # 3:	Italic: on	- Not widely supported. Sometimes treated as inverse.
  # 4:	Underline: Single
  # 5:	Blink: Slow	- less than 150 per minute
  # 6:	Blink: Rapid -	MS-DOS ANSI.SYS; 150+ per minute; not widely supported
  # 7:	Image: Negative	inverse or reverse; swap foreground and background (reverse video)
  # 8:	Conceal -	Not widely supported.
  # 9:	Crossed-out	Characters legible, but marked for deletion. - Not widely supported.
  # 10:	Primary(default) font
  # 11–19:	{\displaystyle n} n-th alternate font	Select the {\displaystyle n}
  # n-th alternate font (14 being the fourth alternate font, up to 19 being the 9th alternate font).
  # 20:	Fraktur	hardly ever supported
  # 21: Bold: off or Underline: Double	Bold off not widely supported; double underline hardly ever supported.
  # 22: Normal color or intensity	Neither bold nor faint
  # 23: Not italic, not Fraktur
  # 24: Underline: None	Not singly or doubly underlined
  # 25: Blink: off
  # 26: Reserved
  # 27:	Image: Positive
  # 28:	Reveal	conceal off
  # 29:	Not crossed out
  # 30–37:	Set text color (foreground)	30 + {\displaystyle n} n, where {\displaystyle n} n is from the color table below
  # 38:	Reserved for extended set foreground color	typical supported next arguments are 5;n where {\displaystyle n} n is color index (0..255) or 2;r;g;b where {\displaystyle r,g,b} r,g,b are red, green and blue color channels (out of 255)
  # 39:	Default text color (foreground)	implementation defined (according to standard)
  # 40–47:	Set background color	40 + {\displaystyle n} n, where {\displaystyle n} n is from the color table below
  # 48:	Reserved for extended set background color	typical supported next arguments are 5;n where {\displaystyle n} n is color index (0..255) or 2;r;g;b where {\displaystyle r,g,b} r,g,b are red, green and blue color channels (out of 255)
  # 49:	Default background color	implementation defined (according to standard)
  # 50:	Reserved
  # 51:	Framed
  # 52:	Encircled
  # 53:	Overlined
  # 54:	Not framed or encircled
  # 55:	Not overlined
  # 56–59:	Reserved
  #
  # Params:
  # +modcode+:: composition of one ore more of the above integer codes.
  # To use multiple codes either compose an Array or concatenate the different
  # codes into a single String seperated by ';'.
  def mod(modcode)
    return self if modcode == nil
    tmp = ''
    if modcode.is_a? Array
      modcode.each { |mod|
        tmp += ';' if tmp != ''
        tmp += "#{mod}"
      }
    elsif modcode.is_a? String or modcode.is_a? Integer
      tmp = modcode
    end
    "\e[#{tmp}m#{self}\e[0m"
  end
end
