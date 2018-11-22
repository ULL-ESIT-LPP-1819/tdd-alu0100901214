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
  	attr_accessor :head, :tail, :size
	def initialize
		@head, @tail, @size = nil, nil, 0
	end
	
	def to_s
		node = @head
        size_aux = 0
		string = ""
		while(size_aux < @size) do
			if(size_aux < @size)
				string = string + "#{node.value} "
				node=node.next
				size_aux = size_aux + 1
			end
		end
		string[0,string.size-1]
	end
	
	def is_empty
		if(@size != 0)
			return false
		end
		true
	end
	
	def push_head(val)
		if(@size == 0)
			node = Node.new(val,nil,nil)
			@head = node
			@tail = node
		end
		if(@size != 0)
 			node = Node.new(val, @head, nil)
            @head.prev = node
            @head = node
		end	
		@size = @size + 1
	end
	
	def push_tail(val)
		if(@size == 0)
			node = Node.new(val,nil,nil)
			@head = node
			@tail = node
		end
		if(@size != 0)
			node = Node.new(val, nil, @tail)
			@tail.next = node
			@tail = node
		end
		@size = @size + 1
	end
	
	def pop_head()
		if(@size > 0) 
			node = @head
			@head = node.next
			@head.prev = nil
			@size = @size - 1
		end
	end
	
	def pop_tail()
		if(@size > 0) 
			node = @tail
			@tail = node.prev
			@tail.next = nil
			@size = @size - 1
		end
	end
  end



	class Antrop
		attr_accessor :peso, :talla, :edad, :sexo, :circ_cint, :circ_cad
		def initialize (peso, talla, edad, sexo, circ_cint, circ_cad)
        	@peso, @talla, @edad, @sexo, @circ_cint, @circ_cad = peso, talla, edad, sexo, circ_cint, circ_cad
        end
		
		def imc
			
		end
	end