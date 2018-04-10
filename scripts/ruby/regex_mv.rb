Helpstring = "\
USAGE:
search_regex replace_string [-v]
It's recommended to place the search_regex and replace_string into single quotes.

Example:
'(\d\d)..(\w+)' '$1__$2' -v

Options:
-v    Verbose output shows used mv / cp commands.
-cp   Performs cp instead of mv command.
-dry  Only prints the commands but does not run them.
---"

if ['-h', '-help', '--help', 'help', nil].include?(ARGV[0]) then
  puts Helpstring
end

Parameters = {}

idx = 1
while ARGV[(idx += 1)] do
  type, _ , argument = /-(\w+)(\s*=?\s*)(.*)/.match(ARGV[idx]).captures
  Parameters[type] = argument
end

Options = {
  command: 'mv'
}

Parameters.each { |k, v|
  case k
    when 'v'
      Options[:verbose] = true
    when 'cp'
      Options[:command] = 'cp'
    when 'dry'
      Options[:dry] = true
    else
      puts "ERROR: Unknown option: '#{k}' with argument 'v'"
  end
}


Search = /#{ARGV[0]}/
Replace = ARGV[1].gsub(/\$(\d+)/, '\\\1')

File_Names = Dir["./*"].map! { |name| name.gsub('./', '') }
Changed_Names = File_Names.map { |name| name.gsub(Search, Replace)  }

File_Names.each_index { |idx|
  if File_Names[idx] == Changed_Names[idx] then next end

  command = "#{Options[:command]} '#{File_Names[idx]}' '#{Changed_Names[idx]}'"

  if Options[:verbose] || Options[:dry] then puts command end

  if !Options[:dry] then `#{command}` end
}
