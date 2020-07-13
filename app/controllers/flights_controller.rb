class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy, :ensure_correct_user, :toggle_status]
  before_action :authenticate_user!, except:[:index]
  before_action :ensure_correct_user, only:[:edit, :update, :destroy]

  def index
    if logged_in?(:admin) 
      @flights = Flight.all.order(created_at: :desc)
    else
      @flights = Flight.published.page
    end

    if logged_in?(:admin) 
      @q = Flight.ransack(params[:q])
      if params[:q].present?
        @flights = @q.result(distinct: true)
      end
    else
      @q = Flight.ransack(params[:q])
      if params[:q].present?
        ransack_flights = @q.result(distinct: true)
        @flights = ransack_flights.published
      end
    end
  end

  def new
    if params[:back]
      @flight = Flight.new(flight_params)
    else
      @flight = Flight.new
    end
  end

  def create
    @flight = Flight.new(flight_params)
    @flight.user_id = current_user.id
      
    if @flight.save
      redirect_to @flight, notice: "フライトログを投稿しました"
    else
      render 'new'
    end
  end

  def show
    @flights = Flight.all.order(created_at: :desc)
    @user = @flight.user
    @comment = current_user.comments.build
    @comments = @flight.comments
  end

  def edit

  end

  def update
    if @flight.update(flight_params)
      redirect_to @flight,notice: "フライトログを編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @flight.destroy
    redirect_to flights_path, notice:"フライト
    ログを削除しました"
  end

  def confirm
    @flight = Flight.new(flight_params)
    @flight.user_id = current_user.id
    render :new if @flight.invalid?
  end

  def ensure_correct_user
    if current_user.id != @flight.user_id
      flash[:notice] = "権限がありません"
      redirect_to flights_path
    end
  end

  def toggle_status
    if @flight.draft?
      @flight.published!
      redirect_to @flight, notice: 'ログを公開しました'
    elsif @flight.published?
      @flight.draft!
      redirect_to @flight, notice: 'ログを下書き（非公開）にしました'
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:departure_date, 
                                   :airline, 
                                   :flight_number, 
                                   :aircraft_type, 
                                   :seat_class, 
                                   :seat_number, 
                                   :departure_airport, 
                                   :departure_estimated_time, 
                                   :actual_departure_time, 
                                   :arrival_airport, 
                                   :arrival_estimated_time, 
                                   :actual_arrival_time, 
                                   :flight_mile, 
                                   :fare, 
                                   :booking_class, 
                                   :getting_mile, 
                                   :getting_point, 
                                   :review, 
                                   :photo1, 
                                   :photo1_cache, 
                                   :photo2, 
                                   :photo2_cache, 
                                   :photo3, 
                                   :photo3_cache, 
                                   :total_getting_mile, 
                                   :total_getting_point,
                                   :flight_hours, 
                                   :flight_minutes, 
                                   :status)
  end

  def set_flight
    @flight = Flight.find(params[:id])
  end
end