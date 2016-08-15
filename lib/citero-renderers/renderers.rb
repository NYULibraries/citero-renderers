require 'action_pack'
class Array
  # Allow array of objects to be translated to ris
  def to_ris
     self.collect { |r| r.to_ris if r.respond_to? :to_ris}.join("\n\n")
   end

   # Allow array of objects to be translated to ris
   def to_bibtex
     self.collect { |r| r.to_bibtex if r.respond_to? :to_bibtex }.join("\n\n")
   end
end

# Adds a renderer for RIS.
ActionController::Renderers.add :ris do |ris, options|
  ris = ris.first if ris.is_a? Array and ris.count == 1
  filename = (ris.respond_to?(:to_param) and ris.class.respond_to?(:acts_as_citable)) ? ris.to_param : "export"
  ris = ris.respond_to?(:to_ris) ? ris.to_ris() : ris
  ris = "#{options[:callback]}(#{ris})" unless options[:callback].blank?
  self.content_type ||= Mime::Type.lookup(:ris)
  self.send_data ris, filename: "#{filename}.ris"
end

# Adds a renderer for BibTeX.
ActionController::Renderers.add :bibtex do |bibtex, options|
  bibtex = bibtex.first if bibtex.is_a? Array and bibtex.count == 1
  filename = (bibtex.respond_to?(:to_param) and bibtex.class.respond_to?(:acts_as_citable)) ? bibtex.to_param : "export"
  bibtex = bibtex.respond_to?(:to_bibtex) ? bibtex.to_bibtex() : bibtex
  bibtex = "#{options[:callback]}(#{bibtex})" unless options[:callback].blank?
  self.content_type ||= Mime::Type.lookup(:bibtex)
  self.send_data bibtex, filename: "#{filename}.bib"
end
