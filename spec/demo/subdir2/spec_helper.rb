
shared_context __dir__ do
  def stuff
    "subdir1:stuff"
  end

  def subdir1_stuff
    "subdir1_stuff"
  end

  shared_examples "hierarchical" do
    it "comes from `subdir1`" do
      expect(true).to be true
    end
  end
end
