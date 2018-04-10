require File.expand_path('KeyListener.rb', File.dirname(__FILE__))
require File.expand_path('ConsoleMods.rb', File.dirname(__FILE__))

# TODO Colorizations
# TODO Eventsystem? Any standarts?

# Creates a console menu consisting of different items.
# ::Navigate using arrowkeys
# ::Select item by pressing enter
# ::Exit by pressing escape
class ConsoleMenu
  include KeyListener

  # Initializes the menu from given item collection and procs collection.
  # The procs are executed when the corresponding item is selected.
  # Params:
  # +menuItems+:: +Collection+ of items which are parsed using the +to_s+ method.
  # +menuProcs+:: +Collection+ consisting of +Procs+ which should have the
  # same position in the collection as the corresponding item in the +menuItems+
  # collection.
  # +modcode+:: The modcode described in ConsoleMods.rb with wich the MenuItems
  # are highlighted.
  def initialize(menuItems, menuProcs, highlightcode = [43,30])
    menuProcs.each { |lam|
         raise ArgumentError, 'Second argument has to consist of Procs!' if !(lam.is_a? Proc)
       }
    @MenuItems = menuItems.collect { |point| point.to_s }
    @MenuProcs = menuProcs
    #Collection in which different event procs are stored.
    @Calls = {
      # Executed directly afte entering the menu by using the enter method.
      :whenEntered            => [],

      # Executed before exiting the menu.
      :whenExited             => [],

      # Executed every time before reprinting the menu.
      :beforePrinting         => [],

      # Executed each time before Printing one of the Items
      # Params with which the Procs are called:
      # +i+:: The index of the printed item.
      :beforePrintingItemN   => [],

      # Executed every time after reprinting the menu.
      :afterPrinting          => [],

      # Executed every time before processing the input received from the KeyListener.
      # Params with which the Procs are called :
      # +char+:: The Character received from the KeyListener.
      :beforeInputProcessign  => [],

      # Executed every time after processing the input received from the KeyListener.
      # Params with which the Procs are called:
      # +char+:: The Character received from the KeyListener.
      # +exited+:: +Bool+ describing if the menu will be exited.
      :afterInputProcessign   => [],

      # Executed when the KeyListener received Keys other than arrowkeys,
      # the return key or the escape key.
      # Params with which the Procs are called:
      # +char+:: The Character received from the KeyListener.
      :defaultInput           => []
    }
    @Highlightcode = highlightcode
    @selected = 0
    # Is set to true as soon as the return or escape key was hit and the input
    # was processed.
    @exited = false
  end

  # Method to enter the menu
  def enter
    @Calls[:whenEntered].each { |lam| lam.call if lam.is_a? Proc }
    @exited = false
    while !@exited do inputLoop end
    @Calls[:whenExited].each { |lam| lam.call if lam.is_a? Proc }
  end

  # Loop function clearing the screen, printing the menu and processing the input.
  def inputLoop
    system("clear")
    @Calls[:beforePrinting].each { |lam| lam.call if lam.is_a? Proc }
    print_menu
    @Calls[:afterPrinting].each { |lam| lam.call if lam.is_a? Proc }
    char = read_char
    @Calls[:beforeInputProcessign].each { |lam| lam.call(char) if lam.is_a? Proc }
    process_Input(char)
    @Calls[:afterInputProcessign].each { |lam| lam.call(@exited,char) if lam.is_a? Proc }
  end

  # Processes the input received by the KeyListener.
  def process_Input(char)
    return if @exited
    case char
    when "\e[A"
      @selected = (@selected - 1) % @MenuItems.count
    when "\e[B"
      @selected = (@selected + 1) % @MenuItems.count
    when "\e"
      @exited = true
    when "\r"
      @exited = true
      @MenuProcs[@selected].call
    else
      @Calls[:defaultInput].each { |lam| lam.call(char) if lam.is_a? Proc }
    end
  end

  # Prints the menu to the console highlighting the current selection.
  def print_menu
    tmp = 0
    @MenuItems.each { |item|
      @Calls[:beforePrintingItemN].each { |lam| lam.call(tmp) if lam.is_a? Proc }
      tmp == @selected ? (puts item.mod(@Highlightcode)) : (puts item)
      tmp += 1
    }
  end

  # Instructing the menu to exit after current Loop.
  def exitAfterLoop
    @exited = true
  end

  # Returns if the menu was already instructed to exit.
  def wasExited
    return @exited
  end

  # Calls a specific Proc.
  # Params:
  # +int+:: Position of executed proc in the proc collection. Corresponding to
  # item on the same position.
  def executeMenuLambda(int)
    @MenuProcs[int].call
  end

  # Adds proc to Calls hash. See above for further Detail.
  # Params:
  # +eventKey+:: One of the +Symbols+ defined in the Calls hash.
  # +eventProc+:: +Proc+ that is executed at the time defined by the eventKey.
  def addEvent (eventKey, eventProc)
    @Calls[eventKey] << eventProc if eventProc.is_a? Proc
  end

  # Removes proc from Calls hash. See above for further Detail.
  # Params:
  # +eventKey+:: One of the +Symbols+ defined in the Calls hash.
  # +eventProc+:: +Proc+ which is removed.
  def removeEvent (eventKey, eventProc)
    @Calls[eventKey].delete(eventProc)
  end
end
