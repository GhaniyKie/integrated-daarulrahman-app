module ApplicationHelper
    def rupiah(price)
        delimiter_regex = /(\d)(?=(\d{3})+(?!\d))/
        "Rp. #{price.to_s.gsub(delimiter_regex, '\\1.')}"
    end
    
    def alias_middle_name(name)
        # Usahakan nanti pakai Regex, biar keliatan Professional
        # Wkwkwk...
        splitted_name = name.split(' ').map(&:capitalize)

        if splitted_name.size > 2
            return "#{splitted_name[0]} #{splitted_name[1][0]}. #{splitted_name[2]}"
        elsif splitted_name.size < 2
            return "#{splitted_name[0]}"
        else
            return "#{splitted_name[0]} #{splitted_name[1][0]}."
        end
    end

    def show_name(aliases=false)        
        if aliases == false
            from_current_user.nama
        elsif aliases == true
            alias_middle_name(from_current_user.nama)
        else
            "Anonim"
        end
    end

end