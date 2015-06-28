# Komic API
Reference this API documention as necessary.  It details all available endpoints with path parameters and HTTP request verbs.  Have fun!
##User Register
	New users must provide an email, username and password. They will be granted an access_token upon registration which must then be passed in the header for all future requests. 
* Path: `POST '/users/register'`
* Params:
  * email: string
  * password: string
  * username: string
* Response:
  * Status Code: 201 if successful, 422 if unsuccessful
  * Example success:
  
  ``` 
    {
  "user": {
    "id": 1,
    "username": "tjterris",
    "email": "tjterris@email.com",
    "access_token": "c4483f576226dbb213074bfa207412a1"
  }
}
   
   ```
  * Example Failure:
  
  ```
  {
  "errors": [
    "Email has already been taken",
    "Username has already been taken"
  ]
}
```

##User Login
* Path: `POST '/users/login'`
* Params:
  * password: a string
  * username: a string
* Response:
  * Status Code: 201 if successful, 404 if not found
  * Example success:
  
  ``` 
	  {
  "user": {
    "id": 1,
    "username": "tjterris",
    "email": "tjterris@gmail.com",
    "access_token": "c4483f576226dbb213074bfa207412a1"
  }
}
  
  ```
  * Example failure: 
  
  ```
  	{
  "message": "No matching username or password found."
}
  ```

##Show User
* Path: `GET '/user/:id'`
* Params:
  * id: a string (ID of user)
* Response:
  *Example success: 
 
  ``` 
  {
  "user": {
    "id": 1,
    "username": "tjterris",
    "email": "tjterris@gmail.com"
  }
}
  
  ```

##Show All Users (Index)
* Path: `GET '/users'`
* Params: none
* Response
  *Example Response:
  
  ``` 
  {
  "users": [
    {
      "id": 1,
      "username": "tjterris",
      "email": "tjterris@gmail.com"
    },
    {
      "id": 2,
      "username": "afranco",
      "email": "afranco@gmail.com"
    },
    {
      "id": 3,
      "username": "twatts",
      "email": "twatts@gmail.com"
    }
  ]
}
  ```




## Create Image

* Path: ` POST '/images' ` 
* Params: 
  * image_url: "string"
  * user_id: "integer"
  * strip_id: "integer"
  * ios: "integer"
* Response:
  * Status Code: 200 if successful, 422 if unsuccessful
  * Example success: 

``` 
{
  "image": {
    "id": 1,
    "image_url": "http://blog.ghost.org/content/images/2015/03/markdown-guide-1.jpg",
    "user_id": 1
    "strip_id": 1
    "ios:" 1
    "created_at": "2015-06-19T15:12:38.162Z",
    "updated_at": "2015-06-19T15:12:38.162Z"
  }
}
```

## Show Image

* Path: ` GET '/images/:id' `
* Params: 
  * id: "integer"
* Response:
  * Status Code: 200 if successful
  * Example success:

```
{
  "image": {
    "id": 1,
    "image_url": "http://blog.ghost.org/content/images/2015/03/markdown-guide-1.jpg",
    "user_id": 1
    "strip_id": 1
    "ios:" 1
    "created_at": "2015-06-19T15:12:38.162Z",
    "updated_at": "2015-06-19T15:12:38.162Z"
  }
}
```

## Show Image(s) w/ Accessories
This endpoint shows only images that have had accessories added and been saved.

* Path: ` GET '/images/edits' `
* Params: none
* Response
    * Status Code: 200 if successful
    * Example success:

``` 
{
  "strip": {
    "id": 1,
    "name": "Comic Gallrey",
    "strip_url": "www.test.com",
    "created_at": "2015-06-28T16:43:37.350Z",
    "updated_at": "2015-06-28T16:45:20.864Z"
  },
  "image": [
    {
      "id": 1,
      "image_url": "https://comicbookish.s3.amazonaws.com/myImage_1435449153.49107.png",
      "created_at": "2015-06-27T23:52:34.971Z",
      "updated_at": "2015-06-28T16:44:11.794Z",
      "strip_id": 1,
      "ios": 1,
      "user_id": 2
    },
    {
      "id": 2,
      "image_url": "https://comicbookish.s3.amazonaws.com/myImage_1435449203.15627.png",
      "created_at": "2015-06-27T23:53:24.412Z",
      "updated_at": "2015-06-28T16:44:20.140Z",
      "strip_id": 1,
      "ios": 1,
      "user_id": 1
    },

  ]
}
```
## Show Accessories
* Path: ` GET '/accessories' `
* Params: none
* Response
    * Status Code: 200 if successful
    * Example success:

```
[
  {
    "id": 12,
    "accessory_type": "symbol",
    "name": "hands",
    "accessory_url": "http://i.imgur.com/LpatKDM.png",
    "created_at": "2015-06-27T21:08:31.483Z",
    "updated_at": "2015-06-27T21:08:31.483Z"
  },
  ]
``` 
  