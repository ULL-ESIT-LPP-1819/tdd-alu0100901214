require './lib/tag'
RSpec.describe Tag do
  it "has a version number" do
  	expect(Tag::VERSION).not_to be nil
  end
  it "does something useful" do
  	expect(false).to eq(false)
  end
  @@tag1 = Nutrition.new("Pedro")
  it "name_tag se almacena correctamente conteniendo la palabra 'Pedro'" do
  	expect(@@tag1.name_tag).to eq("Pedro")
  end

  it "energetic_value se almacena correctamente conteniendo la variable" do
	expect(@@tag1.energetic_value).to eq(98)
  end
end

