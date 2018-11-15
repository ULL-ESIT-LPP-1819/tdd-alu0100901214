require "tag/version"

  class Nutrition
	  attr_accessor :name_tag, :energetic_value, :q_fats, :q_fats_sat, :hc, :sugars, :protein, :salt
	  def initialize(name_tag, energetic_value, q_fats, q_fats_sat, hc, sugars, protein, salt)
		  @name_tag, @energetic_value, @q_fats, @q_fats_sat, @hc, @sugars, @protein, @salt = name_tag, energetic_value, q_fats, q_fats_sat, hc, sugars, protein, salt
	  end

	  def kj
	  	(q_fats*37)+(hc*17)+(protein*17)+(salt*25)
	  end
	  
	  def cal
		(q_fats*9)+(hc*4)+(protein*4)+(salt*6)	
	  end

	  def kj_ir
		((kj/8400)*100*100).floor / 100.0	
	  end

	  def cal_ir
 		((cal/2000)*100*100).floor / 100.0	  
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

