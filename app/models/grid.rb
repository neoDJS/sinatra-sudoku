class Grid < ActiveRecord::Base
    has_many :boxes
    belongs_to :user
    before_create :init
    after_create :generateValue
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
        # allValues = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        # alredySet = []
        # a = [1,2,3,4,5,6,7,8,9]
        # b = [2,4,5,6,8]
        # c = a-b
        # c.sample
        caseToInit = (81 - 9*self.complexity)/3;#8;#

        caseToInit.times do |i|         
            box = self.boxes.select{|b| b.value.nil? }.sample;  
            setCaseValue(box);
            box2 = self.boxes.find{|b| (b.line == (8-box.line)) && (b.column == (8-box.column)) };
            setCaseValue(box2);
        end
    end

    def setCaseValue(box)
        allValues = [1, 2, 3, 4, 5, 6, 7, 8, 9];

        neighbors = self.boxes.select{|b| ((b != box) && (!b.value.nil?)) && 
                                        ((b.line == box.line) || (b.column == box.column) || (b.bloc == box.bloc))};
        neighborsValue = neighbors.map(&:value);

        generatedValue = (allValues - neighborsValue).sample
        box.update({value: generatedValue, creator: "System"})
    end

    def reset
        self.boxes.each do |box|
            if(box.creator == "User")
                box.update(value: "");
            end
        end
    end
end