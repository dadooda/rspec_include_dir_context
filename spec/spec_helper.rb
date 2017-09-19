
# Require all `spec_helper.rb` throughout the tree for shared contexts.
Dir[File.join(__dir__, "**/spec_helper.rb")].each { |fn| require fn }

RSpec.configure do |config|
  config.extend Module.new {
    # Include hierarchical contexts from <tt>spec/</tt> up to spec root.
    #
    #   describe Something do
    #     include_dir_context __dir__
    #     ...
    def include_dir_context(dir)
      spec_root = __dir__
      #spec_root = File.expand_path("..", __dir__)    # Uncomment if you move this to a subpath, say, `spec/support/include_dir_context.rb`.
      d, steps = dir, []
      while d.size >= spec_root.size
        steps << d
        d = File.split(d).first
      end

      steps.reverse.each do |d|
        begin; include_context d; rescue ArgumentError; end
      end

      # Include top-level contexts per sub-environment.
      #
      # In Rails projects we've got 2 sub-environments: plain and Rails, which share the same
      # directory root. If we create 2 regular `__dir__` contexts at root, RSpec will overwrite one
      # with another. Hence we use distinct special names for root contexts and load them by hand.
      begin; include_context "spec_toplevel"; rescue ArgumentError; end
      begin; include_context "rails_toplevel"; rescue ArgumentError; end
    end
  } # config.extend
end

# Top-level (spec root) shared context.
shared_context "spec_toplevel" do
  def toplevel_stuff
    "toplevel_stuff"
  end
end
