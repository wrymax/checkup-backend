# SMS Sender using Twilio

class SmsSender
  class DummySmsResult
    attr_accessor :sid, :from, :to, :error_code
    
    def initialize(sid, from, to)
      self.sid = sid
      self.from = from
      self.to = to
      self.error_code = 0
    end
  end
  
  # Production env will charge real dollars, while other env uses a trial account
  if Rails.env.production? || Rails.env.staging? || Rails.env.develop? || Rails.env.development?
    SID = 'ACd2295ace05ce0889d189b2222d566114'
    AUTH_TOKEN = '94a6902a10f823dd2a2722731d720b14'
    FROM = '+14159675266'
  else
    SID = 'AC03d5f07c61b7204079e89ba0d2873440'
    AUTH_TOKEN = '0500fe277e05a1e6f117acde711e108c'
    FROM = '+17082988259'
  end

  # SID = 'AC03d5f07c61b7204079e89ba0d2873440'
  # AUTH_TOKEN = '0500fe277e05a1e6f117acde711e108c'
  # FROM = '+17082988259'
  @@twilio = Twilio::REST::Client.new SID, AUTH_TOKEN
  
  @@sent_out_env = {
    development: true,
    develop: true,
    production: true,
    staging: true
  }

  # send SMS via twilio
  def self.send(params)    
    unless verify_params(params)
      return false
    end
    
    _send_out = params[:send_out] || @@sent_out_env[Rails.env.to_sym]
    
    if _send_out
      # begin
      # rescue Exception => e
      #   return e
      # end
      
      # Production env will pick numbers from pool
      # Other env will simply use hard-coded FROM
      if Rails.env.production? || Rails.env.staging? || Rails.env.develop?
        from = params[:from] || FROM
      else
        from = FROM
      end

      begin
        @@twilio.api.account.messages.create(
          from: from,
          to: params[:to],
          body: params[:content]
        )
      rescue Exception => exec
        puts exec
        # UnexpectedException.create_with(exec)
        return false
      end
    else
      if Rails.env.development?
        puts "-- Sending sms: "
        puts "from: #{params[:from] || FROM}"
        puts "to: #{params[:to]}"
        puts "sms body: #{params[:content]}"
      end
      
      return DummySmsResult.new(SecureRandom.hex(4), params[:from] || FROM, params[:to])
    end
  end

  private

  def self.verify_params(params)
    params[:content].present? && params[:to].present?
  end
end
