require "tag/version"

  # @author Sergio González Guerra
  class Nutrition
  	
  	  include Comparable
  	  include Enumerable
  	  
	  attr_accessor :name_tag, :energetic_value, :q_fats, :q_fats_sat, :hc, :sugars, :protein, :salt
	  # Clase que define una etiqueta de nutrición de un producto
	  # @param name_tag [String] nombre de la etiqueta del producto
	  # @param energetic_value [Int] Valor energético (cal)
	  # @param q_fats [Float] Grasa (gr)
	  # @param q_fats_sat [Float] Grasa saturada (gr)
	  # @param hc [Float] Hidratos de carbono (gr)
	  # @param sugars [Float] Azúcares (gr)
	  # @param protein [Float] Proteínas (gr)
	  # @param salt [Float] Sal (gr)
	  def initialize(name_tag, energetic_value, q_fats, q_fats_sat, hc, sugars, protein, salt)
		  @name_tag, @energetic_value, @q_fats, @q_fats_sat, @hc, @sugars, @protein, @salt = name_tag, energetic_value, q_fats, q_fats_sat, hc, sugars, protein, salt
	  end
	  
	  # Método to_s que devuelve las calorias de la etiqueta de un producto
	  # @return [String] Valor energético en Calorías
	  def to_s
	  	"#{cal}"
	  end
	  
	  # Método kj que calcula el valor energético de un producto en Kilojulios
	  # @return [Float] Devuelve el calculo del valor energético (kj)
	  def kj
	  	(q_fats*37)+(hc*17)+(protein*17)+(salt*25)
	  end
	  # Método cal que calcula el valor energético de un producto en Calorías
	  # @return [Float] Devuelve el calculo del valor energético en (cal)
	  def cal
		(q_fats*9)+(hc*4)+(protein*4)+(salt*6)	
	  end
	  # Método kj_ir que calcula el porcentaje de la Ingesta de Referencia en Kilojulios
	  # @return [Float] Devuelve el calculo del IR (kj)
	  def kj_ir
		((kj/8400)*100*100).floor / 100.0	
	  end
	  # Método cal_ir que calcula el porcentaje de la Ingesta de Referencia en Calorías
	  # @return [Float] Devuelve el calculo del IR (cal)
	  def cal_ir
 		((cal/2000)*100*100).floor / 100.0	  
	  end
	  
	  # Hace las comparaciones de etiquetas mirando el valor energético en Calorías
	  # @return [Int] '-1' '0' o '1'
	  def <=>(other)
	  	return nil unless other.instance_of? Nutrition
	  	cal <=> other.cal
	  end
	  
  end  
  
  # @author Sergio González Guerra
  class List
  	
  	include Enumerable
  	
	Node = Struct.new(:value, :next, :prev)
  	attr_accessor :head, :tail, :size
  	
  	# Clase que define una Lista
	# @param head [Node] Cabeza de la lista
	# @param tail [Node] Cola de la lista
	# @param size [Int] Tamaño de la lista
	def initialize
		@head, @tail, @size = nil, nil, 0
	end
	
	# Método to_s de la lista
	# @return [String] Devuelve un string con la lista
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
	
	# Método is_empty que comprueba si esta vacia o no
	# @return [Bool] true false
	def is_empty
		if(@size != 0)
			return false
		end
		true
	end
	
	# Método push_head de la lista que inserta un elemento por la cabeza
	# @param val [Object] Valor/Elemento a insertar en la cabeza
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
	
	# Método push_tail de la lista que inserta un elemento por la cola
	# @param val [Object] Valor/Elemento a insertar en la cola
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
	
	# Método pop_head de lista que elimina un elemento por la cabeza
	def pop_head()
		if(@size > 0) 
			node = @head
			@head = node.next
			@head.prev = nil
			@size = @size - 1
		end
	end
	
	# Método pop_tail de lista que elimina un elemento por la cola
	def pop_tail()
		if(@size > 0) 
			node = @tail
			@tail = node.prev
			@tail.next = nil
			@size = @size - 1
		end
	end
	
	# Método each para usar los métodos del módulo Enumerable
	def each
		node = @head
		while node != nil
			yield node.value
			node = node.next
		end
	end
  end


	# @author Sergio González Guerra
	class Antrop
		
		include Comparable
		include Enumerable
		
		attr_accessor :peso, :talla, :edad, :sexo, :circ_cint, :circ_cad
		
		# Clase que define la Antropometría
		# @param peso [Float] Indica el peso (kg)
		# @param talla [Float] Indica la talla (m)
		# @param edad [Int] Indica la edad (años)
		# @param sexo [Int] Indica el sexo (0 mujer ; 1 hombre)
		# @param circ_cint [Float] Indica la circunferencia de la cintura (cm)
		# @param circ_cad [Float] Indica la circunferencia de la cadera (cm)
		def initialize (peso, talla, edad, sexo, circ_cint, circ_cad)
        	@peso, @talla, @edad, @sexo, @circ_cint, @circ_cad = peso, talla, edad, sexo, circ_cint, circ_cad
        end
		
		# Método imc que calcula el imc
		# @return [Float] devuelve el valor del cálculo del imc
		def imc
			(@peso/(@talla*@talla)).round(1)
		end
		
		# Método p_grasa que calcula el porcentaje en grasa
		# @return [Float] devuelve el valor del cálculo del porcentaje en grasa
		def p_grasa
			(1.2*imc + 0.23*@edad - 10.8*@sexo - 5.4).round(1)
		end
		
		# Método rcc que calcula la relación de la cintura/cadera
		# @return [Float] devuelve el valor del cálculo de la relación de la cintura/cadera
		def rcc
			(@circ_cint/@circ_cad).round(1)
		end
		
		# Método classify_imc que comprueba la clasificación de la OMS/Descripción popular
		# @return [String] Clasificación OMS - Descripción popular
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
		
		# Método classify_rcc que comprueba la relación cintura/cadera de hombres y mujeres
		# @return [String] Relación cintura/cadera de hombres y mujeres
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
		
		# Método to_s de la Antropometría
    	# @return [String] imc
		def to_s
			"#{imc}"
		end
		
		# Método que compara según el imc
    	# @return [Int] '-1' '0' o '1'
		def <=>(other)
			return nil unless other.instance_of? Antrop
			self.imc <=> other.imc
		end
		
	end
	
	class Person < Antrop
		# Clase que define a una persona
		# @param peso [Float] Indica el peso (kg)
		# @param talla [Float] Indica la talla (m)
		# @param edad [Int] Indica la edad (años)
		# @param sexo [Int] Indica el sexo (0 mujer ; 1 hombre)
		# @param circ_cint [Float] Indica la circunferencia de la cintura (cm)
		# @param circ_cad [Float] Indica la circunferencia de la cadera (cm)
		# @param nombre [String] Indica el nombre de la persona
		# @param apellido1 [String] Indica el primer apellido de la persona
		# @param apellido2 [String] Indica el segundo apellido de la persona
		def initialize(peso, talla, edad, sexo, circ_cint, circ_cad, nombre, apellido1, apellido2, actividad_fisica)
			super(peso, talla, edad, sexo, circ_cint, circ_cad)
			@nombre, @apellido1, @apellido2, @actividad_fisica = nombre, apellido1, apellido2, actividad_fisica
		end
		
		#Método es_paciente indica si es paciente o no
		# @return [Bool] true false
		def es_paciente
			if((peso == 0.0)&&(talla == 0.0)&&(edad==0.0)&&((sexo!=0)||(sexo!=1))&&(circ_cint==0.0)&&(circ_cad==0.0))
				false
			else
				true
			end
		end
		
		#Método es_paciente indica si esta en tratamiento para la obesidad o no
		# @return [Bool] true false
		def tratamiento_obesidad
			if(es_paciente)
				if((classify_imc == "Obesidad grado 1 - Obesidad")||(classify_imc == "Obesidad grado 2 - Obesidad")||(classify_imc == "Obesidad grado 3 - Obesidad"))
					true
				else
					false
				end
			elsif
				false  
			end
		end
		
		def peso_teorico_ideal
			(talla - 150)*0.75 + 50
		end
		
		def gasto_energetico_basal
			if (sexo == 0)
				(10*peso) + (6.25*talla) - (5*edad) -161
			elsif(sexo == 1)
				(10*peso) + (6.25*talla) - (5*edad) +5
			end
		end
		
		def efecto_termogeneo
			gasto_energetico_basal*0.10
		end
		
		def factor_de_actividad_fisica
			if(@actividad_fisica==0)
				0.0
			elsif(@actividad_fisica==1)
				0.12
			elsif(@actividad_fisica==2)
				0.27
			elsif(@actividad_fisica==3)
				0.54
			end
		end
		
		def gasto_actividad_fisica
			gasto_energetico_basal*factor_de_actividad_fisica
		end
		
		def gasto_energetico_total
		end
		
		# Método to_s de la Persona
    	# @return [String] imc
		def to_s
			"#{imc}"
		end
		
		# Método que compara según el imc
    	# @return [Int] '-1' '0' o '1'
		def <=>(other)
			return nil unless other.instance_of? Person
			imc <=> other.imc
		end
	end
	
