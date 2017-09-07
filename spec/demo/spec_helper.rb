
shared_context __dir__ do
  def demo_stuff
    "demo_stuff"
  end

  def stuff
    "demo:stuff"
  end

  shared_examples "hierarchical" do
    it "comes from `demo`" do
      expect(true).to be true
    end
  end
end
