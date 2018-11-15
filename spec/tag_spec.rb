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
end



