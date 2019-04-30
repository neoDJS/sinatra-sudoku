class Grid < ActiveRecord::Base
    has_many :boxes
    belongs_to :user


    # # @@grid = Array.new(9) {Array.new(9, 0)}
    # # attr_accessor :complexite
    # # def initialize()#(collection)
    # #     @complexite = 0
    # #     # collection.each{|k, v| send("#{k}=", v)}
    # # end

    # # def grid
    # #     @@grid
    # # end

    # def isInTheLine?(_value, _line)
    #     finded = false
    #     self.grid[_line].each do|col|
    #         if(col == _value)
    #             finded = true
    #             break
    #         end
    #     end
    #     finded
    # end

    # def isInTheColumn?(_value, _column)
    #     finded = false
    #     9.times do|i|
    #         if(self.grid[i][_column] == _value)
    #             finded = true
    #             break
    #         end
    #     end
    #     finded
    # end

    # def isGridEmpty?
    #     vide = true
    #     9.times do|i|
    #         9.times do|j|
    #             if(self.grid[i][j] != 0)
    #                 vide = false
    #                 break
    #             end
    #         end
    #         break if !vide
    #     end
    #     vide
    # end

    # def isInTheBloc?(_value, _line, _column)
    #     finded = false
    #     startL = 3*(_line/3)
    #     startC = 3*(_column/3)

    #     3.times do|i|
    #         3.times do|j|
    #             if(self.grid[i+startL][j+startC] == _value)
    #                 finded = true
    #                 break
    #             end
    #         end
    #         break if finded
    #     end
    #     finded
    # end

    # # def printG

    # #     sLine = "";

    # #     puts "";

    # #     puts "*************************************";

    # #     9.times do|i|
    # #         sLine = "*"

    # #         9.times do|j|
    # #             sLine += self.grid[i][j] == 0 ? "   " : " #{self.grid[i][j] } ";
    # #             #if (j < 8){
    # #             if ((j + 1) % 3 == 0) 
    # #                 sLine += "*";
    # #             else
    # #                 sLine += "|";
    # #             end
    # #             #}
    # #         end

    # #         #if (i == 0) {
    # #             #sLine += "\t Complexité : " + self.complexite;
    # #         #}

    # #         puts sLine
    # #         #if (i < 8){
    # #         if ((i + 1) % 3 == 0) 
    # #             puts "*************************************"
    # #         else 
    # #             puts "*-----------*-----------*-----------*"
    # #         end
    # #         #}
    # #     end

    # #     puts ""
    # # end

    # def addBox (_box)
    #     checked = false
        
    #     if(!_box.isBoxValid?)
    #         #erreur déjà imprimé
    #     elsif(isInTheLine?(_box.value, _box.line))
    #         puts "Erreur, la grille comporte déjà la valeur #{_box.value} sur la ligne représentant la case (#{_box.line}, #{_box.column})."
    #     elsif(isInTheColumn?(_box.value, _box.column))
    #         puts "Erreur, la grille comporte déjà la valeur #{_box.value} sur le colonne représentant la case (#{_box.line}, #{_box.column})."
    #     elsif(isInTheBloc?(_box.value, _box.line, _box.column))
    #         puts "Erreur, la grille comporte déjà la valeur #{_box.value} dans le bloc représentant la case (#{_box.line}, #{_box.column})."
    #     else
    #         checked = true
    #         self.grid[_box.line][_box.column] = _box.value
    #         puts "Bravo! La valeur #{_box.value} a été insérée dans la case (#{_box.line}, #{_box.column}). "
    #     end
        
    #     return checked
    # end

    # def grilleToArrayBox
    #     al = Array.new
    #     boxVal = {}
    #     self.grid.length.times do|i|
    #         boxVal["line"] = i
    #         self.grid[i].length.times do|j|
    #             boxVal["column"] = j
    #             if(self.grid[i][j] > 0 )
    #                 boxVal["value"] = self.grid[i][j]
    #                     al << Box.new(boxVal)
    #             end
    #         end
    #     end
    #     al
    # end
end