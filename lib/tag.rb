require "tag/version"

#module Tag
  class Nutrition
	  attr_accessor :name_tag, :energetic_value, :q_fats, :q_fats_sat, :hc, :sugars
	  def initialize(name_tag, energetic_value, q_fats, q_fats_sat, hc, sugars)
		  @name_tag, @energetic_value, @q_fats, @q_fats_sat, @hc, @sugars = name_tag, energetic_value, q_fats, q_fats_sat, hc, sugars
	  end
  end

#end
