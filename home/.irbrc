require "rubygems"
require "irb/ext/save-history"
require "ap"

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

IRB::Irb.class_eval do
  def output_value
    ap @context.last_value
  end
end
