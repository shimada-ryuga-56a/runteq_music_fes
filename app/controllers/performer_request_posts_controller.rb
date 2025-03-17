# frozen_string_literal: true

class PerformerRequestPostsController < ApplicationController
  def index; end

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
  end

  def update
  end

  def show; end

  def destroy; end

  private

  def post_params
    params.require(:performer_request_post).permit(:offer_or_request, :comment)
  end
end
