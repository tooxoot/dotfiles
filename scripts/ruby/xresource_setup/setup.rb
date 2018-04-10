counter = 0
definitions_hash = {}
action = ''
lines = []
File.open("colours.css", "r") do |infile|
    while (line = infile.gets)
        if line === "\n" || line === "}\n" then next end

        if line === "#define {\n"
           action = 'define'
           next
        elsif line === "#URxvt {\n"
           action = 'colours'
           next
        end

        if action === 'define'
            /([^ ]+?):/.match(line)
            label = $1
            /(#.+?);/.match(line)
            code = $1
            # puts "#define #{label} #{code}"
            lines << "#define #{label} #{code}"
        end

        if action === 'colours'
            /([^ ]+?):/.match(line)
            label = $1
            /:.+?([^ ].+?);/.match(line)
            code = $1
            # puts "*#{label}: #{code}"
            lines << "*#{label}: #{code}"
        end
    end
    puts lines
end

output = ''
lines.each { |line|
    output += line + "\n"
}
File.write('output', output)