
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
        d = File.join(File.split(d)[0..-2])
      end

      steps.reverse.each do |d|
        begin; include_context d; rescue ArgumentError; end
      end
    end
  } # config.extend
end

# Top-level (spec root) shared context.
shared_context __dir__ do
  def root_stuff
    "root_stuff"
  end
end
