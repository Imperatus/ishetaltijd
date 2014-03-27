class TimerController < ApplicationController
  def new

  end


  def index
    responses = ['Voor je kijken, doorcoden!!!', 'We zijn nog slimme applicaties aan het bouwen...', 'Writersblock...']
    time_check = Chronic.parse('today 4pm')
    @now      = Time.new


    if @now.hour >= time_check.hour
      time_check = Chronic.parse('tomorrow 4pm')
    end

    @time   = false

    if @now.hour.between?(time_check.hour, time_check.hour + 1)
      @answer = 'JAAAAAAAAAAAAAAAAA'
      @time   = true
    else
      @answer = responses.sample
    end
    @difference            = Hash.new
    @difference["hours"]   = sprintf '%02i', (((@now - time_check).abs) / 3600).to_i
    @difference["minutes"] = sprintf '%02i', ((((@now - time_check).abs) / 60) - (@difference["hours"].to_i * 60)).to_i
    @difference["seconds"] = sprintf '%02i', ((((@now - time_check).abs)) - (@difference["hours"].to_i * 3600) - (@difference["minutes"].to_i * 60)).to_i
  end
end
