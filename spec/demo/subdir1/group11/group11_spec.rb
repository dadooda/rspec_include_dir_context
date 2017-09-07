
describe "group11" do
  include_dir_context __dir__

  it_behaves_like "hierarchical"

  describe "#stuff" do
    it { expect(stuff).to eq "group11:stuff" }
  end

  describe "#demo_stuff" do
    it { expect(demo_stuff).to eq "demo_stuff" }
  end
end
