class ContactsController < ApplicationController
    
   before_action :logged_in_user, only: [:index, :show]
   before_action :admin_user, only: [:show, :index]
    
   def new 
     @contact = Contact.new
   end
   
   def show
     @contact = Contact.find_by(id: params[:id])
     unless @contact.check?
      @contact.check = true
      @contact.save
      redirect_to contact_path(@contact)
     end
   end
   
  
   def index
     @contacts = Contact.page(params[:page]).per(10)
   end
    
   def create 
     @contact = Contact.new(contact_params)
     if @contact.save
      flash[:success] = "問い合わせを完了しました"
      redirect_to root_path
     else
      flash.now[:danger] = "入力内容に不備があります"
      render new_contact_path
     end
   end
    
    private
  
    def contact_params
      params.require(:contact).permit(:email, :subject, :contents)
    end
    
    
end