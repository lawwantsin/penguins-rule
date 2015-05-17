module OrdersHelper

  def clouds

    output = []

    sizes = [30, 40, 60, 100]
    number_of_clouds = (rand(13)+3)

    number_of_clouds.to_i.times do |num|

      # Randomize the cloud sizes
      cloud_size = sizes.sample
      width = cloud_size + rand(50).to_i
      left = rand(160).to_i    # some of screen right
      top = rand(70).to_i
      style = "width: #{width}px; top: #{top}px; left: #{left}%"

      output << image_tag('cloud.png', class:"cloud", style: style)

    end

    return output.join('')

  end

end
