class Task < ActiveRecord::Base
  belongs_to :list

  validates :description, :presence => true


  # before_create :set_done_to_false

  # private
  #
  #   def set_done_to_false
  #     self.done = false
  #   end

  # The above isn't working and we can't figure out why.
  # Setting the default value of :done to false in the DB Migration seems to get it, though.

end
