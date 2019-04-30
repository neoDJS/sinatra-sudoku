class Box < ActiveRecord::Base
    belongs_to :grid
    validates :creator,
    :inclusion  => { :in => ['User', 'System'],
    :message    => "%{value} is not a valid Box creator" }
    validates :line, :column, :value, inclusion: 1..9


    # # attr_accessor :line, :column, :value, :userSystem
    # # def initialize(ash)
    # #     ash.each{|k, v| send("#{k}=", v)}
    # # end

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
    
    # def as_json
    #   {
    #       line: 	@line,
    #       column: 	@column,
    #       value:	@value,
    #       userSystem:	@creator
    #   }
    # end
    
    # def to_json(*option)
    #     as_json.to_json(*option)
    # end

    # def toString() 
    #     return "#{line} #{column} #{value}";
    # end
end