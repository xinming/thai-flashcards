class VocabsController < ApplicationController
  # before_filter :authenticate
  before_filter :find_vocab
  layout "application", :except => [:ajax_show]
  VOCABS_PER_PAGE = 20

  def create
    @vocab = Vocab.new(params[:vocab])
    @vocab.thai.gsub!(" ", "")
    respond_to do |format|
      if @vocab.save
        flash[:notice] = 'Vocab was successfully created.'
        format.html { redirect_to @vocab }
        format.xml  { render :xml => @vocab, :status => :created, :location => @vocab }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vocab.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @vocab.destroy
        flash[:notice] = 'Vocab was successfully destroyed.'        
        format.html { redirect_to vocabs_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'Vocab could not be destroyed.'
        format.html { redirect_to @vocab }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  def index
    @vocabs = Vocab.paginate(:page => params[:page], 
    :per_page => VOCABS_PER_PAGE, 
    :order => 'created_at DESC',
    :conditions => ['done = ?',  false])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @vocabs }
    end
  end

  def edit
  end

  def new
    @vocab = Vocab.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @vocab }
    end
  end

  def show
    respond_to do |format|
      format.js
      format.html{ render :layout => '/layouts/flashcard' }
      format.xml  { render :xml => @vocab }
      
    end
  end
  

  
  def update
    respond_to do |format|
      if @vocab.update_attributes(params[:vocab])
        flash[:notice] = 'Vocab was successfully updated.'
        format.html { redirect_to @vocab }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vocab.errors, :status => :unprocessable_entity }
      end
    end
  end

  def lookup

    thai = params[:thai]
    
    data = Hash.new
    data["search"] = thai
    x = Net::HTTP.post_form(URI.parse('http://www.thai-language.com/dict'), data)
    y= x.read_body
    raise y.scan(/star.gif\'>(.*)<\/td/).inspect
    raise y.scan(/star.gif\'>(.*)<\/td/).inspect
  end

  private

  def find_vocab
    @vocab = Vocab.find(params[:id]) if params[:id]
  end

end
