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
			string = string + "#{node.value} "
			if(size_aux < @size)
				node=node.next
				size_aux = size_aux + 1
			end
		end
		string[0,string.size-1]
	end

	def push_head(val)
		puts val
		if(@size == 0)
			puts "size == 0"
			node = Node.new(val,nil,nil)
			@head = node
			@tail = node
		elsif
			puts "size != 0 #{size}"
 			node = Node.new(val, @head, nil)
                	@head.prev = node
                	@head = node
			@size = @size + 1
		end		
	end
	
	def push_tail(val)
		if(@size == 0)
			puts "size == 0"
			node = Node.new(val,nil,nil)
			@head = node
			@tail = node
		elsif
			puts "size != 0 #{size}"
			node = Node.new(val, nil, @tail)
			@tail.next = node
			@tail = node
			@size = @size + 1
		end
	end
	
	def pop_head()
		if(@size > 0) 
			puts "size > 0 #{size}"
			node = @head
			@head = node.next
			@head.prev = nil
			@size = @size - 1
		end
	end
	
	def pop_tail()
		if(@size > 0) 
			puts "size > 0 #{size}"
			node = @tail
			@tail = node.prev
			@tail.next = nil
			@size = @size - 1
		end
	end
  end

