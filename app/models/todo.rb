require "date"
require "active_record"

class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :due_date, presence: true
  validates :todo_text, length: { minimum: 2 }

  belongs_to :user

  def due_today?
    due_date == Date.today
  end

  def self.of_user(user)
    where(user_id: user.id)
  end

  def self.overdue
    where("completed = ? and due_date < ? ",false,Date.today)
  end

  def self.due_today
    where("due_date = ?",Date.today)
  end

  def self.due_later
    where("due_date > ?",Date.today)
  end

  def self.completed
    where(completed: true)
  end

end
