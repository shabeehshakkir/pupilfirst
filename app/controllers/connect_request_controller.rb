class ConnectRequestController < ApplicationController
  # GET /connect_request/:id/feedback/from_team/:token
  def feedback_from_team
    admin = User.find_by(auth_token: params[:token])
    connect_request = admin.startup.connect_requests.find(params[:id])

    if connect_request.update(rating_of_faculty: params[:rating])
      flash[:success] = 'Thank you! Your rating of the connect session has been saved.'
    else
      flash[:error] = "We're sorry, but something went wrong when we tried to save that rating."
    end

    redirect_to root_url
  end

  # GET /connect_request/:id/feedback/from_faculty/:token
  def feedback_from_faculty
    faculty = Faculty.find_by(token: params[:token])
    connect_request = faculty.connect_requests.find(params[:id])

    if connect_request.update(rating_of_team: params[:rating])
      flash[:success] = 'Thank you! Your rating of the connect session has been saved.'
    else
      flash[:error] = "We're sorry, but something went wrong when we tried to save that rating."
    end

    redirect_to root_url
  end
end
