# both irb and rails console will load this file; create it at
# ~/.irbrc
# rails console will require the gems listed in the
# Gemfile (next file, below) in order to function
 
require 'rubygems'
require 'hirb'
require 'brice'
require 'pp'
 
IRB.conf[:BACK_TRACE_LIMIT] = 0
IRB.conf[:PROMPT_MODE] = :SIMPLE
 
Brice.init
 
Hirb.enable
