class Box < ActiveRecord::Base
    belongs_to :grid
    validates :creator,
    :inclusion  => { :in => ['User', 'System'],
    :message    => "%{value} is not a valid Box creator" }
    validates :line, :column, inclusion: 0..8
    validates  :value, inclusion: 1..9, allow_nil: true
    validate :isInTheBloc?, :isInTheColumn?, :isInTheLine?, on: :update
    before_validation(on: :update) do
        self.value = nil if self.value == ""
    end

    def isInTheLine?
        self.grid.boxes.select{|b| b.line == self.line}.each do |b|
            if((self.value != nil) && (b.column != self.column) && (b.value == self.value))
                errors.add(:line, "Already on this line");
            end
        end
    end

    def isInTheColumn?
        self.grid.boxes.select{|b| b.column == self.column}.each do |b|
            if((self.value != nil) && (b.line != self.line) && (b.value == self.value))
                errors.add(:column, "Already on this column");
            end
        end
    end

    def isInTheBloc?
        self.grid.boxes.select{|b|  b.bloc == self.bloc}.each do |b|            
            if((self.value != nil) && (b.line != self.line) && (b.column != self.column) && (b.value == self.value))
                errors.add(:bloc, "Already on this bloc")
            end
        end
    end
end