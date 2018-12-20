require './lib/tag'
require 'benchmark'

RSpec.describe Tag do

  it "has a version number" do
  	expect(Tag::VERSION).not_to be nil
  end
  it "does something useful" do
  	expect(false).to eq(false)
  end
  @@tag1 = Nutrition.new("Taza",98,2,1.5,4,4,16,0.46)
  it "name_tag se almacena correctamente conteniendo la palabra 'Taza'" do
  	expect(@@tag1.name_tag).to eq("Taza")
  end

  it "energetic_value se almacena correctamente conteniendo la variable '98' (cal)" do
	expect(@@tag1.energetic_value).to eq(98)
  end

  it "q_fats se almacena correctamente conteniendo la variable '2' (g) " do
	  expect(@@tag1.q_fats).to eq(2)
  end

  it "q_fats_sat se almacena correctamente conteniendo la variable '1.5' (g)" do
	  expect(@@tag1.q_fats_sat).to eq(1.5)
  end

  it "hc se almacena correctamente conteniendo la variable '4'(g)" do
	  expect(@@tag1.hc).to eq(4)
  end

  it "sugars se almacena correctamente conteniendo la variable '4' (g)" do
	  expect(@@tag1.sugars).to eq(4)
  end

  it "protein se almacena correctamente conteniendo la variable '16' (g)" do
	  expect(@@tag1.protein).to eq(16)
  end

  it "salt se almacena correctamente conteniendo la variable '0.46' (g)" do
	  expect(@@tag1.salt).to eq(0.46)
  end
  
  it "Calculo de los kilojulios" do
	  expect(@@tag1.kj).to eq(425.5)
  end
  
  it "Calculo de las calorias" do
	  expect(@@tag1.cal).to eq(100.76)
  end

  it "Calculo de la Ingesta de Referencia (IR) de los kj en %" do
  	expect(@@tag1.kj_ir).to eq(5.06)
  end

  it "Calculo de la Ingesta de Referencia (IR) de las cal en %" do
	expect(@@tag1.cal_ir).to eq(5.03)
  end

  it "Comprobación del método to_s" do
	  expect(@@tag1.to_s).to eq("100.76")
  end
  
  it "Comprobación de que 2 etiquetas son comparables" do
  	tagA = Nutrition.new("Taza_A",98,2,1.5,4,4,16,0.46)
  	tagB = Nutrition.new("Taza_B",98,2,1.5,4,4,16,0.46)
  	expect(tagA==tagB).to eq(true)
  end
  
  it "Comparación de 2 etiquetas con todos los operadores" do
  	tagC = Nutrition.new("Taza_C",98,2,1.5,4,4,16,0.46)
  	tagD = Nutrition.new("Taza_D",88,2,1.1,3,3,14,0.46)
  	expect(tagC==tagD).to eq(false)
  	expect(tagC<tagD).to eq(false)
  	expect(tagC>tagD).to eq(true)
  	expect(tagC<=tagD).to eq(false)
  	expect(tagC>=tagD).to eq(true)
  end
  
end

RSpec.describe List do
	
	it "Comprobar que la lista este vacía" do
		lista = List.new
		expect(lista.is_empty).to eq(true)
		lista.push_head(2)
		expect(lista.is_empty).to eq(false)
	end
	
	it "Crear una lista"  do
		List.new
	end
	
	it "Inserta un nodo por la cabeza" do
		List.new.push_head(5)
	end
	
	it "Inserta un nodo por la cola" do
		List.new.push_tail(4)
	end
	
	
	it "Comprobación de la traza (to_s)" do
		@@list2 = List.new
		@@list2.push_head(7)
		@@list2.push_head(6)
		expect(@@list2.to_s).to eq("6 7")	
	end

	it "Elimina un nodo de la lista por la cabeza" do
		@@list2.pop_head
		expect(@@list2.to_s).to eq("7")
	end
	
	it "Elimina un nodo de la lista por la cola" do
		@@list2.push_head(8)
		@@list2.pop_tail
		expect(@@list2.to_s).to eq("8")
	end
	
	# Comprobación directa sin usar la metodología TDD
	it "Comprobación de que se pueden almacenar etiquetas" do
		list = (List.new)
		list.push_head(@@tag1)
		expect(list.head.value.to_s).to eq("100.76")
	end
	
	it "Compruebo de que la variable size funcione" do
		@@list = (List.new)
		@@list.push_tail(3)
		expect(@@list.size).to eq(1)
		@@list.push_tail(4)
		expect(@@list.size).to eq(2)
		@@list.pop_tail
		expect(@@list.size).to eq(1)
	end
	
	it "Comprobación de que las instancias sean enumerables con listas de etiquetas" do
		list = (List.new)
		tagA = Nutrition.new("Taza_A",98,2,1.5,4,4,16,0.46) 
  	tagB = Nutrition.new("Taza_B",88,2,1.1,3,3,14,0.45)
  	tagC = Nutrition.new("Taza_C",78,2,1.4,2,4,15,0.43)
  	tagD = Nutrition.new("Taza_D",85,2,1.1,3,3,14,0.41)
  	list.push_head(tagA)
  	list.push_head(tagB)
  	list.push_head(tagC)
  	list.push_head(tagD)
  	vec_aux = []
  	list.each { |item| vec_aux.push(item.to_s)}
  	expect("#{vec_aux}").to eq("[\"88.46\", \"88.58\", \"88.7\", \"100.76\"]")
  	
  	expect(list.max).to eq(tagA)
  	expect(list.min).to eq(tagD)
  	
  	expect(list.collect { |item| item }).to eq([tagD, tagC, tagB, tagA])
    
    expect(list.select{|item| "88.7" == item.to_s}).to eq([tagB])
    
    expect(list.sort).to eq([tagD, tagC, tagB, tagA])
  	
	end
	
	it "Comprobación de que las instancias sean enumerables con listas de Personas" do
		list_p = List.new
		personA = Person.new(95,1.88,20,0,89.8,102.1,"María","Rodriguez","García",0)
		personB = Person.new(65,1.72,22,1,80.8,80.1,"Pedro","Rodriguez","García",0)
		personC = Person.new(120,1.74,44,1,95.8,105.1,"Luis","Rodriguez","García",0)
		personD = Person.new(110,1.65,50,0,82.8,99.0,"Marta","Rodriguez","García",0)
		list_p.push_head(personA)
		list_p.push_head(personB)
		list_p.push_head(personC)
		list_p.push_head(personD)
		vec_aux_2 = []
		list_p.each { |item| vec_aux_2.push(item.to_s)}
		expect("#{vec_aux_2.to_s}").to eq("[\"40.4\", \"39.6\", \"22.0\", \"26.9\"]")
		
		expect(list_p.max).to eq(personD)
  	expect(list_p.min).to eq(personB)
  	
  	expect(list_p.collect { |item| item }).to eq([personD, personC, personB, personA])
    
    expect(list_p.select{|item| "22.0" == item.to_s}).to eq([personB])
    
    expect(list_p.sort).to eq([personB, personA, personC, personD])
    
	end
	
	
end

RSpec.describe Antrop do
	
	it "Crear un objeto de Antropometría" do
		expect((Antrop.new(66,1.74,20,0,89.8,102.1)).class).to eq(Antrop)
	end
	
	it "Prueba de que se calcula el imc correctamente" do
		antrop1 = Antrop.new(66,1.74,20,0,89.8,102.1)
		expect(antrop1.imc).to eq(21.8)
	end
	
	it "Prueba de que se calcula el porcentaje en grasa correctamente" do
		antrop2 = Antrop.new(66,1.74,20,0,89.8,102.1)
		expect(antrop2.p_grasa).to eq(25.4)
	end
	
	it "Prueba de que se calcula el rcc" do
		antrop3 = Antrop.new(66,1.74,20,0,89.8,102.1)
		expect(antrop3.rcc).to eq(0.9)
	end
	
	it "Clasificación del imc" do
		antrop4 = Antrop.new(66,1.74,20,0,89.8,102.1)
		expect(antrop4.classify_imc).to eq("Adecuado - Aceptable")
	end
	
	it "Clasificación del rcc" do
		antrop5 = Antrop.new(66,1.74,20,0,89.8,102.1)
		expect(antrop5.classify_rcc).to eq("Alto")
	end
	
	it "Crea un objeto Persona" do
		expect((Person.new(66,1.74,20,0,89.8,102.1,"María","Rodriguez","García",0)).class).to eq(Person)
	end
	
	it "Comprobación de si la Persona es paciente de la consulta" do 
		person1 = Person.new(66,1.74,20,0,89.8,102.1,"María","Rodriguez","García",0)
		expect(person1.es_paciente).to eq(true)
	end
	
	it "Comprobación de si la Persona esta en tratamiento para la obesidad" do
		@person2 = Person.new(120,1.74,20,0,89.8,102.1,"María","Rodriguez","García",0)
		expect(@person2.tratamiento_obesidad).to eq(true)
	end
	
	it "Comprobación de la jerarquía de clases" do
		#expect(Person.ancestors).to eq([Person, Antrop, Comparable, Object, Kernel, BasicObject])
	end
	
	it "Comprobación del tipo de objeto" do
		 @persona3 = Person.new(66,1.74,20,0,89.8,102.1,"María","Rodriguez","García",0)
		 expect((@persona3).is_a?(Antrop)).to eq(true)
     expect((@persona3).is_a?(Person)).to eq(true)
	end
	
	lista_personas = List.new
	lista_personas.push_head(Person.new(95,1.88,20,0,89.8,102.1,"María","Rodriguez","García",0))
	lista_personas.push_head(Person.new(65,1.72,22,1,80.8,80.1,"Pedro","Rodriguez","García",0))
	lista_personas.push_head(Person.new(120,1.74,44,1,95.8,105.1,"Luis","Rodriguez","García",0))
	lista_personas.push_head(Person.new(110,1.65,50,0,82.8,99.0,"Marta","Rodriguez","García",0))
	lista_personas.push_head(Person.new(90,1.85,28,0,89.8,93.2,"Laura","Rodriguez","García",0))
	
	
	it "Comprobamos el imc de María" do
		expect(lista_personas.head.value.classify_imc).to eq("Sobrepeso - Sobrepeso")
		lista_personas.pop_head
	end
	
	it "Comprobamos el imc de Pedro" do
		expect(lista_personas.head.value.classify_imc).to eq("Obesidad grado 3 - Obesidad")
		lista_personas.pop_head
	end
	
	it "Comprobamos el imc de Luis" do
		expect(lista_personas.head.value.classify_imc).to eq("Obesidad grado 2 - Obesidad")
		lista_personas.pop_head
	end
	
	it "Comprobamos el imc de Marta" do
		expect(lista_personas.head.value.classify_imc).to eq("Adecuado - Aceptable")
		lista_personas.pop_head
	end
	
	it "Comprobamos el imc de Laura" do
		expect(lista_personas.head.value.classify_imc).to eq("Sobrepeso - Sobrepeso")
	end
	
	it "Comprobación de que 2 Personas son comparables (usando todos los operadores)" do
		persona_A = Person.new(95,1.88,20,0,89.8,102.1,"María","Rodriguez","García",0) # 26'87 A
		persona_B = Person.new(65,1.72,22,1,80.8,80.1,"Pedro","Rodriguez","García",0) # 21'97 B
		expect(persona_A==persona_B).to eq(false)
		expect(persona_A<persona_B).to eq(false)
		expect(persona_A<=persona_B).to eq(false)
		expect(persona_A>persona_B).to eq(true)
		expect(persona_A>=persona_B).to eq(true)
	end
end	
	
RSpec.describe Person do
		
		before :all do
			@persona_A = Person.new(85,179,20,0,89.8,102.1,"María","Rodriguez","García",0)
			@persona_B = Person.new(75,172,17,1,80.8,80.3,"Pedro","Rodriguez","García",1)
			@persona_C = Person.new(65,182,44,0,80.5,80.1,"Carla","Delgado","García",2)
			@persona_D = Person.new(65,172,17,1,80.8,80.1,"Juan","Rodriguez","Sanchez",2)
			@persona_E = Person.new(55,152,12,1,80.8,80.1,"Jaime","Rodriguez","García",0)
			@sopa = Nutrition.new("Sopa",355,0.5,0.1,86,0,0.5,0.1)
			@barra_de_dulce = Nutrition.new("Barra de dulce",360,21,13,44,41,0.7,0)
			@manzana = Nutrition.new("Manzana",65,0,0,17,13,0,0)
			@vino = Nutrition.new("Vino",360,0,0,0.3,0.1,0.23,0)
			@loganiza_pollo = Nutrition.new("Loganiza de Pollo",277,23,6,2,0.1,15.6,2.4)
			@menu_1 = [@sopa,@sopa,@sopa,@loganiza_pollo,@loganiza_pollo,@loganiza_pollo,@manzana,@manzana,@manzana,@barra_de_dulce,@barra_de_dulce,@vino,@vino]
			@menu_2 = [@sopa,@sopa,@loganiza_pollo,@loganiza_pollo,@manzana,@manzana,@vino,@vino,@barra_de_dulce,@barra_de_dulce]
			@menu_3 = [@sopa,@sopa,@loganiza_pollo,@manzana,@barra_de_dulce,@barra_de_dulce,@vino]
			@menu_4 = [@sopa,@sopa,@loganiza_pollo,@loganiza_pollo,@manzana,@manzana,@manzana,@vino,@vino,@barra_de_dulce,@barra_de_dulce]
			@menu_5 = [@sopa,@sopa,@loganiza_pollo,@loganiza_pollo,@manzana,@manzana,@barra_de_dulce,@barra_de_dulce,@vino,@vino]
		end
		
		it "Comprobación del peso teórico ideal" do
			expect(@persona_A.peso_teorico_ideal).to eq(71.75)
		end
		
		it "Comprobacion del gasto energetico basal" do
			expect(@persona_A.gasto_energetico_basal).to eq(1707.75)
		end
		
		it "Comprobacion del efecto termogeneo" do
			expect(@persona_A.efecto_termogeneo).to eq(170.775)
		end
		
		it "Comprobacion del factor de actividad fisica" do
			expect(@persona_A.factor_de_actividad_fisica).to eq(0.0)
		end
		
		it "Comprobacion del gasto actividad fisica" do
			expect(@persona_A.gasto_actividad_fisica).to eq(0.00)
		end
		
		it "Comprobacion del gasto energetico total" do
			expect(@persona_A.gasto_energetico_total).to eq(1878.525)
		end
		
		it "Alimentación del menu 1 para la persona A" do
			gasto_en_total = (@persona_A.gasto_energetico_total).round(1)
			margen_de_error = (gasto_en_total*0.1).round(1)
			gasto_con_margen_error = gasto_en_total - margen_de_error
			cal_aux = @menu_1.collect{ |item| item.cal}
			cal_total = cal_aux.reduce(:+).round(1)
			expect(cal_total >= gasto_con_margen_error).to eq(true)
		end
		
		it "Alimentación del menu 2 para la persona B" do
			gasto_en_total = (@persona_B.gasto_energetico_total).round(1)
			margen_de_error = (gasto_en_total*0.1).round(1)
			gasto_con_margen_error = gasto_en_total - margen_de_error
			cal_aux = @menu_2.collect{ |item| item.cal}
			cal_total = cal_aux.reduce(:+).round(1)
			expect(cal_total >= gasto_con_margen_error).to eq(true)
		end
		
		it "Alimentación del menu 3 para la persona C" do
			gasto_en_total = (@persona_C.gasto_energetico_total).round(1)
			margen_de_error = (gasto_en_total*0.1).round(1)
			gasto_con_margen_error = gasto_en_total - margen_de_error
			cal_aux = @menu_3.collect{ |item| item.cal}
			cal_total = cal_aux.reduce(:+).round(1)
			expect(cal_total >= gasto_con_margen_error).to eq(true)
		end
		
		it "Alimentación del menu 4 para la persona D" do
			gasto_en_total = (@persona_D.gasto_energetico_total).round(1)
			margen_de_error = (gasto_en_total*0.1).round(1)
			gasto_con_margen_error = gasto_en_total - margen_de_error
			cal_aux = @menu_4.collect{ |item| item.cal}
			cal_total = cal_aux.reduce(:+).round(1)
			expect(cal_total >= gasto_con_margen_error).to eq(true)
		end
		
		it "Alimentación del menu 5 para la persona E" do
			gasto_en_total = (@persona_E.gasto_energetico_total).round(1)
			margen_de_error = (gasto_en_total*0.1).round(1)
			gasto_con_margen_error = gasto_en_total - margen_de_error
			cal_aux = @menu_5.collect{ |item| item.cal}
			cal_total = cal_aux.reduce(:+).round(1)
			expect(cal_total >= gasto_con_margen_error).to eq(true)
		end
		
end
	
	
RSpec.describe Array do
	
	
	before :all do
		
		@sopa = Nutrition.new("Sopa",355,0.5,0.1,86,0,0.5,0.1)
		@barra_de_dulce = Nutrition.new("Barra de dulce",360,21,13,44,41,0.7,0)
		@manzana = Nutrition.new("Manzana",65,0,0,17,13,0,0)
		@vino = Nutrition.new("Vino",360,0,0,0.3,0.1,0.23,0)
		@loganiza_pollo = Nutrition.new("Loganiza de Pollo",277,23,6,2,0.1,15.6,2.4)
		@persona_A = Person.new(85,179,20,0,89.8,102.1,"María","Rodriguez","García",0)
		@persona_B = Person.new(75,172,17,1,80.8,80.3,"Pedro","Rodriguez","García",1)
		@persona_C = Person.new(65,182,44,0,80.5,80.1,"Carla","Delgado","García",2)
		@persona_D = Person.new(65,172,17,1,80.8,80.1,"Juan","Rodriguez","Sanchez",2)
		@persona_E = Person.new(55,152,12,1,80.8,80.1,"Jaime","Rodriguez","García",0)
		@persona_F = Person.new(85,179,20,0,89.8,102.1,"María","Rodriguez","García",1)
		@persona_G = Person.new(75,172,17,1,80.8,80.3,"Pedro","Rodriguez","García",1)
		@persona_H = Person.new(65,182,44,0,80.5,80.1,"Carla","Delgado","García",0)
		@persona_I = Person.new(65,172,17,1,80.8,80.1,"Juan","Rodriguez","Sanchez",1)
		@persona_J = Person.new(55,152,12,1,80.8,80.1,"Jaime","Rodriguez","García",0)
		@m1 = [@sopa,@sopa,@sopa,@loganiza_pollo,@loganiza_pollo,@loganiza_pollo,@manzana,@manzana,@manzana,@barra_de_dulce,@barra_de_dulce,@vino,@vino]
		@m2 = [@sopa,@sopa,@loganiza_pollo,@loganiza_pollo,@manzana,@manzana,@vino,@vino,@barra_de_dulce,@barra_de_dulce]
		@m3 = [@sopa,@sopa,@loganiza_pollo,@manzana,@barra_de_dulce,@barra_de_dulce,@vino]
		@m4 = [@sopa,@sopa,@loganiza_pollo,@loganiza_pollo,@manzana,@manzana,@manzana,@vino,@vino,@barra_de_dulce,@barra_de_dulce]
		@m5 = [@sopa,@sopa,@loganiza_pollo,@loganiza_pollo,@manzana,@manzana,@barra_de_dulce,@barra_de_dulce,@vino,@vino]
		@m6 = [@sopa,@sopa,@sopa,@sopa,@loganiza_pollo,@loganiza_pollo,@loganiza_pollo,@manzana,@manzana,@manzana,@barra_de_dulce,@barra_de_dulce,@vino,@vino]
		@m7 = [@sopa,@sopa,@sopa,@sopa,@sopa,@loganiza_pollo,@loganiza_pollo,@manzana,@manzana,@vino,@vino,@barra_de_dulce,@barra_de_dulce]
		@m8 = [@sopa,@sopa,@loganiza_pollo,@loganiza_pollo,@manzana,@barra_de_dulce,@barra_de_dulce,@vino]
		@m9 = [@sopa,@sopa,@loganiza_pollo,@loganiza_pollo,@loganiza_pollo,@manzana,@manzana,@manzana,@vino,@vino,@barra_de_dulce,@barra_de_dulce]
		@m10 = [@sopa,@sopa,@loganiza_pollo,@loganiza_pollo,@loganiza_pollo,@manzana,@manzana,@barra_de_dulce,@barra_de_dulce,@vino,@vino]
		
		
		@array_de_menus = [@m1,@m2,@m3,@m4,@m5,@m6,@m7,@m8,@m9,@m10]
		@list_person = List.new
		@list_person.push_head(@persona_J)
		@list_person.push_head(@persona_I)
		@list_person.push_head(@persona_H)
		@list_person.push_head(@persona_G)
		@list_person.push_head(@persona_F)
		@list_person.push_head(@persona_E)
		@list_person.push_head(@persona_D)
		@list_person.push_head(@persona_C)
		@list_person.push_head(@persona_B)
		@list_person.push_head(@persona_A)
	end
	
	Benchmark.bm do |item|
	
		it "Array con elementos ordenados usando for" do
			copy = @array_de_menus.dup
			@array_ordenado = []
			a=0
			item.report("for array:"){
				for i in 0..@array_de_menus.size-1
					for j in 0..copy.size-1
						cal_aux_j = copy[j].collect{ |item| item.cal}
						cal_total_j = cal_aux_j.reduce(:+).round(1)
						cal_aux_a = copy[a].collect{ |item| item.cal}
						cal_total_a = cal_aux_a.reduce(:+).round(1)
						if cal_total_j < cal_total_a
							a=j
						end
					end
					@array_ordenado.push(copy[a])
					copy.delete_at(a)
					a=0
				end
			}
			
			expect(@array_ordenado).to eq([@m3,@m8,@m2,@m5,@m4,@m10,@m9,@m1,@m7,@m6])
			#[3223.6,3214.9,2872.5,2521.4,2453.4,2229.6,2161.6,2161.6,2091.5,1799.7] (al revés)
			
		end
		
		it "Lista con elementos ordenados usando for" do
			
			expect(@list_person.for_ord).to eq([1547.2,1589.5,1589.5,1878.5,1926.9,2006.9,2083.5,2128.9,2128.9,2253.7])
			item.report("for lista:"){ 1000.times do @list_person.for_ord; end}
			
		end
		
		#it "Array de elementos ordenados usando each" do
		#	expect(@array_ordenado).to eq([@m3,@m8,@m2,@m5,@m4,@m10,@m9,@m1,@m7,@m6])
		#end
		
		it "Lista de elementos usando each" do
			expect(@list_person.each_ord).to eq([1547.2,1589.5,1589.5,1878.5,1926.9,2006.9,2083.5,2128.9,2128.9,2253.7])
			item.report("each lista:"){ 1000.times do @list_person.each_ord; end}
		end
		
		#it "Array de elementos usando sort" do 
			#expect(@array_ordenado).to eq([@m3,@m8,@m2,@m5,@m4,@m10,@m9,@m1,@m7,@m6])
		#end
		
		it "Lista de elementos usando sort" do 
			expect(@list_person.collect{|item| item.gasto_energetico_total.round(1)}.sort).to eq([1547.2,1589.5,1589.5,1878.5,1926.9,2006.9,2083.5,2128.9,2128.9,2253.7])
			item.report("sort lista:"){ 1000.times do @list_person.collect{|item| item.gasto_energetico_total.round(1)}.sort; end}
		end
		
	end
	
	
end

