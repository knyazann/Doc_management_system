class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end
  
  def new 
    @document = Document.new
  end   
  
  def create
    @document = Document.create!(document_params)
    session[:document_id] = @document.id
    redirect_to root_path
  end

  def edit
    @document = Document.find_by id: params[:id]
  end

  def update
    @Document = Document.find_by id: params[:id]
    if @Document.update document_params
      redirect_to documents_path
    else
      render :edit
    end
  end

  def destroy
    @document = Document.find_by id: params[:id]
    #@document.file.purge
    @document.destroy
    redirect_to documents_path
  end

  private
    def document_params
      params.require(:document).permit(:name, :file)
    end
end