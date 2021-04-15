module ApplicationHelper
    def rupiah(price)
        delimiter_regex = /(\d)(?=(\d{3})+(?!\d))/
        "Rp. #{price.to_s.gsub(delimiter_regex, '\\1.')}"
    end
end
