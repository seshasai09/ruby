class Calculator
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
        @stack =[]
        operations = ["+","-","*","/","**","%"]
        puts "Operations available with this calculator are "
        puts operations
    end
    
    def readInput
        self.example
        operation=nil
        cnt=0
        puts "reading input"
        while operation!="exit"
            if(cnt%2==0)
                puts "please enter a number"
                i = gets.to_i
                @stack.unshift(i)
            else
                puts "please enter the operation or press exit to exit"
                 operation = gets.chomp
                 
                 if operation!="exit"
                    @stack.unshift(operation)
                 end
            end
            cnt+=1
        end
    end
    
    def compute
        cnt =0
        result=1.0
        opr="*"
        while(!@stack.empty?)
            if(cnt%2 == 0)
                val= @stack[0]
                @stack.delete_at(0)
                result = getVal(val,result,opr)
            else
                opr = @stack[0]
                @stack.delete_at(0)
            end
           
            cnt+=1
            
        end
        result
    end
    
    def getVal(val, result, opr)
        case opr
        when "+" then add(result,val)
        when "-" then subtract(result,val)
        when "*" then multiply(result,val)
        when "/" then divide(result,val)
        when "**" then power(result,val)
        when "%" then modulo(result,val)
        end
    end
    
    def example
        puts "this is the calculator program!!"
        puts "to use this you need to provide the input"
        puts "Give input similar to the was you give to hand held calculator "
        puts "example  operand3 operator2 operand2 oprator1 operand1"
        puts "Operations are performed as LIFO"
        puts "operations avaiilable are"
        puts  "+ (add)"
        puts  "- (subtract)"
        puts  "* (multiply)"
        puts  "/ (divide)"
        puts  "% (modulo)"
        puts  "** (exponential)"
        puts "to exit enter exit" 
    end
    def print_stack
        puts "#{@stack}"
    end
    
    
        
end

cal = Calculator.new()
cal.readInput
cal.print_stack
puts "value is #{cal.compute}"

        