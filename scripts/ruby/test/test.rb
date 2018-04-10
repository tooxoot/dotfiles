# Executes the find command with the path given from the command line.
Rootpath = ARGV[0] || "*"
puts ">> Replacing recursively from path:" + Rootpath
Paths = `find #{Rootpath}`

# Executes the substitution for each found file
Paths.each_line {|path|
  path = path.chomp()
  if (File.directory?("#{path}")) then next end
  text = File.open("#{path}").read
  # Substitution magic replacing all found regex results with the first result from the grep command.
  text = text.gsub(/(ORIGINAL)/) { |match|
      original = $1
      replacement = `grep -m 1 #{MATCHINGGROUP} b`.gsub(/\n/, '')
      # Returns the original value if no Replacement was found.
      if !replacement || replacement.length == 0
        puts "## NO REPLACEMENT FOUND FOR #{path} : #{original}"
        system("echo #{path} : #{original} >> no_replacement_found")
        next original
      else
        next replacement
      end
  }

  # Writes teporary file then overrides existing file
  File.write("#{path}TEMP",text)
  puts "> Finished writing file: " + path
  `mv #{path}TEMP #{path}`
  puts ">> Finished moving file: #{path}"
}
