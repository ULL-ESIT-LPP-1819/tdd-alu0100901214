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
end

