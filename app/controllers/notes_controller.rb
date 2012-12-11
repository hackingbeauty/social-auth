class NotesController < ApplicationController
  def index
    authentication = Authentication.find_by_uid(session[:uid])
    user = User.find_by_id(authentication[:user_id])
    @notes = user.notes
  end

  def new
    @note = Note.new
  end

  def create
    authentication = Authentication.find_by_uid(session[:uid])
    user = User.find_by_id(authentication[:user_id])
    @note = Note.new(params[:note])
    @note.user_id = user.id
    if @note.save
      redirect_to notes_url, :notice => "Successfully created note."
    else
      render :action => 'new'
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(params[:note])
      redirect_to notes_url, :notice  => "Successfully updated note."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_url, :notice => "Successfully destroyed note."
  end
end
