module DealsHelper
  extend ActiveSupport::Concern
  include LinkTool

  def link_to_add_images(class_name, form, association)
    add_file(class_name, form, association)
  end

  def show_first_image(deal)
    if deal.images.any?
      image_tag deal.images.first.attachment.url(:thumb)
    else
      image_tag 'no_image_found'
    end
  end

  def buy_deal(deal)
    if deal.quantity == 0
      content_tag :p, 'SOLD OUT'
    elsif deal.over?
      content_tag :p, 'Deal Over'
    else
      submit_tag "Buy", class: 'btn btn-success'
      # content_tag :p, deal.quantity
    end
  end

end
