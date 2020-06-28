class BlancParame < ApplicationRecord
  belongs_to :user

  mount_uploader :score_image, ImageUploader

  def self.input(deta)

    case deta[1]
    when "1" then
      attack = 5
      body = 6
      color = 5
      flavor = 7
      fruit_flavor = 8
      sweetness = 8
      acidity = 3
      taste = 5
    when "2" then
      attack = 5
      body = 5
      color = 5
      flavor = 5
      fruit_flavor = 5
      sweetness = 5
      acidity = 5
      taste = 5
    when "3" then
      attack = 7 
      body = 7
      color = 7
      flavor = 7
      fruit_flavor = 7
      sweetness = 7
      acidity = 7
      taste = 7
    when "4" then
      attack = 4
      body = 4
      color = 4
      flavor = 4
      fruit_flavor = 4
      sweetness = 4
      acidity = 4
      taste = 4
    when "5" then
      attack = 6
      body = 6
      color = 6
      flavor = 6
      fruit_flavor = 6
      sweetness = 6
      acidity = 6
      taste = 6
    end

    case deta[2]
    when "1" then
      fruit_flavor += 0.4
      sweetness += 0.4
    when "2" then
      flavor += 0.4
      fruit_flavor += 0.3
      sweetness += 0.3
      acidity -= 0.2
      taste -= 0.2
    when "3" then
    when "4" then
      sweetness -= 0.3
      acidity += 0.2
      taste += 0.2
    when "5" then
      body += 0.3
      sweetness -= 0.5
    end

    case deta[3]
    when "1" then
      attack -= 0.2
      body -= 0.2
    when "2" then
      fruit_flavor += 0.4
      sweetness += 0.6
      acidity -= 0.4
    when "3" then
      flavor += 0.2
    when "4" then
      flavor += 0.2
      fruit_flavor += 0.2
    when "5" then
      attack += 0.2
      body += 0.4
      color += 0.6
    end

    case deta[4]
    when "1" then
      sweetness += 0.4
      acidity -= 0.4
    when "2" then
      fruit_flavor -= 0.3
      sweetness -= 0.5
    when "3" then
      attack += 0.2
      body += 0.3
      color += 0.2
      flavor += 0.3
      fruit_flavor += 0.3
      acidity += 0.2
    when "4" then
      body -= 0.2
      taste += 0.3
    when "5" then
      fruit_flavor += 0.2
      sweetness -= 0.1
      acidity += 0.2
      taste += 0.2
    end

    case deta[5]
    when "1" then
    when "2" then
      attack -= 0.3
      body -= 0.3
      color -= 0.1
      flavor += 0.3
      fruit_flavor += 0.3
      sweetness += 0.3
      acidity += 0.3
      taste += 0.2
    when "3" then
      attack += 0.4
      body += 0.4
      color += 0.4
      flavor += 0.2
      fruit_flavor += 0.2
      acidity += 0.2
      taste += 0.4
    when "4" then
      body += 0.2
      flavor += 0.1
      fruit_flavor += 0.1
      acidity += 0.2
    when "5" then
      attack += 0.2
      body += 0.2
      color += 0.3
      fruit_flavor += 0.1
    end

    case deta[6]
    when "1" then
      attack -= 0.3
      body -= 0.2
      color += 0.2
      flavor += 0.3
      fruit_flavor += 0.2
      sweetness += 0.3
      acidity -= 0.2
      taste -= 0.1
    when "2" then
      sweetness -= 0.5
      acidity += 0.2
      taste -= 0.3
    when "3" then
      attack -= 0.2
      body -= 0.3
      color -= 0.2
      taste -= 0.3
    when "4" then
      attack += 0.4
      body += 0.2
      color += 0.2
      flavor += 0.2
      fruit_flavor += 0.3
      acidity += 0.2
      taste += 0.4
    when "5" then
      attack += 0.1
    end

    case deta[7]
    when "1" then
      flavor += 0.2
      fruit_flavor += 0.2
    when "2" then
      body -= 0.3
      color -= 0.2
      flavor += 0.3
      fruit_flavor += 0.1
      acidity += 0.2
      taste += 0.1
    when "3" then
      taste += 0.2
    when "4" then
      attack += 0.2
      body += 0.2
      taste += 0.3
    when "5" then
      acidity -= 0.2
    end

    case deta[8]
    when "1" then
      color += 0.2
      acidity += 0.3
      taste += 0.2
    when "2" then
      color += 0.2
      acidity += 0.3
      taste += 0.2
    when "3" then
      taste -= 0.2
    when "4" then
      fruit_flavor += 0.2
    when "5" then
      taste += 0.2
    end

    case deta[9]
    when "1" then
      body -= 0.1
      color -= 0.3
    when "2" then
      sweetness -= 0.1
    when "3" then
      body += 0.3
      color += 0.3
    when "4" then
      attack += 0.1
      body += 0.3
      sweetness -= 0.3
      taste += 0.3
    when "5" then
      body += 0.3
      fruit_flavor += 0.3
      sweetness -= 0.3
      taste += 0.3
    end

    case deta[10]
    when "1" then
      acidity -= 0.1
    when "2" then
      fruit_flavor += 0.2
      sweetness += 0.2
    when "3" then
      sweetness += 0.3
      taste += 0.3
    when "4" then
      sweetness += 0.2
    when "5" then
      flavor += 0.2
      acidity += 0.2
    end

    taste_params = {attack: attack,
                    body: body,
                    color: color,
                    flavor: flavor,
                    fruit_flavor: fruit_flavor,
                    sweetness: sweetness,
                    acidity: acidity,
                    taste: taste
                  }

    search = taste_params.keys
    search.each do |str|
      if taste_params[str] > 10
        taste_params[str] = 10
      elsif taste_params[str] < 1
        taste_params[str] = 1
      end
    end

    g = Gruff::Area.new 500
    g.title = "My Graph"
    g.theme_greyscale
    g.maximum_value = 10
    g.minimum_value = 0
    
    g.labels = {0 => 'attack',
                1 => 'body',
                2 => 'color',
                3 => 'flavor',
                4 => 'fruit_flavor',
                5 => 'sweetness',
                6 => 'acidity',
                7 => 'taste'
              }

    g.data :deta, taste_params.values
    # g.write("./app/assets/images/user_blanc_graph.png")
    g.write("./public/assets/images/user_blanc_graph.png")
    taste_params[:user_id] = deta[0].to_i
    return taste_params
  end
end
