class BioPresenter

  attr_reader :model

  def initialize(model = Biography)
    @model = model
  end

  def band
    [conductors, saxophones, trombones, trumpets, rhythm]
  end

  def conductors
    [this_method.singularize.capitalize,  model.conductors]
  end

  def saxophones
    [this_method.capitalize, model.saxes]
  end

  def trombones
    [this_method.capitalize, model.bones]
  end

  def trumpets
    [this_method.capitalize, model.trumpets]
  end

  def rhythm
    ["#{this_method.capitalize} Section", model.rhythm]
  end

  private

  def this_method
    caller[0] =~ /`(.*?)'/
    Regexp.last_match[1]
  end

end
