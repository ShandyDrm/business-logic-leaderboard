require 'sinatra'
require 'sinatra/json'
require 'json'

require_relative 'requests/data_game_leaderboard'

get '/leaderboards' do
  response_body, response_code = DataLeaderboard.get_leaderboards(params)
  halt response_code, json(response_body)
end

get '/leaderboards/:id' do
  leaderboard_id = params[:id]

  response_body, response_code = DataLeaderboard.get_leaderboard(leaderboard_id)
  halt response_code, json(response_body)
end

post '/leaderboards' do
  json_leaderboard = JSON.parse(request.body.read)

  response_body, response_code = DataLeaderboard.create_leaderboard(json_leaderboard)
  halt response_code, json(response_body)
end

patch '/leaderboards/:id' do
  leaderboard_id = params[:id]
  json_leaderboard = JSON.parse(request.body.read)

  response_body, response_code = DataLeaderboard.update_leaderboard(leaderboard_id, json_leaderboard)
  halt response_code, json(response_body)
end

delete '/leaderboards/:id' do
  leaderboard_id = params[:id]

  response_body, response_code = DataLeaderboard.delete_leaderboard(leaderboard_id)
  halt response_code, json(response_body)
end
