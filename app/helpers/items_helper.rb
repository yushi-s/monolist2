module ItemsHelper
  def rakuten_image_tag(item)
    if item['mediumImageUrls'].first['imageUrl'].gsub('?_ex=128x128', '').present?
      image_tag(item['mediumImageUrls'].first['imageUrl'].gsub('?_ex=128x128', '') , alt: item['itemName'])
    else
      image_tag("no-image.png" , alt: item['itemName'])
    end
  end
end
