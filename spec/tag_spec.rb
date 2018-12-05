require './lib/tag'

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
	  #expect(@@tag1.to_s).to eq("Taza, valor energético 98cal, grasa 2g, grasas saturadas 1.5g, carbohidratos 4g, azúcares 4g, proteínas 16g, sal 0.46g")
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
		#expect(list.head.value.to_s).to eq("Taza, valor energético 98cal, grasa 2g, grasas saturadas 1.5g, carbohidratos 4g, azúcares 4g, proteínas 16g, sal 0.46g")
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
  	puts tagA.cal #100.76
  	puts tagB.cal #88.7
  	puts tagC.cal #88.58
  	puts tagD.cal #88.46
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
		expect((Person.new(66,1.74,20,0,89.8,102.1,"María","Rodriguez","García")).class).to eq(Person)
	end
	
	it "Comprobación de si la Persona es paciente de la consulta" do 
		person1 = Person.new(66,1.74,20,0,89.8,102.1,"María","Rodriguez","García")
		expect(person1.es_paciente).to eq(true)
	end
	
	it "Comprobación de si la Persona esta en tratamiento para la obesidad" do
		@person2 = Person.new(120,1.74,20,0,89.8,102.1,"María","Rodriguez","García")
		expect(@person2.tratamiento_obesidad).to eq(true)
	end
	
	it "Comprobación de la jerarquía de clases" do
		#expect(Person.ancestors).to eq([Person, Antrop, Comparable, Object, Kernel, BasicObject])
	end
	
	it "Comprobación del tipo de objeto" do
		 @persona3 = Person.new(66,1.74,20,0,89.8,102.1,"María","Rodriguez","García")
		 expect((@persona3).is_a?(Antrop)).to eq(true)
     expect((@persona3).is_a?(Person)).to eq(true)
	end
	
	lista_personas = List.new
	lista_personas.push_head(Person.new(95,1.88,20,0,89.8,102.1,"María","Rodriguez","García"))
	lista_personas.push_head(Person.new(65,1.72,22,1,80.8,80.1,"Pedro","Rodriguez","García"))
	lista_personas.push_head(Person.new(120,1.74,44,1,95.8,105.1,"Luis","Rodriguez","García"))
	lista_personas.push_head(Person.new(110,1.65,50,0,82.8,99.0,"Marta","Rodriguez","García"))
	lista_personas.push_head(Person.new(90,1.85,28,0,89.8,93.2,"Laura","Rodriguez","García"))
	
	
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
		persona_A = Person.new(95,1.88,20,0,89.8,102.1,"María","Rodriguez","García") # 26'87 A
		persona_B = Person.new(65,1.72,22,1,80.8,80.1,"Pedro","Rodriguez","García") # 21'97 B
		expect(persona_A==persona_B).to eq(false)
		expect(persona_A<persona_B).to eq(false)
		expect(persona_A<=persona_B).to eq(false)
		expect(persona_A>persona_B).to eq(true)
		expect(persona_A>=persona_B).to eq(true)
	end
	
end

