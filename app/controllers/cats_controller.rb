class CatsController < ApplicationController
  def index
    @redis ||= Redis.new
    if params[:revision].present?
      render text: @redis.get("ember-cats:#{params[:revision]}")
    else
      current = @redis.get('ember-cats:current')
      render text: @redis.get(current)
    end
  end
end
