require 'pusher'
class ApplicationController < ActionController::Base
  Pusher.app_id = '10912'
  Pusher.key = '244a62c4217eb601c81d'
  Pusher.secret = '576806e088ad76f7693e'
  before_filter :configure_pusher
  protect_from_forgery
  def configure_pusher
    raw_config = File.read(Rails.root  + "config/pusher.yml")
    @config = YAML.load(raw_config)[Rails.env]
  end
end
