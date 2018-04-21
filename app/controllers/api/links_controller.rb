class Api::LinksController < ApplicationController
  def index
    authorization = request.headers["Authorization" ]
    user = User.find_by(api_key: authorization.split.last)
    if user
      render(json: user.links)
    else
     render(status: 401, json: { error: "Unauthorized" })
    end
  end

  def create
    render(json: {}, status: 200)
  end
end
