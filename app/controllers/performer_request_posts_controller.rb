# frozen_string_literal: true

class PerformerRequestPostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @posts = PerformerRequestPost.order(created_at: :desc)
    @post_users = User.where(id: PerformerRequestPost.pluck(:user_id))
  end

  def new
    @post = current_user.performer_request_posts.build
  end

  def create
    @post = current_user.performer_request_posts.build(post_params)
    if @post.save
      redirect_to performer_request_posts_path, notice: '投稿が完了しました'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_post
    return unless @post.user != current_user

    redirect_to performer_request_posts_path, alert: '編集権限がありません'
  end

  def update
    set_post
    if @post.update(post_params)
      redirect_to performer_request_posts_path, notice: '編集が完了しました'
    else
      flash.now[:alert] = '編集に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy; end

  private

  def post_params
    params.require(:performer_request_post).permit(:title, :comment)
  end

  def set_post
    @post = PerformerRequestPost.find(params[:id])
  end
end
