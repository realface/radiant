class PagePart < ActiveRecord::Base
  
  # Default Order
  default_scope :order => 'name'
  
  after_initialize :set_default_filter

  # Associations
  belongs_to :page
  
  # Validations
  validates_presence_of :name
  validates_length_of :name, :maximum => 100
  validates_length_of :filter_id, :maximum => 25, :allow_nil => true
  
  object_id_attr :filter, TextFilter

  def set_default_filter
    self.filter_id ||= Radiant::Config['defaults.page.filter'] if new_record?
  end

end
