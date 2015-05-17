module OrdersHelper

  def clouds
    output = []
    rand(10).to_i.times do |num|
      size = ['big', 'medium', 'small'].sample
      output << image_tag('cloud.png', id: "cloud_#{num}", class:"cloud #{size}-cloud")
    end
    return output.join('')
  end

end
