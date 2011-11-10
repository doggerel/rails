# Include hook code here
require 'luckynumbers'
ActiveRecord::Base.extend Luckynumbers::ActsMacro
