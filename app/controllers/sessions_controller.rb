class SessionsController < ApplicationController
  def login
    if request.post?
      if user = Student.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          session[:user_type] = "student"
          redirect_to grades_student_path, notice: "Successful login"
        else
          flash.now[:notice] = "User information does not match records"
        end
      elsif user = Teacher.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          session[:user_type] = "teacher"
          redirect_to students_path, notice: "Successful login"
        else
          flash.now[:notice] = "User information does not match records"
        end
      elsif user = Parent.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          session[:user_type] = "parent"
          redirect_to grades_parent_path, notice: "Successful login"
        else
          flash.now[:notice] = "User information does not match records"
        end
      else
        flash.now[:notice] = "No record found"
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to sessions_login_path, notice: "Successfully logged out."
  end
end
