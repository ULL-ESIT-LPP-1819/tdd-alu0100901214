require "tag/version"

#module Tag
  class Nutrition
	  attr_accessor :name_tag, :energetic_value, :q_fats, :q_fats_sat, :hc, :sugars, :protein
	  def initialize(name_tag, energetic_value, q_fats, q_fats_sat, hc, sugars, protein)
		  @name_tag, @energetic_value, @q_fats, @q_fats_sat, @hc, @sugars, @protein = name_tag, energetic_value, q_fats, q_fats_sat, hc, sugars, protein
	  end
  end

#end
