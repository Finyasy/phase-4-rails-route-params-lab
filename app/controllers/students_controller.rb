class StudentsController < ApplicationController

  def index
    students = Student.all
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

  # with query params returns students whose first or last name matches the query
  # Use query params in the index action to return a list of all students whose first or last name matches the query parameter.
  # params
  # => { key1: "value1", key2: "value2" }
  # expect(response.body).to include_json([
  # { first_name: 'Vanessa', last_name: 'Kirby', grade: 85 }
  def index
    students = Student.all
    if params[:name]
      students = students.where("first_name LIKE ? OR last_name LIKE ?", "%#{params[:name]}%", "%#{params[:name]}%")
    end
    render json: students
  end


end
