# Introduction to Project
This is a Ruby on Rails API-only project. A simple crud implementation with postgresql.

# Usage Instructions (Production)

## Create
In Postman or any other API testing tool, make a **POST** request to `https://rails-crud-api-5y35.onrender.com/api/v1/friends` with the following JSON body:
```json
{
    "name": "John Doe",
    "phone": 1234567890,
    "github": "github.com/[username]",
    "email": "test@email.com",
    "hobby": "Coding",
    "location": "Earth"
}
```

You will recieve a response like this:
```json
{
    "status": "SUCCESS", 
    "message": "Friend was created successfully!", 
    "data": [
        {
            "name": "John Doe",
            "phone": 1234567890,
            "github": "github.com/[username]",
            "email": "test@email.com",
            "hobby": "Coding",
            "location": "Earth"
        }
    ]
}
```

## Read

### Read All

In Postman or any other API testing tool, make a **GET** request to `https://rails-crud-api-5y35.onrender.com/api/v1/friends` to get all friends.
You will receive a response like this:
```json
{
  "status": "SUCCESS",
  "message": "Fetched all the friends successfully",
  "data": [
    {
      "id": 1,
      "name": "Suvan GS",
      "phone": 8088424587,
      "github": "github.com/greeenboi",
      "email": "suvan.gowrishanker.204@gmail.com",
      "hobby": "Coding",
      "location": "Bangalore",
      "created_at": "2024-06-23T17:11:02.472Z",
      "updated_at": "2024-06-23T18:07:18.539Z"
    }
  ]
}
```
### Read One

In Postman or any other API testing tool, make a **GET** request to `https://rails-crud-api-5y35.onrender.com/api/v1/friends/1` to get a friend with id 1.
You will receive a response like this:

```json
{
  "data": {
    "id": 1,
    "name": "Suvan GS",
    "phone": 8088424587,
    "github": "github.com/greeenboi",
    "email": "suvan.gowrishanker.204@gmail.com",
    "hobby": "Coding",
    "location": "Bangalore",
    "created_at": "2024-06-23T17:11:02.472Z",
    "updated_at": "2024-06-23T18:07:18.539Z"
  }
}
```

## Update

In Postman or any other API testing tool, make a **PUT** request to `https://rails-crud-api-5y35.onrender.com/api/v1/friends/1` with the fields you want to update in the JSON body.


## Delete

In Postman or any other API testing tool, make a **DELETE** request to `https://rails-crud-api-5y35.onrender.com/api/v1/friends/1` to delete a friend with id 1.

# Deploy The APi Yourself

## Prerequisites
- Ruby 3.2.4
- Rails 7.0.1
- Postgresql (optional: you can change it to any other type)
- Postman (or any other API testing tool)

## Steps

1. Clone the repository
```bash
git clone https://github.com/greeenboi/rails_crud_api.git
```
or use git cli
```bash
gh repo clone greeenboi/rails_crud_api
```
2. Change remote to your repository

3. To Deploy to Render
   - Create a new web service on Render
   - Connect your repository
   - Uncomment the setup Db step in `./bin/render-build.sh`
   - Add the following environment variables:
     - RAILS_ENV: production
     - DATABASE_URL: postgres://[username]:[password]@[host]:[port]/[database_name]
     - SECRET_KEY_BASE: [your_secret_key_base]
   - Set the build command to `./bin/render-build.sh`
   - Set the start command to `bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}`
   - Deploy the service
4. Instead of Render you can also Dockerize the Application and run it directly too. Use the Docker Compuse up to automatically perform this.
5. Make sure to run the migrations and seed the database.
6. You can now use the API as mentioned in the Usage Instructions.

# Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

