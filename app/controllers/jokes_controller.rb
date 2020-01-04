class JokesController < ApplicationController
    def index
      render json: Joke.all.to_json()
        # :include => {
        #   :content => {
        #     except: [:created_at, :updated_at]
        #   }},
        #   except: [:created_at, :updated_at]})
    end
  
    def show
      render json: Joke.find(params[:id]).to_json(
        except: [:created_at, :updated_at]
      )
    end
  
    
  
    private
  
    def joke_params
      params.require(:joke).permit(:content)
    end
  
  end