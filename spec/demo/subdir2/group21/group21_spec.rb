
describe "group21" do
  include_dir_context __dir__

  it_behaves_like "hierarchical"

  describe "#stuff" do
    it { expect(stuff).to eq "subdir1:stuff" }
  end

  describe "#subdir1_stuff" do
    it { expect(subdir1_stuff).to eq "subdir1_stuff" }
  end

  describe "#demo_stuff" do
    it { expect(demo_stuff).to eq "demo_stuff" }
  end
end
