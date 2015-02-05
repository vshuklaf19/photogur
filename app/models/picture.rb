class Picture < ActiveRecord::Base
  
  scope :newest_first, -> { order(“created_at DESC”) }
  scope :most_recent_five, -> { newest_first.limit(5) }
  scope :created_before, ->(time) { where("created_at < ?", time) }

  def self.created_before(time)
    where("created_at < ?", time) 
  end
end

#MyNotes:

  # #The correct syntax to write scopes in order to shorten Active Record queries
  # scope :most_recent_three, -> {order(created_at: :desc).limit(3)}
  # #If our scope method has an argument..we need to pass it into the || brackets like 'date' in below example
  # scope :created_before, -> (date) {w here("created_at < ?", date) } 

  # #scope
  # # def self.most_recent_three #'self' because its a class method
  # #   order(created_at: :desc).limit(3)
  # # end
