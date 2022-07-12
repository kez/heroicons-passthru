# frozen_string_literal: true

module HeroiconsPassthru
  # Icon to show heroicons by name and variant.
  class Icon
    attr_accessor :dir
    attr_reader :icon, :variant, :options

    def initialize(icon:, variant:  HeroiconsPassthru.configuration.variant, options: {})
      @icon = icon.to_s
      @variant = safe_variant(variant)
      @dir = HeroiconsPassthru.configuration.dir
      @options = options
    end

    def render
      doc = Nokogiri::HTML::DocumentFragment.parse(read_file(@dir, @icon, @variant.to_s))
      svg = doc.at_css "svg"
   
      prepend_default_class_name
   
      @options.each do |key, value|
        svg[key.to_s] = value
      end

      svg
    end

    private


    def file_path
      File.join(@dir, @variant.to_s, "#{@icon}.svg")
    end

    def file
      @file ||= File.read(file_path).force_encoding("UTF-8")
    rescue
      nil
    end

    def read_file(dir, icon, variant)
      Nokogiri::HTML::DocumentFragment.parse(file)
    end

   def prepend_default_class_name
    default_class_config = HeroiconsPassthru.configuration.default_class

    default_class = if default_class_config.is_a?(String)
      default_class_config
    elsif default_class_config.is_a?(Hash)
      default_class_config[variant]
    end

    @options[:class] = "#{default_class} #{@options[:class]}".strip if default_class
  end


    def safe_variant(provided_variant)
      if %i[solid outline].include?(provided_variant.to_sym)
        provided_variant
      else
        :solid
      end
    end

      class << self
      def render(**kwargs)
        new(**kwargs).render
      end
    end
  end
end
