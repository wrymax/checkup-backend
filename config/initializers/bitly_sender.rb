class BitlySender
  def self.shorten(link)
    ret = link
    begin
      ret = Bitly.client.shorten(link).short_url
    rescue Exception => e
      puts e.message
      # BitlyAccount.find_by_access_token(Bitly.access_token).expire!
      # current_account = BitlyAccount.current_account
      # if current_account
      #   puts "  > change account to #{current_account.access_token}"
      #   Bitly.access_token = current_account.access_token
      #   ret = Bitly.client.shorten(link).short_url
      # else
      #   ret = link
      # end
    end

    ret
  end
end
