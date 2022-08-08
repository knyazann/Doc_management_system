class DocumentsController < ApplicationController
before_action :require_authentication
before_action :set_document!, only: %i[edit update show destroy]

  def index
    if params[:search_number] or params[:search_name] or params[:search_type] or params[:search_contractor]
      @documents = search
    else
      @documents = Document.all.order('created_at DESC')
    end
  end

  def search
    @documents = Document.search(params[:search_number], params[:search_name], params[:search_type], params[:search_contractor])
  end

  def my_documents
    @documents = @current_user.documents.all
    render 'documents/my_doc'
  end
  
  def new 
    @contractors = Contractor.all
    @document = Document.new
    dep = Department.find_by id: @current_user.department_id
    Document.all.empty? ? doc_count = 1 : doc_count = Document.last.id+1
    @reg_number = "#{doc_count}/#{dep.dep_code}"
  end

  def show
    @route = @document.routes.build
    @routes = Route.where document_id: @document.id
  end
  
  def create
    @document = @current_user.documents.build document_params
      if @document.save
        redirect_to document_path(@document)
      else
        flash[:warning] = "Ошибка!"
        redirect_to documents_path
      end
  end

  def edit
  end

  def update
    if @document.update document_params
      flash[:success] = "Изменено!"
      redirect_to documents_path
    else
      render :edit
    end
  end

  def destroy
    #@document.file.purge
    @document.destroy
    redirect_to documents_path
  end

  private
    def document_params
      params.require(:document).permit(:number, :name, :file, :doc_type, :contractor_id)
    end

    def set_document!
      @document = @current_user.documents.find params[:id]
    end
end