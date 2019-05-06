class Box < ActiveRecord::Base
    belongs_to :grid
    validates :creator,
    :inclusion  => { :in => ['User', 'System'],
    :message    => "%{value} is not a valid Box creator" }
    validates :line, :column, inclusion: 0..8
    validates  :value, inclusion: 1..9, allow_nil: true
    validate :isInTheBloc?, :isInTheColumn?, :isInTheLine?, on: :update
    before_validation(on: :update) do
        self.value = nil if self.value == ''
      end

    def isInTheLine?
        self.grid.boxes.select{|b| b.line == self.line}.each do |b|
            if((b.column != self.column) && (b.value == self.value))
                errors.add(:line, "Already on this line");
            end
        end
    end

    def isInTheColumn?
        self.grid.boxes.select{|b| b.column == self.column}.each do |b|
            if((b.line != self.line) && (b.column != self.column) && (b.value == self.value))
                errors.add(:column, "Already on this column");
            end
        end
    end

    def isInTheBloc?
        self.grid.boxes.select{|b|  b.bloc == self.bloc}.each do |b|            
            if((b.line != self.line) && (b.value == self.value))
                errors.add(:bloc, "Already on this bloc")
            end
        end
    end

    # def isBoxValid?
    #     valide = true
        
    #     if(self.line < 0 || self.line > 8)
    #         valide = false
    #         puts "Erreur ligne#{self.line}, la ligne doit être comprise entre 1 - 9."
    #     elsif(self.column < 0 || self.column > 8)
    #         valide = false
    #         puts "Erreur colonne#{self.column}, la colonne doit être comprise entre 1 - 9."
    #     elsif(self.value < 1 || self.value > 9)
    #         valide = false
    #         puts "Erreur valeur#{self.value}, la valeur doit être comprise entre 1 - 9."
    #     end
                
    #     return valide;
    # end
    
    def as_json
      {
          bloc: 	@bloc,
          line: 	@line,
          column: 	@column,
          value:	@value,
          userSystem:	@creator
      }
    end
    
    def to_json(*option)
        as_json.to_json(*option)
    end

    # def toString() 
    #     return "#{line} #{column} #{value}";
    # end
end