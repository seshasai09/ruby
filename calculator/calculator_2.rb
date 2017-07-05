class Calculator2
    require "./addition.rb"
    require "./subtraction.rb"
    require "./multiplication.rb"
    require "./modulo.rb"
    require "./division.rb"
    require "./exponential.rb"
    include Addition
    include Subtraction
    include Multiplication
    include Modulo
    include Division
    include Exponential
    
    def initialize
        puts "takes only two number and a mathematical operation input and computes the result"
        puts "exits only when users wants to wishes to exit"
        self.start
    end
    def start
        self.example
        opr=""
        while opr!="exit"
            puts "enter first number"
            n1 = gets.to_i
            puts "enter second number"
            n2 = gets.to_i
            puts "enter the operation to be performed/'exit' to exit"
            opr = gets.chomp
            if opr!="exit"
                puts "result of #{n1} #{opr} #{n2} is #{compute(n1,opr,n2)}"
            end
        end
    end
    
    def compute(n1,opr,n2)
        case opr
        when "+" then add(n1,n2)
        when "-" then subtract(n1,n2)
        when "*" then multiply(n1,n2)
        when "/" then divide(n1,n2)
        when "**" then power(n1,n2)
        when "%" then modulo(n1,n2)
        end
    end
    
    def example
        puts "this is the calculator program!!"
        puts "to use this you need to provide the input"
        puts "operations avaiilable are"
        puts  "+ (add)"
        puts  "- (subtract)"
        puts  "* (multiply)"
        puts  "/ (divide)"
        puts  "% (modulo)"
        puts  "** (exponential)"
        puts "to exit enter exit" 
    end
end

cal = Calculator2.new()    
        
        
        
    