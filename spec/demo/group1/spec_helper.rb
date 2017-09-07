
shared_context __dir__ do
  def stuff
    "group1:stuff"
  end

  shared_examples "hierarchical" do
    it "comes from `group1`" do
      expect(true).to be true
    end
  end
end
