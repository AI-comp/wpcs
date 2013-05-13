class Admin::Contests::ProblemsController < AdminController
  before_filter :load_contest

  private
  def load_contest
    @contest = Contest.find(params[:contest_id])
  end

  public

  # GET /contests/1/problems
  def index
    @problems = @contest.problems
    @users = User.where(is_admin: false, 'scores.contest_id' => @contest.id)

    respond_to do |format|
      format.html
    end
  end

  # GET /contests/1/problems/1
  def show
    @problem = Problem.find(params[:id])
    @input_type = params[:input_type]

    respond_to do |format|
      format.html
    end
  end

  # GET /contests/1/problems/new
  def new
    @problem = Problem.new
    @problem.description = Markdown.example

    respond_to do |format|
      format.html
    end
  end

  # POST /contests/1/problems
  def create
    @problem = Problem.new(params[:problem])
    @problem.contest_id = params[:contest_id]

    respond_to do |format|
      if @problem.save
        format.html { redirect_to action: 'index' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # GET /contests/1/problems/1/edit
  def edit
    @problem = Problem.find(params[:id])
  end

  # PUT /contests/1/problems/1
  def update
    @problem = Problem.find(params[:id])

    respond_to do |format|
      if @problem.update_attributes(params[:problem])
        format.html { redirect_to action: 'index' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /contests/1/problems/1
  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to action: 'index' }
    end
  end

  def download_small
    download(:small)
  end

  def download_large
    download(:large)
  end

  def download(type)
    p = Problem.find(params[:id])

    id = p.index + 1
    title = p.title.gsub(' ', '_')

    send_data(p.input(type), filename: "#{id}. #{title}_#{type}.txt")
  end

end
