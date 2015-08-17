class JobsController < ApplicationController
	def index
    @jobs = Job.all # retrieve all the Job data, and store them in the variable @posts
  end

  def create
    @job = Job.new(post_params)

    @job.save
  end

  def show
    @job = Job.find_by_id(params[:id])

    if @job.nil?
      render :json => {
        :message => { :message => "Cannot find job posting" }
      }
    end
  end

  private

  def post_params
    params.require(:job).permit(:url, :employer_name, :employer_description, :job_title, :job_description,:year_of_experience, :education_requirement, :industry, :base_salary, :employment_type_id)
  end
end
      