class Event < ApplicationRecord
  belongs_to :user
  has_many :attendance

  validates :title, presence: true, length: { in: 5..140 }
  validates :start_date, presence: true 
  validate :future_event
  validates :duration, presence: true
  validates :description, presence: true, length: { in: 20..1000 }
  validates :location, presence: true
  validates :price, presence: true, length: { in: 1..1000 }

  private

  def future_event
    errors.add(:date, "Can't be in the past!") if date < Date.today
  end
  def event_send
    EventMailer.event_email(self).deliver_now
  end
end
