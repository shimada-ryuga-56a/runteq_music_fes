# frozen_string_literal: true

class PerformerRequestPostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @offer_posts = PerformerRequestPost.where(offer_or_request: 'offer').includes(:user)
    @request_posts = PerformerRequestPost.where(offer_or_request: 'request').includes(:user)
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
      p 'error'
      p @post.errors.full_messages
      flash.now[:alert] = '投稿に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = PerformerRequestPost.find(params[:id])
    if @post.user != current_user
      redirect_to performer_request_posts_path, alert: '編集権限がありません'
    end
  end

  def update; end

  def show; end

  def destroy; end

  private

  def post_params
    params.require(:performer_request_post).permit(:offer_or_request, :comment)
  end
end
