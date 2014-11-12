require "rubygems"
require "irb/ext/save-history"
require "yaml"

# with some great help from:
# - http://github.com/iain/osx_settings/blob/master/.irbrc
# - http://github.com/Sutto/dot-files/blob/master/home/.irbrc

# Include this in your .irbrc # https://gist.github.com/zaius/2643079



ANSI = {}
ANSI[:RESET]     = "\e[0m"
ANSI[:BOLD]      = "\e[1m"
ANSI[:UNDERLINE] = "\e[4m"
ANSI[:LGRAY]     = "\e[0;37m"
ANSI[:GRAY]      = "\e[1;30m"
ANSI[:RED]       = "\e[31m"
ANSI[:GREEN]     = "\e[32m"
ANSI[:YELLOW]    = "\e[33m"
ANSI[:BLUE]      = "\e[34m"
ANSI[:MAGENTA]   = "\e[35m"
ANSI[:CYAN]      = "\e[36m"
ANSI[:WHITE]     = "\e[37m"

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

class Object
  # Return only the methods not present on basic objects
  def interesting_methods
    (self.methods - Object.new.methods).sort
  end
end

def extend_console(name, care=true, required=true)
  if care
    require name if required
    yield if block_given?
    $console_extensions << "#{ANSI[:GREEN]}#{name}#{ANSI[:RESET]}"
  else
    $console_extensions << "#{ANSI[:LGRAY]}#{name}#{ANSI[:RESET]}"
  end
  
rescue LoadError
  $console_extensions << "#{ANSI[:RED]}#{name}#{ANSI[:RESET]}"
end
$console_extensions = []

extend_console 'ap' do
  alias pp ap
end

# When you're using Rails 3 console, show queries in the console
extend_console 'rails3', defined?(ActiveSupport::Notifications), false do
  $odd_or_even_queries = false
  ActiveSupport::Notifications.subscribe('sql.active_record') do |*args|
    $odd_or_even_queries = !$odd_or_even_queries
    color = $odd_or_even_queries ? ANSI[:CYAN] : ANSI[:MAGENTA]
    event = ActiveSupport::Notifications::Event.new(*args)
    time  = "%.1fms" % event.duration
    name  = event.payload[:name]
    sql   = event.payload[:sql].gsub("\n", " ").squeeze(" ")
    puts "  #{ANSI[:UNDERLINE]}#{color}#{name} (#{time})#{ANSI[:RESET]}  #{sql}"
  end
end

# Add a method pm that shows every method on an object
# Pass a regex to filter these
extend_console 'pm', true, false do
  def pm(obj, *options) # Print methods
    methods = obj.methods
    methods -= Object.methods unless options.include? :more
    filter  = options.select {|opt| opt.kind_of? Regexp}.first
    methods = methods.select {|name| name =~ filter} if filter

    data = methods.sort.collect do |name|
      method = obj.method(name)
      if method.arity == 0
        args = "()"
      elsif method.arity > 0
        n = method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")})"
      elsif method.arity < 0
        n = -method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")}, ...)"
      end
      klass = $1 if method.inspect =~ /Method: (.*?)#/
      [name.to_s, args, klass]
    end
    max_name = data.collect {|item| item[0].size}.max
    max_args = data.collect {|item| item[1].size}.max
    data.each do |item| 
      print " #{ANSI[:YELLOW]}#{item[0].to_s.rjust(max_name)}#{ANSI[:RESET]}"
      print "#{ANSI[:GREEN]}#{item[1].ljust(max_args)}#{ANSI[:RESET]}"
      print "   #{ANSI[:LGRAY]}#{item[2]}#{ANSI[:RESET]}\n"
    end
    data.size
  end
end

# Show results of all extension-loading
puts "#{ANSI[:LGRAY]}~> Console extensions:#{ANSI[:RESET]} #{$console_extensions.join(' ')}#{ANSI[:RESET]}"
