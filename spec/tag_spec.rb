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
		expect(list.head.value.to_s).to eq("Taza, valor energético 98cal, grasa 2g, grasas saturadas 1.5g, carbohidratos 4g, azúcares 4g, proteínas 16g, sal 0.46g")
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
end

