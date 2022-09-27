class PlantsController < ApplicationController
    def index
        plant =Plant.all 
        render json:plant
        
    end

   def show 
       plant = Plant.find_by(id: params[:id])
    if plant
        render json:plant
    else
        render json:{error: "Plants not found"},status: :not_found 
    end

end
   def create
    plant =Plant.create(plants_param)
    render json:plant ,status: :created
   end
private
 
 def plants_param
    params.permit(:name,:image,:price)
 end

end
