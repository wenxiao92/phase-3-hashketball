# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
#helper method to find all players and their stats
def all_players
  game_hash[:home][:players] + game_hash[:away][:players]
end

def player_stats(player_name)
  all_players.find do |player| 
    player[:player_name] == player_name 
  end
end

def num_points_scored(player_name)
  player = player_stats(player_name)
  player[:points]
end

def shoe_size(player_name)
  player = player_stats(player_name)
  player[:shoe]
end

#helper method to find data regarding a team (when argument is the team name)
def find_team(team_name)
  team_info = game_hash.find do |innerArray, team_data| #innerArray is the next object after game_hash. team_data is the next array after innerArray
    team_data[:team_name] == team_name #compares each of the team to see which equals to team_name. Sets team_info to equal to that array
  end

  team_info[1] #team_info returns either home or array so we want to use [1] to get the innerArray
end 

def team_names
  game_hash.map do |innerArray, team_data| #using map method returns the data in an array.
  team_data[:team_name]
  end
end

def team_colors(team_name)
  team = find_team(team_name) #set team to equal the returned array
  team[:colors]
end

def player_numbers(team_name)
  playersInfo = find_team(team_name)
  playersInfo[:players].map do |player|
    player[:number]
  end
end

#helper method to find player with largest shoesize and returns the shoe size
def big_shoe_player
  all_players.max_by do |player|
    player[:shoe] #returns the array of info for the player with the max shoe size of 19
  end
end

def big_shoe_rebounds
  big_shoe_player[:rebounds]
end