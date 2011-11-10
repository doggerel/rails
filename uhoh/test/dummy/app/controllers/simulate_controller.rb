class SimulateController < ApplicationController
  def failure
    redirect_to uhoh_engine.root_url
  end
end
