class WelcomeController < ApplicationController
  # I can login into the web site.
  def login
    # search for the user by user_name. User class, find_by connects to database.
    users = User.find_by_user_name(params[:user_name_login])
    # if user from search match the password create a session.
    if users.nil?
      @flash = flash.now[:notice] = "no username found"
     render 'welcome/record'


    elsif users.password == params[:password_login]
      session[:userid] = params[:user_name_login]
      session[:passwordid] = params[:password_login]
      # If log in is successful, I am taken to a page showing my registration information
      redirect_to '/welcome/register'

    else
      # If log in is fails, I am taken back to the log in page.
      @flash = flash.now[:notice] = "login failure"
      render '/welcome/record'

    end
  end

  def logout
    session[:userid] = nil
    session[:password] = nil
    @flash = flash.now[:notice] = "You have been logged out!"
    render '/welcome/record'
  end

  # create new user method
  def make_new_user
    users = User.find_by_user_name(params[:user_name])
    # if user from search match the password create a session.
    if !users.nil?
      @flash = flash.now[:notice] = "User ID taken, try another"
      render 'welcome/index'
    # if user name or password is missing (nil) the go back (redirect) to index and try again
    elsif params.has_key?(:user_name) && !params[:user_name].strip.empty?
      # assign instance variable, calling new method on the user class which makes a new object and assigns it to @user variable. first_name is connect the first name field in the database. when you create a new user all the fields are nil by default
      @user = User.new
      # assign first name as parameters if the fields is not (if !params[:first_name].strip.empty?) changes the empty string to nil. you could also use ...unless first_name.empty
      @user.first_name = params[:first_name] if !params[:first_name].strip.empty?
      @user.last_name = params[:last_name] if !params[:last_name].strip.empty?
      @user.street_address = params[:street_address] if !params[:street_address].strip.empty?
      @user.city = params[:city] if !params[:city].strip.empty?
      @user.state = params[:state] if !params[:state].strip.empty?
      @user.zip_code = params[:zip_code] if !params[:zip_code].strip.empty?
      @user.country = params[:country] if !params[:country].strip.empty?
      add_phone
      @user.email = params[:email] if !params[:email].strip.empty?
      # assigns the object's (@user) user_name to the user name field coming from the html
      @user.user_name = params[:user_name] if !params[:user_name].strip.empty?
      # assign the :password inputted by user to the @user instance variable and assigns the :user_name param to the password colomn.
      @user.password = params[:password] if !params[:password].strip.empty?
      # saves to database!
      @user.save
      # cookie[:user_name] = user_name
      redirect_to '/welcome/record'
    end
    # else
    #   redirect_to '/welcome/index'
  end

  def record
  end

  def add_phone

    if params.has_key?(:user_name) && !params[:phone1].strip.empty?
      # new phone object
      @phone = Phone.new
      # @phone object of phones table then takes phone colomn with .phone and putting into it the parameter of phone 1 from user information.
      @phone.phone = params[:phone1].strip
      # create an collection of user numbers ((shovel)) << into phones table with user id that is linked to user table
      @user.phones << @phone
      @phone.save

    else
      @phone = Phone.new
      @phone.phone = "no phone"
      @user.phones << @phone
      @phone.save
    end

    if !params[:phone2].strip.empty?
      # new phone object
      @phone = Phone.new
      # @phone object of phones table then takes phone colomn with .phone and putting into it the parameter of phone 1 from user information.
      @phone.phone = params[:phone2].strip
      # create an collection of user numbers ((shovel)) << into phones table with user id that is linked to user table
      @user.phones << @phone
      @phone.save

    else
      @phone = Phone.new
      @phone.phone = "no phone"
      @user.phones << @phone
      @phone.save
    end

    if !params[:phone3].strip.empty?
      # new phone object
      @phone = Phone.new
      # @phone object of phones table then takes phone colomn with .phone and putting into it the parameter of phone 1 from user information.
      @phone.phone = params[:phone3]
      # create an collection of user numbers ((shovel)) << into phones table with user id that is linked to user table
      @user.phones << @phone
      @phone.save

      # if there is no phone print no phone
    else
      @phone = Phone.new
      @phone.phone = "no phone"
      @user.phones << @phone
      @phone.save
    end

  end

  def register
    @the_user = User.find_by_user_name(session[:userid])
  end

  def index
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def update
  end
end
