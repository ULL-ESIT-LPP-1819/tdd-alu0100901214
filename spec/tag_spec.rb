
RSpec.describe Tag do
  it "has a version number" do
    expect(Tag::VERSION).not_to be nil
  end
  it "does something useful" do
    expect(false).to eq(false)
  end
  it "name_tag = 'Pedro'" do
    expect(Tag.name_tag).to eq("Pedro")
  end
end

