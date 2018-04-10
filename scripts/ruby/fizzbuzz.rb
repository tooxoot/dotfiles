i = 1
while i < ARGV[0].to_i do
  output = ""

  if  i % 3 === 0 || i.to_s.include?('3') then output += "FIZZ" end
  if  i % 5 === 0 || i.to_s.include?('5') then output += "BUZZ" end

  if output === "" then output = i.to_s end

  puts output
  i += 1
end
