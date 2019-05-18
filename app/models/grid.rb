class Grid < ActiveRecord::Base
    has_many :boxes
    belongs_to :user
    before_save :init
    validates :complexity, inclusion: 0..8

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
        # self.generateValue
    end

    def generateValue
        allValues = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        alredySet = []
        # a = [1,2,3,4,5,6,7,8,9]
        # b = [2,4,5,6,8]
        # c = a-b
        # c.sample
        caseToInit = 8 - self.complexity;

        caseToInit.times do |i|            
            alredySet << generatedValue = (allValues - alredySet).sample;
            9.times do |bi| # bi pour bloc indice
                bloc = self.boxes.select{|b|  (b.bloc == bi) && (b.value.nil?)};
                # blocValues = bloc.map(&:value);
                ash = selectCase(bloc, caseToInit, generatedValue);
                # generatedValue = (allValues - blocValues - ash[:lineValues] - ash[:colValues]).sample;
                ash[:box].update({value: generatedValue, creator: "System"})
            end
        end
    end

    def selectCase(bloc, numbCase, val)
        completed = valid = false;
        ash = {};
        while((!completed) || (!valid)) do
            ash[:box] = bloc.sample;
            line = self.boxes.select{|b| (b.line == ash[:box].line) && (b.column != ash[:box].column) && (!b.value.nil?)};
            valid = line.all?{|b| b.value != val};
            # ash[:lineValues] = line.map(&:value);
            # lineCount = line.select{|b| !b.value.nil? }.count;
            if valid
                lineCount = line.count;
                col = self.boxes.select{|b| (b.column == ash[:box].column) && (b.line != ash[:box].line) && (!b.value.nil?)};
                valid = col.all?{|b| b.value != val};
                # ash[:colValues] = col.map(&:value);
                # colCount = col.select{|b| !b.value.nil? }.count;
                if valid
                    colCount = col.count
                    completed = ((numbCase - colCount) > 0) && ((numbCase - lineCount) > 0);
                end
            end
        end
        ash
    end

    def reset
        self.boxes.each do |box|
            if(box.creator == "User")
                box.update(value: "");
            end
        end
    end
end