require "tag/version"

#module Tag
  class Nutrition
	  attr_accessor :name_tag, :energetic_value, :q_fats
	  def initialize(name_tag, energetic_value,q_fats)
		  @name_tag, @energetic_value, @q_fats = name_tag, energetic_value, q_fats
	  end
  end

#end
