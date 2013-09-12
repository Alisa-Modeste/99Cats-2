class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_date, :color, :name, :sex

  validates :age, numericality: true
  validates :age, :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: %w(brown black white other)}
  validates :sex, inclusion: { in: %w(M F) }

  has_many :cat_rental_requests,
            class_name: 'CatRentalRequest',
            foreign_key: :cat_id,
            primary_key: :id,
            :dependent => :destroy
end
