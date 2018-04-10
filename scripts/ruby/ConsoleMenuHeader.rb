require File.expand_path('ConsoleMods.rb', File.dirname(__FILE__))

#Defines a Header for a given ConsoleMenu.
class ConsoleMenuHeader

  # Initializes the Header.
  # Params:
  # +header+:: +String+ displayed as header.
  # +consoleMenu+:: The +ConsoleMenu+ on which the Header is applied.
  # +modcode+:: (Optional) Defines the colorizations as described in ConsoleMods.rb
  def initialize(header, consoleMenu, modcode = nil)
    @ConsoleMenu = consoleMenu
    @Proc = lambda { puts header.mod(modcode)}
    enable
  end

  # Displays the Header
  def enable
    @ConsoleMenu.addEvent(:beforePrinting, @Proc )
  end

  # Disables the header's displaying
  def disable
    @ConsoleMenu.removeEvent(:beforePrinting, @Proc)
  end

  # Changes the Header.
  # Params:
  # +newheader+:: +String+ displayed as header.
  # +modcode+:: (Optional) Defines the colorizations as described in ConsoleMods.rb
  def change(newheader, modcode = nil)
    disable
    @Proc = lambda { puts newheader.mod(modcode)}
    enable
  end
end
