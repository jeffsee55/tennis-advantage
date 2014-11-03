class ProgramCategory < ActiveRecord::Base
  has_many :programs

  def make_class_name
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end
