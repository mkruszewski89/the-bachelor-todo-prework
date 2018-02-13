require "pry"

def get_first_name_of_season_winner(data, season)
  return_value = "error"
  data.each {|season_key, season_value|
    if season_key == season
      season_value.each {|contestant_hash|
        if contestant_hash.values.include? "Winner"
          return_value = contestant_hash["name"].split(/ /).first
        end
      }
    end
  }
  return_value
end

def get_contestant_name(data, occupation)
  return_value = "error"
  data.each {|season_key, season_value|
    season_value.each {|contestant_hash|
      if contestant_hash.values.include? occupation
        return_value = contestant_hash["name"]
      end
    }
  }
  return_value
end

def count_contestants_by_hometown(data, hometown)
  return_value = 0
  data.each {|season_key, season_value|
    season_value.each {|contestant_hash|
      if contestant_hash.values.include? hometown
        return_value += 1
      end
    }
  }
  return_value
end

def get_occupation(data, hometown)
  return_value = "error"
  data.each {|season_key, season_value|
    season_value.each {|contestant_hash|
      if contestant_hash.values.include? hometown
        return_value = contestant_hash["occupation"]
        break
      end
    }
  }
  return_value
end

def get_average_age_for_season(data, season)
  return_value = "error"
  total_age = 0
  total_contestants = 0
  data.each {|season_key, season_value|
    if season_key == season
      season_value.each {|contestant_hash|
        total_age += contestant_hash["age"].to_f
        total_contestants += 1
      }
    end
  }
  return_value = (total_age/total_contestants).round
end
