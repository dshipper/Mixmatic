class MixesController < ApplicationController
  # GET /mixes
  # GET /mixes.json
  # def index
  #   @mixes = Mix.all
  # 
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @mixes }
  #   end
  # end

  # GET /mixes/1
  # GET /mixes/1.json
  def show
    @mix = Mix.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mix }
    end
  end

  # GET /mixes/new
  # GET /mixes/new.json
  def new
    @mix = Mix.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mix }
    end
  end

  # # GET /mixes/1/edit
  # def edit
  #   @mix = Mix.find(params[:id])
  # end

  # POST /mixes
  # POST /mixes.json
  def create
    debugger
    @mix = Mix.new(params[:mix])
    
    unless user_signed_in?
    @user = User.new(:name => params[:first_name], :email => params[:email_address], :password => params[:password])
      if @user.save
        sign_in @user
        @mix.user_id = @user.id
        respond_to do |format|
          if @mix.save
            format.html { redirect_to @mix, notice: 'We sent your mix! Here\'s a preview.' }
            format.json { render json: @mix, status: :created, location: @mix }
            UserMailer.you_got_mix(@user.name, @mix.recipient_name, "http://www.mixmatic.co/mixes/"+@mix.id, @mix.recipient_email).deliver
          else
            format.html { render action: "new" }
            format.json { render json: @mix.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { render action: "new" }
          format.json { render json: @mix.errors, status: :unprocessable_entity }
        end
      end
    else
      @mix.user_id = current_user.id
      respond_to do |format|
        if @mix.save
          format.html { redirect_to @mix, notice: 'We sent your mix! Here\'s a preview.' }
          format.json { render json: @mix, status: :created, location: @mix }
          UserMailer.you_got_mix(current_user.name, @mix.recipient_name, "http://www.mixmatic.co/mixes/"+@mix.id, @mix.recipient_email).deliver
        else
          format.html { render action: "new" }
          format.json { render json: @mix.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /mixes/1
  # PUT /mixes/1.json
  # def update
  #     @mix = Mix.find(params[:id])
  # 
  #     respond_to do |format|
  #       if @mix.update_attributes(params[:mix])
  #         format.html { redirect_to @mix, notice: 'Mix was successfully updated.' }
  #         format.json { head :ok }
  #       else
  #         format.html { render action: "edit" }
  #         format.json { render json: @mix.errors, status: :unprocessable_entity }
  #       end
  #     end
  #   end
  # 
  #   # DELETE /mixes/1
  #   # DELETE /mixes/1.json
  #   def destroy
  #     @mix = Mix.find(params[:id])
  #     @mix.destroy
  # 
  #     respond_to do |format|
  #       format.html { redirect_to mixes_url }
  #       format.json { head :ok }
  #     end
  #   end
end
