module DigestKey
  extend ActiveSupport::Concern

  included do
    before_create :generate_digest_key
  end

  private

  # generate a digest key for public access
  def generate_digest_key
    loop do
      _key = SecureRandom.hex(4)
      unless self.class.find_by_digest_key(_key)
        self.digest_key = _key
        break
      end
    end
  end
end
