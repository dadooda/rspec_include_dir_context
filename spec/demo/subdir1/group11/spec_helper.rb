
shared_context __dir__ do
  def stuff
    "group11:stuff"
  end

  shared_examples "hierarchical" do
    it "comes from `group11`" do
      expect(true).to be true
    end
  end
end
