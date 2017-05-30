class Dashboard < ActiveRecord::Base

  def self.user_information(user)
    output = {}
    most_common = find_repeating(user)
    most_common_gender = most_common.gender
    most_common_species = Race.find(most_common.race_id)
    count = Favourite.where(user_id: user.id).count
    output = {:most_common => most_common.name,
              :most_common_gender => most_common_gender,
              :most_common_species => most_common_species,
              :count => count}
  end

  def self.find_repeating(user)
    selection = Favourite.where(user_id: user.id).group(:peoples_id).having("count(*) > 1").count
    if selection == {}
      Peoples.find(34)
    else
      Peoples.find(selection.max_by{|k,v| v}[0])
    end
  end

  def self.find_youtube_links(most_common)
    options = {}
    options[:searchType] = "image"
    results = GoogleCustomSearchApi.search(most_common, options)
    if results.keys[0] == "error"
      result = "https://www.youtube.com/watch?v=_FLhO7ZnKHs"
    else
      result = results["items"][1]["image"]["contextLink"]
    end
  end

end
