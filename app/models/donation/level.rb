class Donation
  class Level

    def self.membership(donation)
      new(donation).membership
    end

    attr_reader :donation
    def initialize(donation)
      @donation = donation
    end

    def membership
      if donation >= 5000
        'Presenting Sponsor'
      elsif donation >= 2500
        'Platinum'
      elsif donation >= 500
        'Silver'
      elsif donation >= 250
        'Bronze'
      elsif donation >= 100
        'Brass'
      elsif donation >= 50
        'Member'
      else
        'Donor'
      end
    end
  end
end
