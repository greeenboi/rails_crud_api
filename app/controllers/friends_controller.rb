class Api::V1::FriendsController < ApplicationController
  def index
    friends = Friend.all

    if friends
      render json: {status: "SUCCESS", message: "Fetched all the friends successfully", data: friends}, status: :ok
    else
      render json: friends.errors, status: :bad_request
    end
  end
end