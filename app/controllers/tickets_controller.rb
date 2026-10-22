class TicketsController < ApplicationController
    def index
        tickets = Ticket.all

        render json: tickets, status: :ok

    end

    def create
        tickets = Ticket.new(ticket_params)

        if tickets.save
            render json: tickets, status: :created
        else
            render json: {errors: tickets.errors.full_messages},status: :unprocessable_entity
        end
    end

    def show
        tickets = Ticket.find(params[:id])
        render json: tickets, status: :ok
    end

    def update
        tickets = Ticket.find(params[:id])
        if tickets.update(ticket_params)
            render json: tickets, status: :ok
        else
            render json: {errors: tickets.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        tickets = Ticket.find(params[:id])
        tickets.destroy!

        head :no_content
    end


    private

    def ticket_params
        params.require(:ticket).permit(
            :title,
            :description,
            :priority,
            :status
        )

    end

    
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    private

    def render_not_found
        render json: {
        error: "Ticket not found"
        }, status: :not_found
    end

end