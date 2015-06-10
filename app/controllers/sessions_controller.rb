class SessionsController < ApplicationController
  def login
    if request.post?
      if
        user = Student.find_by_email(params[:email])

      elsif
        user = Teacher.find_by_email(params[:email])
        redirect_to students_path, notice: "Successful login"
      elsif
        user = Parent.find_by_email(params[:email])
      else
        flash.now[:notice] = "User information does not match records"
      end

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to parents_path, notice: "Successful login"
      end
    end
  end

  def logout
  end
end
