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
	  expect(@@tag1.to_s).to eq("Taza, valor energético 98cal, grasa 2g, grasas saturadas 1.5g, carbohidratos 4g, azúcares 4g, proteínas 16g, sal 0.46g")
  end
end

RSpec.describe List do
	
	it "Crear una lista"  do
		List.new(4)
	end
	
	it "Inserta un nodo por la cabeza" do
		List.new(4).push_head(5)
	end
	
	it "Inserta un nodo por la cola" do
		List.new(5).push_tail(4)
	end
	
	
	it "Comprobación de la traza (to_s)" do
		@@list2 = List.new(8)
		@@list2.push_head(7)
		expect(@@list2.to_s).to eq("7 8")	
	end

	it "Elimina un nodo de la lista por la cabeza" do
		@@list2.pop_head
		expect(@@list2.to_s).to eq("8")
	end
	
	it "Elimina un nodo de la lista por la cola" do
		@@list2.push_tail(7)
		@@list2.pop_tail
		expect(@@list2.to_s).to eq("8")
	end
	
	# Comprobación directa sin usar la metodología TDD
	it "Comprobación de que se pueden almacenar etiquetas" do
		list = (List.new(@@tag1))
		expect(list.head.value.to_s).to eq("Taza, valor energético 98cal, grasa 2g, grasas saturadas 1.5g, carbohidratos 4g, azúcares 4g, proteínas 16g, sal 0.46g")
	end
	
	it "Compruebo de que la variable size funcione" do
		list = (List.new(2))
		list.push_tail(3)
		expect(list.size).to eq(2)
		list.push_tail(4)
		expect(list.size).to eq(3)
		list.pop_tail
		expect(list.size).to eq(2)
	end

	#it "Comprobación de una lista con 5 etiquetas diferentes" do
	#	@@tag2 = Nutrition.new("Leche",264,3.6,2.5,4.7,4.7,3,0.13)
	#	@@tag3 = Nutrition.new("Galletas",265,3.1,2.4,7,7,2,0.16)
	#	@@tag4 = Nutrition.new("Loganiza_pollo",277,23,6,2,0.1,15.6,6.1)
	#	@@tag5 = Nutrition.new("Queso",280,4.6,2.3,4,4,3,0.67)
	#	list2 = (List.new(@@tag1))
	#	list2.push_head(@@tag2)
	#	list2.push_head(@@tag3)
	#	list2.push_head(@@tag4)
	#	list2.push_head(@@tag5)
	#	expect(list2.to_s).to eq("")
	#end
end



