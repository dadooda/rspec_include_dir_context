
# Require all `spec_helper.rb` throughout the tree for shared contexts.
Dir[File.join(__dir__, "**/spec_helper.rb")].each { |fn| require fn }

RSpec.configure do |conf|
  conf.extend Module.new {
    # Include hierarchical contexts from <tt>spec/</tt> up to <tt>__dir__</tt>.
    #
    #   describe Something do
    #     include_dir_context __dir__
    #     ...
    def include_dir_context(dir)
      d, steps = dir, []
      while d.size >= __dir__.size
        steps << d
        d = File.join(File.split(d)[0..-2])
      end

      steps.reverse.each do |d|
        begin; include_context d; rescue ArgumentError; end
      end
    end
  } # conf.extend
end
