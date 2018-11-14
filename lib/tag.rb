require "tag/version"

#module Tag
  class Nutrition
	  attr_accessor :name_tag, :energetic_value
	  def initialize(name_tag, energetic_value)
		  @name_tag, @energetic_value = name_tag, energetic_value
	  end
  end

#end
