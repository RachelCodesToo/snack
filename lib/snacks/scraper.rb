require "nokogiri"
require "open-uri"

class Snacks::Scraper 
    
    def get_page
        user = CLI.new
        choice = user.user_chooses_nut
        get_from = NutsData.new
        doc = Nokogiri::HTML(open("https://nuts.com/nuts/#{get_from.nuts[choice]}"))
        doc
      end
    
      def about_nut_info
        get_page.css("div.formatted-content.description p").each do |p|
          puts p.text
          puts
        end
      end
end 
