class DealsScheduler
  def initialize(date)
    @date = date
    @present_deals = Deal.published_on(@date).publishable
    @old_deals = Deal.published_before(@date)
  end

  def publish
    ApplicationRecord.transaction do
      unpublish_old_deals
      publish_deals
    end
    puts "Deals successfully updated"
  rescue => e
    puts "Deals not updated. Try again"
  end

  def unpublish_old_deals
    update_deals(@old_deals, :over)
  end

  def publish_deals
    update_deals(@present_deals, :published)
  end

  def update_deals(deals, state)
    deals.each do |deal|
      deal.update_state(state)
    end
  end

  def self.publish(date = Date.current)
    new(date).publish
  end
end
