class Todo < ActiveRecord::Base

  validates :desc, presence: true
  validates_presence_of :user, :message => "user does not exist"
  validate  :due_date_cannot_be_in_the_past

  scope :completed, ->(comp) { where("completed = ?", comp) }

  belongs_to :user

  def due_date_cannot_be_in_the_past
    errors.add(:due_date, "can't be in the past") if
      !due_date.blank? and due_date < Date.today
  end


end
