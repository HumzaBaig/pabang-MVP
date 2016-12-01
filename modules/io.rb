module IOStream

  def input_sites
    system "clear"
    puts "Please enter a keyword from the following sites [Glassdoor]"
    print ">> ".chomp

    user_site_choice = gets.chomp!.capitalize!

    while user_site_choice != "Glassdoor"
      puts "Invalid choice"
      puts "Please enter a keyword from the following sites [Glassdoor]"
      print ">> ".chomp

      user_site_choice = gets.chomp!.capitalize!
    end
  end

  def input_positions
    puts "Please enter a position [ex. Software Engineer, Front-end, Back-end, Full-stack]"
    print ">> ".chomp

    user_position_choice = gets.chomp!
  end

  def input_locations
    puts "Please enter a location [ex. San Francisco CA, Los Angeles CA]"
    print ">> ".chomp

    user_location_choice = gets.chomp!
  end

  def input_keywords
    puts "Please enter specific keywords [ex. Ruby, Python, Leadership]"
    puts "Type 'done' when you are finished to exit the prompt"

    user_keywords = []

    while (true)
      print ">> ".chomp
      current_keyword = gets.chomp!
      break if current_keyword.downcase == "done"
      user_keywords << current_keyword
    end

    user_keywords.join("\n")
  end

  def create_file
    filename = "Summary.txt"
    index = 1

    while File.file?(filename)
      filename = "#{"Summary_" + index.to_s + ".txt"}"
      index += 1
    end

    summary_file = File.new(filename, "w+")
    summary_file.puts("Results Summary")
    summary_file.puts("*********************************")
    summary_file.puts("")
    summary_file.close

    filename
  end

  def append_file(filename, input_array)
    File.open(filename, "a") do |file|
      input_array.each do |input|
        file.puts(input)
        file.puts("---------------------------------")
      end
    end
  end

  # returns array of file's content
  def read_file(filename)
    file_content = []
    File.open(filename, 'r') do |file|
      file.each_line do |line|
        line = line[0..-2] #take out carriage return character
        file_content << line
      end
    end

    p file_content
  end
end
