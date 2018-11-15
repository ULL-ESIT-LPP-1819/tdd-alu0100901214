require './lib/tag'
RSpec.describe Tag do
  it "has a version number" do
  	expect(Tag::VERSION).not_to be nil
  end
  it "does something useful" do
  	expect(false).to eq(false)
  end
  @@tag1 = Nutrition.new("Pedro",98,2,1.5,4,4,16,460)
  it "name_tag se almacena correctamente conteniendo la palabra 'Pedro'" do
  	expect(@@tag1.name_tag).to eq("Pedro")
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

  it "salt se almacena correctamente conteniendo la variable '460' (mg)" do
	  expect(@@tag1.salt).to eq(460)
  end
  
  #@@list1 = List.new()
  #@@node1 = @@list1.Node.new(nil,nil,nil)
  @@node1 = Node.new
  
  it "Espero Un Struct de un nodo con los valores de 'value' 'next' y 'prev' como 'nil'" do
	  expect(@@node1.value).to eq(nil)
	  expect(@@node1.next).to eq(nil)
	  expect(@@node1.prev).to eq(nil)
  end

end

