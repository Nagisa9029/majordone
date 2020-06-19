class RougeParame < ApplicationRecord
  belongs_to :user

  mount_uploader :score_image, ImageUploader

  def self.input(deta)

    case deta[1]
    when "1" then
      attack = 4
      body = 4
      color = 5
      flavor = 5
      fruit_flavor = 7
      bitterness = 4
      acidity = 4
      tannin = 4
      astringency = 4
    when "2" then
      attack = 4
      body = 4
      color = 4
      flavor = 4
      fruit_flavor = 4
      bitterness = 4
      acidity = 4
      tannin = 4
      astringency = 4
    when "3" then
      attack = 4
      body = 4
      color = 4
      flavor = 4
      fruit_flavor = 4
      bitterness = 4
      acidity = 4
      tannin = 4
      astringency = 4
    when "4" then
      attack = 7
      body = 7
      color = 7
      flavor = 7
      fruit_flavor = 7
      bitterness = 7
      acidity = 7
      tannin = 6
      astringency = 6
    when "5" then
      attack = 6
      body = 6
      color = 6
      flavor = 6
      fruit_flavor = 6
      bitterness = 6
      acidity = 6
      tannin = 6
      astringency = 6
    end

    case deta[2]
    when "1" then
      attack -= 0.4
      body -= 0.4
      fruit_flavor += 0.4
    when "2" then
    when "3" then
    when "4" then
    when "5" then
    end

    case deta[3]
    when "1" then
      attack -= 0.4
      body -= 0.2
      tannin -= 0.2
      astringency -= 0.2
    when "2" then
      body -= 0.2
      tannin -= 0.2
      tannin -= 0.2
      astringency -= 0.2
    when "3" then
      flavor += 0.2
    when "4" then
    when "5" then
      attack += 0.2
      body += 0.2
    end

    case deta[4]
    when "1" then
      body -= 0.2
      fruit_flavor += 0.2
      tannin -= 0.2
      astringency -= 0.2
    when "2" then
    when "3" then
      attack += 0.2
      body += 0.2
      color += 0.2
    when "4" then
      bitterness += 0.2
      astringency += 0.2
    when "5" then
      astringency -= 0.2
    end

    case deta[5]
    when "1" then
    when "2" then
    when "3" then
    when "4" then
      attack -= 0.4
      body -= 0.3
      color -= 0.3
      flavor += 0.2
      fruit_flavor += 0.1
      bitterness -= 0.2
      tannin -= 0.3
      astringency -= 0.2
    when "5" then
      attack += 0.4
      body += 0.5
      color += 0.5
      flavor += 0.2
      fruit_flavor += 0.2
      bitterness += 0.2
      acidity += 0.2
      tannin += 0.5
      astringency += 0.5
    end

    case deta[6]
    when "1" then
      attack += 0.1
      body += 0.3
      color += 0.2
      fruit_flavor += 0.2
    when "2" then
      attack += 0.2
      fruit_flavor += 0.2
      bitterness += 0.2
      acidity += 0.2
    when "3" then
      attack -= 0.3
      body -= 0.2
    when "4" then
      attack += 0.3
      body += 0.2
      color += 0.4
    when "5" then
      body += 0.1
      fruit_flavor += 0.1
    end

    case deta[7]
    when "1" then
      attack -= 0.3
      body -= 0.3
      color -= 0.4
      flavor -= 0.1
      fruit_flavor += 0.2
      bitterness -= 0.1
      tannin -= 0.2
      astringency -= 0.2
    when "2" then
      attack -= 0.3
      body -= 0.2
      color -= 0.2
      flavor -= 0.1
      fruit_flavor += 0.2
      tannin -= 0.2
      astringency -= 0.2
    when "3" then
      attack += 0.3
      body += 0.4
      color += 0.2
      flavor += 0.5
      fruit_flavor += 0.3
      acidity -= 0.2
      tannin += 0.4
      astringency += 0.4
    when "4" then
      attack += 0.4
      body += 0.4
      color += 0.4
      flavor += 0.2
      fruit_flavor += 0.4
      tannin += 0.3
      astringency += 0.3
    when "5" then
    end

    case deta[8]
    when "1" then
      color += 0.2
    when "2" then
      color += 0.2
    when "3" then
      tannin -= 0.2
    when "4" then
      attack -= 0.2
      body -= 0.1
    when "5" then
      body += 0.2
      tannin += 0.2
    end

    case deta[9]
    when "1" then
      body -= 0.4
      color -= 0.2
      tannin -= 0.4
      astringency -= 0.2
    when "2" then
    when "3" then
    when "4" then
    when "5" then
      body += 0.2
      color += 0.3
      astringency += 0.2
    end

    case deta[10]
    when "1" then
      bitterness -= 0.3
      acidity -= 0.1
      tannin -= 0.2
      astringency -= 0.2
    when "2" then
      fruit_flavor += 0.2
    when "3" then
    when "4" then
    when "5" then
      flavor += 0.3
      bitterness += 0.3
      acidity += 0.2
      astringency += 0.2
    end

    taste_params = {attack: attack,
                    body: body,
                    color: color,
                    flavor: flavor,
                    fruit_flavor: fruit_flavor,
                    bitterness: bitterness,
                    acidity: acidity,
                    tannin: tannin,
                    astringency: astringency
                  }

    search = taste_params.keys
    search.each do |str|
      if taste_params[str] > 10
        taste_params[str] = 10
      elsif taste_params[str] < 0
        taste_params[str] = 0
      end
    end

    g = Gruff::Area.new 800
    g.title = "My Graph"
    g.theme_greyscale
    g.maximum_value = 10
    g.minimum_value = 0
    
    g.labels = {0 => 'attack',
                1 => 'body',
                2 => 'color',
                3 => 'flavor',
                4 => 'fruit_flavor',
                5 => 'bitterness',
                6 => 'acidity',
                7 => 'tannin',
                8 => 'astringency'
              }

    g.data :deta, taste_params.values
    g.write("./app/assets/images/user_rouge_graph.png")

    taste_params[:user_id] = deta[0].to_i
    return taste_params
  end
end
