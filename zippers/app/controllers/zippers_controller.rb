#command-t key bindings ,f,b ,t TlistToggle
class ZippersController < ApplicationController
  # GET /zippers
  # GET /zippers.json
  def index
    @zippers = Zipper.new(90210)
    end
  end

