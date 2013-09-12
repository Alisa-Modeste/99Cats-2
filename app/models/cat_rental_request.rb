class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :start_date, :end_date, :status

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED)}
  validate :not_double_booked, on: :update

  belongs_to :cat, class_name: 'Cat', foreign_key: :cat_id, primary_key: :id

  before_validation do |cat_rental_request|
    cat_rental_request.status ||= "PENDING"
  end


  def not_double_booked
    return if self.status != "APPROVED"
    unless overlapping_approved_requests.empty?
      errors.add(:cat_id, "cat is double booked")
    end
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: "PENDING")
  end

  def overlapping_requests
    CatRentalRequest.where("id != ?
      AND cat_id = ?
      AND (?, ?) OVERLAPS (start_date, end_date)",
      self.id, self.cat_id,
      self.start_date,
      self.end_date)
  end

  def pending?
    self.status == "PENDING"
  end

  def approve!
    CatRentalRequest.transaction do
      self.status = "APPROVED"
      self.save!

      overlapping_pending_requests.each do |request|
        request.deny!
      end
    end
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end
end

