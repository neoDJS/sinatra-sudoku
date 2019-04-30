class Sudoku
    # @@user = User.new
    # @@playground = Grid.new

    # def ground
    #     @@playground
    # end

    # def loadG
    #     count = 0
    #     if File.exist?('sudoku.json')
    #         File.foreach('sudoku.json') { |line|
    #             ground.addBox(Box.new(JSON.parse(line, :symbolize_names => true)))
    #             count += 1
    #         }
    #         puts "\nGame loaded!\n"
    #     else
    #         puts "\nJson sudoku file does not exist\n"
    #     end
    #     puts "------------------------------------------------------------------------------- "
    #     return true
    # end

    # def saveG
    #     File.open('sudoku.json', 'w') { |fc|
    #         ground.grilleToArrayBox.each do |b|
    #             if (b.value != 0)
    #                 fc.puts b.to_json
    #             end
    #         end
    #     }
    #     puts "------------------------------------------------------------------------------- "
    #     return true
    # end

    # def run
    #     isEnd = false;

    #     puts "Bienvenue dans le jeu de Sudoku, ce jeu ... \n"

    #     while !isEnd
    #         ground.printG if(!ground.isGridEmpty?)
    #         isEnd = self.menu
    #     end

    #     puts "\nRevenez bientot...!\n"
    # end

    # def menu
    #     isEnd = false, isOk = false;
    #     choix = 0;
        
    #     puts "Veuillez choisir un des choix suivants: "
    #     puts ground.isGridEmpty?() ? "1. Charger jeu. " : "1. Sauvegarder jeu. "
    #     puts "2. Jouer Sudoku. "
    #     puts "3. Quitter"

    #     puts "------------------------------------------------------------------------------- "

    #     puts "Votre choix: "
    #     choix = getAnInteger(1, 3)

        
    #     case(choix)
            
    #         when 1 
    #             while(!isOk)
    #                 isOk = ground.isGridEmpty?() ?  self.loadG : self.saveG;
    #             end
    #             isEnd = false
    #         when 2 
    #             self.play
    #             isEnd = false
    #         when 3 
    #             isEnd = true
    #             puts "Merci d’avoir joué au jeu sudoku. "
    #         else 
    #             puts "Veuillez choisir le numero correspondant à votre attente. Merci! "
    #     end

    #     # puts "------------------------------------------------------------------------------- "
        
    #     return isEnd
    # end

    # def play
    #     isOk = false;
    #     values = {};
        
        
    #     puts "Veuillez choisir une ligne: "
    #     values["line"] = getAnInteger(0, 8)
    #     puts "Veuillez choisir une colonne: "
    #     values["column"] = getAnInteger(0, 8)
    #     puts "Veuillez choisir une valeur: "
    #     values["value"] = getAnInteger(1, 9)
        
    #     isOk = ground.addBox(Box.new(values));
    #     puts "------------------------------------------------------------------------------- "

        
    #     return isOk;
    # end

    # def getAnInteger(from, to)
    #     count = 0
    #     cInt = ""
    #     m = /\A\d+\z/
    #     while !(cInt.validate(m) && (from..to).cover?(cInt.to_i))
    #         puts "Invalid number.\n Please choose again : " if count>0
    #         cInt = gets.strip
    #         count += 1
    #     end
    #     cInt.to_i
    # end
end