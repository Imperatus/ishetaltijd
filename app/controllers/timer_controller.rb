class TimerController < ApplicationController
  def new

  end


  def index
    responses = ['Voor je kijken, doorcoden!!!', 'We zijn nog slimme applicaties aan het bouwen...', 'Writersblock...']
    @now       = Time.new

    if @now.hour >= 12
      twelve = Chronic.parse('tomorrow noon')
    else
      twelve = Chronic.parse('noon')
    end

    @time   = false

    if @now.hour.between?(12,13)
      @answer = 'JAAAAAAAAAAAAAAAAA'
    else
      @answer                = responses.sample
    end
    @difference            = Hash.new
    @difference["hours"]   = sprintf '%02i', (((@now - twelve).abs) / 3600).to_i
    @difference["minutes"] = sprintf '%02i', ((((@now - twelve).abs) / 60) - (@difference["hours"].to_i * 60)).to_i
    @difference["seconds"] = sprintf '%02i', ((((@now - twelve).abs)) - (@difference["hours"].to_i * 3600) - (@difference["minutes"].to_i * 60)).to_i
  end
end
