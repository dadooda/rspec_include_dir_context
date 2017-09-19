
describe "group1" do
  include_dir_context __dir__

  it_behaves_like "hierarchical"

  # NOTE: Order is internal to external.

  describe "#stuff" do
    it { expect(stuff).to eq "group1:stuff" }
  end

  describe "#demo_stuff" do
    it { expect(demo_stuff).to eq "demo_stuff" }
  end

  describe "#toplevel_stuff" do
    it { expect(toplevel_stuff).to eq "toplevel_stuff" }
  end
end
