class Joke < ApplicationRecord
    def self.create_from_scrape(jokes)
        jokes.each do |joke|
            hash = {content: joke}
            Joke.create(hash)
        end
    end
end
