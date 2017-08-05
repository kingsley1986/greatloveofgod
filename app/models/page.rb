class Page < ActiveRecord::Base
  has_many :pictures, as: :picturable, dependent: :destroy
  accepts_nested_attributes_for :pictures, :reject_if => proc { |attributes| attributes['image'].blank? }


  PAGE_TYPE = [  'Orphanage',
                 'Youths',
                 'Women',
                 'Food',
                 'Prison',
                 'Hospital',
                 'Sunday',
                 'Tuesday',
                 'Thursday',
                 'Home Page',
                 'Contact',
                 'About_Greatlove',
                 'aboutgo',
                 'About',
                 'Fridaynightvigil',
               ]


scope :orphanage, -> { where(page_type: 'orphanage')  }
scope :youth, -> { where(page_type: 'Youths') }
scope :women, -> { where(page_type:  'Women')  }
scope :food, -> { where(page_type: 'Food') }
scope :prison, -> { where(page_type: 'Prisonns') }
scope :hospital, -> { where(page_type: 'Hospital') }
scope :sunday, -> { where(page_type: 'Sunday') }
scope :tuesday, -> { where(page_type: 'Tuesday') }
scope :thursday, -> { where(page_type:  'Thursday')  }
scope :home, -> { where(page_type:  'Home Page')  }
scope :contact, -> { where(page_type: 'Contact') }
scope :about, -> { where(page_type: 'About') }
scope :greatloveofgod, -> { where(page_type: 'greatloveofgod') }
scope :fridaynightvigil, -> { where(page_type: 'Fridaynightvigil') }
scope :aboutgo, -> { where(page_type: 'aboutgo') }

end
