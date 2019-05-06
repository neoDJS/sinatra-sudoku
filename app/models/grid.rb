class Grid < ActiveRecord::Base
    has_many :boxes
    belongs_to :user
    before_save :init

    def init
        9.times do |i|
            ash = {}
            ash[:line] = i
            9.times do |j|
                ash[:column] = j
                ash[:bloc] = 3*(i/3) + (j/3)
                boxes << Box.new(ash)
            end
        end
    end
end