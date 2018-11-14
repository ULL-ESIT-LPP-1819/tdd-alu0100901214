require "tag/version"

#module Tag
  class Nutrition
	  attr_accessor :name_tag, :energetic_value, :q_fats, :q_fats_sat
	  def initialize(name_tag, energetic_value, q_fats, q_fats_sat)
		  @name_tag, @energetic_value, @q_fats, @q_fats_sat = name_tag, energetic_value, q_fats, q_fats_sat
	  end
  end

#end
