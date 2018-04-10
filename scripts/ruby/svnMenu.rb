require File.expand_path('ConsoleMenu.rb', File.dirname(__FILE__))
require File.expand_path('ConsoleMenuHeader.rb', File.dirname(__FILE__))

MenuHash = {
  "1.    Update ALL"      => lambda {
                                puts MenuHash.values[1].call
                                puts MenuHash.values[2].call
                                puts MenuHash.values[3].call
                              },
  "2.    Update MainRepo" => lambda { system("svn up /home/sven/sep/repo/ --username svenvaupel --password kleine2106") },
  "3.    Update Repo_EF"  => lambda { system("svn up /home/sven/sep/repo_EF/ --username vaupel --password vAupi30") },
  "4.    Update Repo_GH"  => lambda { system("svn up /home/sven/sep/repo_GH/ --username vaupel --password vAupi30") },
  "5.    Lock SEP_2017_SoSe"   => lambda { system("svn lock -m '' /home/sven/sep/repo/SEP_2017_SoSe.xlsx --username svenvaupel --password kleine2106") },
  "6.    Commit Lists \n      (SEP_II_16, EF, GH)"   => lambda {
                                                                  system("svn commit -m '' /home/sven/sep/repo/SEP_2017_SoSe.xlsx --username svenvaupel --password kleine2106")
                                                                  system("svn commit -m '' /home/sven/sep/repo/03_Projektphase/00_Anwesenheitslisten/EF\\ Anwesenheitsliste.xlsx --username svenvaupel --password kleine2106")
                                                                  system("svn commit -m '' /home/sven/sep/repo/03_Projektphase/00_Anwesenheitslisten/GH\\ Anwesenheitslisten.xlsx --username svenvaupel --password kleine2106")
                                                                },
}

menu = ConsoleMenu.new(MenuHash.keys, MenuHash.values)
ConsoleMenuHeader.new("SVN MENU        \n", menu, 4)
menu.enter
