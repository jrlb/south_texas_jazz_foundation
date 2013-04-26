class Biography < ActiveRecord::Base
  attr_accessible :biography, :first_name, :instrument, :last_name, :section

  scope :conductors, -> { where(section: 'conductor').order("last_name") }
  scope :saxes, -> { where(section: 'sax').order("last_name") }
  scope :bones, -> { where(section: 'bone').order("last_name") }
  scope :trumpets, ->{ where(section: 'trumpet').order("last_name") }
  scope :rhythm, -> { where(section: 'rhythm').order("last_name") }

  def full_name
    "#{first_name} #{last_name}"
  end
end
