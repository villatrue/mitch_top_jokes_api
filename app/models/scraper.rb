require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
    def scrape_jokes
        joke_url = 'https://www.buzzfeed.com/mrloganrhoades/a-complete-ranking-of-almost-every-single-mitch-hedberg-joke?utm_term=.ng0r5LEb3J#.pkZw8O5zJ3'
        html = open(joke_url)
        doc = Nokogiri::HTML(html)
        jokes = doc.css('.subbuzz').css('p')
        jokes_arr = []
        jokes.each do |joke|
            content = joke.children.text 
            separated = content.split(" ")
                if separated.include?('[Listen]')        
                    separated.pop() 
                end
            joined = separated.join(" ")
            jokes_arr << joined
            
        end
        jokes_arr.reverse()
    end
end

scrape = Scraper.new
puts scrape.scrape_jokes
