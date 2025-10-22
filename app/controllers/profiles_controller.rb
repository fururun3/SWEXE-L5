class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    message = params[:profile][:message]
    user = User.find_by(uid: session[:login_uid])

    if user.nil?
      redirect_to users_path, alert: "ログインしてください"
      return
    end

    p = Profile.new(message: message, user_id: user.id)

    if p.save
      redirect_to profiles_path, notice: "プロフィールを作成しました"
    else
      render :new, status: 422
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    p = Profile.find(params[:id])
    if p.update(message: params[:profile][:message])
      redirect_to profiles_path, notice: "プロフィールを更新しました"
    else
      render :edit, status: 422
    end
  end

  def destroy
    p = Profile.find(params[:id])
    p.destroy
    redirect_to profiles_path, notice: "プロフィールを削除しました"
  end
end
