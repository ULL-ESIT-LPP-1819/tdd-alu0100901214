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
end

RSpec.describe List do
  
end



