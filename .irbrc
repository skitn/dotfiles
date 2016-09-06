require 'rubygems'
require 'active_support/all'
require 'pp'
require 'irb/completion'
require 'wirble'

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 500

Wirble.init
Wirble.colorize
