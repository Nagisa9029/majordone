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
      tannin = 3
      astringency = 3
    when "2" then
      attack = 3
      body = 3
      color = 3
      flavor = 3
      fruit_flavor = 3
      bitterness = 3
      acidity = 3
      tannin = 3
      astringency = 3
    when "3" then
      attack = 3
      body = 3
      color = 3
      flavor = 3
      fruit_flavor = 3
      bitterness = 3
      acidity = 3
      tannin = 3
      astringency = 3
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
      attack -= 1
      body -= 1
      fruit_flavor += 1
    when "2" then
    when "3" then
    when "4" then
    when "5" then
    end

    case deta[3]
    when "1" then
      attack -= 1
      body -= 1
      tannin -= 1
      astringency -= 1
    when "2" then
      body -= 1
      tannin -= 1
      astringency -= 1
    when "3" then
    when "4" then
    when "5" then
      attack += 1
      body += 1
    end

    case deta[4]
    when "1" then
    when "2" then
    when "3" then
    when "4" then
      bitterness += 1
      astringency += 1
    when "5" then
      astringency -= 1
    end

    case deta[5]
    when "1" then
    when "2" then
    when "3" then
    when "4" then
      attack -= 1
      body -= 1
      color -= 1
      flavor += 1
      fruit_flavor += 1
      tannin -= 1
      astringency -= 1
    when "5" then
      attack += 2
      body += 2
      color += 2
      flavor += 1
      fruit_flavor += 2
      bitterness += 1
      acidity += 1
      tannin += 2
      astringency += 2
    end

    case deta[6]
    when "1" then
    when "2" then
    when "3" then
      attack -= 1
      body -= 1
    when "4" then
      attack += 1
      body += 1
    when "5" then
    end

    case deta[7]
    when "1" then
      attack -= 1
      body -= 1
      color -= 1
      flavor -= 1
      tannin -= 1
      astringency -= 1
    when "2" then
      attack -= 1
      body -= 1
      color -= 1
      flavor -= 1
      tannin -= 1
      astringency -= 1
    when "3" then
      attack += 1
      body += 2
      color += 2
      flavor += 2
      fruit_flavor += 2
      tannin += 2
      astringency += 2
    when "4" then
      attack += 1
      body += 2
      color += 2
      fruit_flavor += 2
      tannin += 1
      astringency += 2
    when "5" then
    end

    case deta[8]
    when "1" then
      color += 1
    when "2" then
      color += 1
    when "3" then
    when "4" then
      attack -= 1
      body -= 1
    when "5" then
      body += 1
      tannin += 1
    end

    case deta[9]
    when "1" then
      body -= 1
      color -= 1
      tannin -= 1
      astringency -= 1
    when "2" then
    when "3" then
    when "4" then
    when "5" then
      body += 1
      color += 1
      astringency += 1
    end

    case deta[10]
    when "1" then
    when "2" then
    when "3" then
    when "4" then
    when "5" then
      flavor += 1
      bitterness += 1
      acidity += 1
      astringency += 1
    end

    if attack > 10
      attack = 10
    elsif attack < 10
      attack = 0
    end
    if body > 10
      body = 10
    elsif body < 10
      body = 0
    end
    if color > 10
      color = 10
    elsif color < 10
      color = 0
    end
    if flavor > 10
      flavor = 10
    elsif flavor < 10
      flavor = 0
    end
    if fruit_flavor > 10
      fruit_flavor = 10
    elsif fruit_flavor < 10
      fruit_flavor = 0
    end
    if bitterness > 10
      bitterness = 10
    elsif bitterness < 10
      bitterness = 0
    end

    taste_params = {attack: attack,
                    body: body,
                    color: color,
                    flavor: flavor,
                    fruit_flavor: fruit_flavor,
                    bitterness: bitterness,
                    acidity: acidity,
                    tannin: tannin,
                    astringency: astringency,
                  }

    search = taste_params.keys
    search.each do |str|
      if taste_params[str] > 10
        taste_params[str] = 10
      elsif taste_params[str] < 0
        taste_params[str] = 0
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
