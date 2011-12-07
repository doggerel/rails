Rails.application.routes.draw do

  mount ChatPusherEngine::Engine => "/chat_pusher_engine"
end
