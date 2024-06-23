class Api::V1::FriendsController < ApplicationController
  def index
    friends = Friend.all

    if friends
      render json: {status: "SUCCESS", message: "Fetched all the friends successfully", data: friends}, status: :ok
    else
      render json: friends.errors, status: :bad_request
    end
  end

  def create
    friend = Friend.new(friend_params)

    if friend.save
      render json: {status: "SUCCESS", message: "Friend was created successfully!", data: friend}, status: :created
    else
      render json: friend.errors, status: :unprocessable_entity
    end
  end

  # Show a specific friend GET request
  def show
    friend = Friend.find(params[:id])

    if friend
      render json: {data: friend}, status: :ok
    else
      render json: {message: "Friend could not be found"}, status: :bad_request
    end
  end

  # Delete a specific friend DELETE request
  def destroy
    friend = Friend.find(params[:id])

    if friend.destroy!
      render json: {message: "Friend was deleted successfully"}, status: :ok
    else
      render json: {message: "Friend does not exist"}, status: :bad_request
    end
  end

  # Update details for a specific friend. PATCH request
  def update
    friend = Friend.find(params[:id])

    if friend.update!(friend_params)
      render json: {message: "Friend was updated successfully", data: friend}, status: :ok
    else
      render json: {message: "Friend cannot be updated"}, status: :unprocessable_entity
    end
  end

  private

  def friend_params
    params.require(:friend).permit(:name, :phone, :github, :email, :hobby, :location)
  end

end