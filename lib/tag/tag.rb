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
			(@peso/(@talla*@talla)).round(1)
		end
		
		def p_grasa
			(1.2*imc+0.23*@edad-10.8*@sexo-5.4).round(1)
		end
		
		def rcc
			(@circ_cint/@circ_cad).round(1)
		end
		
		def classify_imc
				if(imc < 18.5)
					"Bajo peso - Delgado"
				elsif((imc >= 18.5)&&(imc <= 24.9))
					"Adecuado - Aceptable"	
				elsif((imc >= 25.0)&&(imc <= 29.9))
					"Sobrepeso - Sobrepeso"
				elsif((imc >= 30.0)&&(imc <= 34.9))
					"Obesidad grado 1 - Obesidad"
				elsif((imc >= 35.0)&&(imc <= 39.9))
					"Obesidad grado 2 - Obesidad"
				elsif(imc >= 40.0)
					"Obesidad grado 3 - Obesidad"
				end
		end
		
		def classify_rcc
			if(@sexo == 0)
				if((rcc >= 0.72)&&(rcc <= 0.77))
					"Bajo"
				elsif((rcc >= 0.78)&&(rcc <= 0.82))
					"Moderado"
				elsif(rcc >= 0.82)
					"Alto"
				end
			elsif(@sexo == 1)
				if((rcc >= 0.83)&&(rcc <= 0.88))
					"Bajo"
				elsif((rcc >= 0.88)&&(rcc <= 0.95))
					"Moderado"
				elsif((rcc >= 0.95)&&(rcc <= 1.01))
					"Alto"
				elsif(rcc >= 0.82)
					"Muy alto"
				end
			end
		end
		
	end
	
	class Person < Antrop
		def initialize(peso, talla, edad, sexo, circ_cint, circ_cad, nombre, apellido1, apellido2)
			super(peso, talla, edad, sexo, circ_cint, circ_cad)
			@nombre, @apellido1, @apellido2 = nombre, apellido1, apellido2
		end
		
		def es_paciente
			if((peso == 0.0)&&(talla == 0.0)&&(edad==0.0)&&((sexo!=0)||(sexo!=1))&&(circ_cint==0.0)&&(circ_cad==0.0))
				false
			else
				true
			end
		end
	end