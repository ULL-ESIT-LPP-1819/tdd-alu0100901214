require "tag/version"

  class Nutrition
	  attr_accessor :name_tag, :energetic_value, :q_fats, :q_fats_sat, :hc, :sugars, :protein, :salt
	  def initialize(name_tag, energetic_value, q_fats, q_fats_sat, hc, sugars, protein, salt)
		  @name_tag, @energetic_value, @q_fats, @q_fats_sat, @hc, @sugars, @protein, @salt = name_tag, energetic_value, q_fats, q_fats_sat, hc, sugars, protein, salt
	  end
  end  
  
  Node = Struct.new(:value, :next, :prev)

  class List
  	def initialize
		@head, @tail = Node.new, Node.new
		@size = 0
	end	
	
	def push_head(nodo)
		#nodo.next = @head
		#@size = @size + 1
	end
  end

