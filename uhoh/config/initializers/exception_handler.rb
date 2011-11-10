    ActiveSupport::Notifications.subscribe do  
      |name, start, finish, id, payload| 
      if payload[:exception] 
        name, message = *payload[:exception] 
        Uhoh::Failure.create!(:message => message) 
      end  
    end  
