require "tag/version"

  class Nutrition
	  attr_accessor :name_tag, :energetic_value, :q_fats, :q_fats_sat, :hc, :sugars, :protein, :salt
	  def initialize(name_tag, energetic_value, q_fats, q_fats_sat, hc, sugars, protein, salt)
		  @name_tag, @energetic_value, @q_fats, @q_fats_sat, @hc, @sugars, @protein, @salt = name_tag, energetic_value, q_fats, q_fats_sat, hc, sugars, protein, salt
	  end
	  
	  def to_s
	  	"#{@name_tag}, valor energético #{@energetic_value}cal, grasa #{@q_fats}g, grasas saturadas #{@q_fats_sat}g, carbohidratos #{@hc}g, azúcares #{@sugars}g, proteínas #{@protein}g, sal #{@salt}g"	
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

  class List
	Node = Struct.new(:value, :next, :prev)
  	attr_accessor :head, :tail
	def initialize(val)
		node = Node.new(val, nil, nil)
		@head, @tail = node, node
	end
	
	def to_s
		
	end

	def push_head(val)
 		node = Node.new(val, @head, nil)
                @head.prev = node
                @head = node		
	end
	
	def push_tail(val)
		node = Node.new(val, nil, @tail)
		@tail.next = node
		@tail = node
	end

  end

