class MainpagesController < ApplicationController
  # GET /mainpages
  # GET /mainpages.xml
  def main
    # if logged in, show main_page
    # else show log in page
    if session[:user_id]
      if !current_user
        render :action => 'not_logged_in'
      else
        join_game
        @matched = false        
      end
         #debugger
         current_user.reload
    else
      render :action => 'not_logged_in'
    end
  end
  
  def waiting
    while @matched = false
      check_for_game
    end
  end
  
  def join_game
    ###API Hook
  end 
  
  def play_game
    win_roll = rand(2)
    if win_roll == 0 #depends on api hook
      #lose
     lose
    
    else
      win 
      
    end
  end
  
  def win
    @user = User.find(:first, :conditions => {:id => session[:user_id]})
    @user.wins = @user.wins + 1
    @user.save
    flash[:notice] = 'Congratulations! You won!'
    render :action => 'finished'
  end
  
  def lose
    @user = User.find(:first, :conditions => {:id => session[:user_id]})
    @user.losses = @user.losses + 1
    @user.save
    flash[:notice] = 'Sorry! You lost!'
    render :action => 'finished'
  end
  
  
  def index
    @mainpages = Mainpage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mainpages }
    end
  end

  # GET /mainpages/1
  # GET /mainpages/1.xml
  def show
    @mainpage = Mainpage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mainpage }
    end
  end

  # GET /mainpages/new
  # GET /mainpages/new.xml
  def new
    @mainpage = Mainpage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mainpage }
    end
  end

  # GET /mainpages/1/edit
  def edit
    @mainpage = Mainpage.find(params[:id])
  end

  # POST /mainpages
  # POST /mainpages.xml
  def create
    @mainpage = Mainpage.new(params[:mainpage])

    respond_to do |format|
      if @mainpage.save
        flash[:notice] = 'Mainpage was successfully created.'
        format.html { redirect_to(@mainpage) }
        format.xml  { render :xml => @mainpage, :status => :created, :location => @mainpage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mainpage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mainpages/1
  # PUT /mainpages/1.xml
  def update
    @mainpage = Mainpage.find(params[:id])

    respond_to do |format|
      if @mainpage.update_attributes(params[:mainpage])
        flash[:notice] = 'Mainpage was successfully updated.'
        format.html { redirect_to(@mainpage) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mainpage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mainpages/1
  # DELETE /mainpages/1.xml
  def destroy
    @mainpage = Mainpage.find(params[:id])
    @mainpage.destroy

    respond_to do |format|
      format.html { redirect_to(mainpages_url) }
      format.xml  { head :ok }
    end
  end
end
