class Player
    attr_accessor :marker
    attr_accessor :name

    def choose_name
        puts "What's your name?"
        self.name = gets.chomp
    end

    def choose_marker
        puts "Xs or Os? [options: x / o]"
        self.marker = gets.chomp.downcase
        validate_marker
    end

    def validate_marker
        self.choose_marker if self.marker != 'x' && self.marker != 'o'
    end

end