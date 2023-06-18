# Project: Alkemy Disney API
# 📁 Collection: Users 


## End-point: Create User
### Method: POST
>```
>{{site}}/users
>```
### Body (**raw**)

```json
{
    "user": {
        "email": "toot@gmail.com",
        "password": "g00d_p4$$"
    }
}
```

### Response: 201
```json
{
    "id": 1,
    "email": "toot@gmail.com",
    "password_digest": "$2a$12$FNsLJtUde5HGHj2.yuE9TeTXP/PhhqtECB64f/cd.LWyJOfb1Z6f.",
    "created_at": "2023-06-18T18:44:58.307Z",
    "updated_at": "2023-06-18T18:44:58.307Z"
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Show User
### Method: GET
>```
>{{site}}/users/1
>```
### Response: 200
```json
{
    "id": 1,
    "email": "toot@gmail.com"
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Update User
### Method: PATCH
>```
>{{site}}/users/1
>```
### Body (**raw**)

```json
{
    "user": {
        "email": "example@gmail.com"
    }
}
```

### Response: 200
```json
{
    "email": "example@gmail.com",
    "id": 1,
    "password_digest": "$2a$12$FNsLJtUde5HGHj2.yuE9TeTXP/PhhqtECB64f/cd.LWyJOfb1Z6f.",
    "created_at": "2023-06-18T18:44:58.307Z",
    "updated_at": "2023-06-18T21:30:31.845Z"
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Delete User
### Method: DELETE
>```
>{{site}}/users/1
>```
### Response: 204
```json
null
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃
# 📁 Collection: Tokens 


## End-point: Create Token
### Method: POST
>```
>{{site}}/tokens
>```
### Body (**raw**)

```json
{
    "user": {
        "email": "toot@gmail.com",
        "password": "g00d_p4$$"
    }
}
```

### Response: 200
```json
{
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2ODcyMDA3Mjl9.ejT3j1pDf1tC4udz33tmBQxuCSZzch3fFqq1q6njXS0",
    "email": "toot@gmail.com"
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃
# 📁 Collection: Genres 


## End-point: All Genres
### Method: GET
>```
>{{site}}/genres
>```
### Response: 200
```json
[
    {
        "name": "Action",
        "picture": "action.jpg"
    },
    {
        "name": "Adventure",
        "picture": "adventure.jpg"
    },
    {
        "name": "Comedy",
        "picture": "comedy.jpg"
    },
    {
        "name": "Drama",
        "picture": "drama.jpg"
    },
    {
        "name": "Horror",
        "picture": "horror.jpg"
    },
    {
        "name": "Animation",
        "picture": "animation.jpg"
    },
    {
        "name": "Family",
        "picture": "family.jpg"
    }
]
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Show Genre
### Method: GET
>```
>{{site}}/genres/14
>```
### Response: 200
```json
{
    "id": 15,
    "name": "Family",
    "picture": "family.jpg"
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Create Genre
### Method: POST
>```
>{{site}}/genres
>```
### Body (**raw**)

```json
{
    "genre": {
        "picture": "documentary.jpg",
        "name": "Documentary"
    }
}
```

### Response: 201
```json
{
    "id": 16,
    "name": "Documentary",
    "picture": "documentary.jpg"
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Update Genre
### Method: PATCH
>```
>{{site}}/genres/16
>```
### Body (**raw**)

```json
{
    "genre": {
        "picture": "documental.jpg",
        "name": "Documental"
    }
}
```

### Response: 200
```json
{
    "id": 16,
    "name": "Documental",
    "picture": "documental.jpg"
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Delete Genre
### Method: DELETE
>```
>{{site}}/genres/16
>```
### Response: 204
```json
null
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃
# 📁 Collection: Movies 


## End-point: Search Movie by Title
### Method: GET
>```
>{{site}}/movies?title=lion
>```
### Query Params

|Param|value|
|---|---|
|title|lion|


### Response: 200
```json
[
    {
        "picture": "the_lion_king.jpg",
        "title": "The Lion King",
        "release_date": "15/06/1994"
    },
    {
        "picture": "the_lion_guard.jpg",
        "title": "The Lion Guard",
        "release_date": "15/01/2016"
    }
]
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Search Movie by Genre
### Method: GET
>```
>{{site}}/movies?genre_id=10
>```
### Query Params

|Param|value|
|---|---|
|genre_id|10|


### Response: 200
```json
[
    {
        "picture": "the_lion_king.jpg",
        "title": "The Lion King",
        "release_date": "15/06/1994"
    },
    {
        "picture": "aladdin.jpg",
        "title": "Aladdin",
        "release_date": "25/11/1992"
    },
    {
        "picture": "frozen.jpg",
        "title": "Frozen",
        "release_date": "27/11/2013"
    },
    {
        "picture": "toy_story.jpg",
        "title": "Toy Story",
        "release_date": "22/11/1995"
    }
]
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Order Movies by Release ASC
### Method: GET
>```
>{{site}}/movies?order=ASC
>```
### Query Params

|Param|value|
|---|---|
|order|ASC|


### Response: 200
```json
[
    {
        "picture": "aladdin.jpg",
        "title": "Aladdin",
        "release_date": "25/11/1992"
    },
    {
        "picture": "the_lion_king.jpg",
        "title": "The Lion King",
        "release_date": "15/06/1994"
    },
    {
        "picture": "toy_story.jpg",
        "title": "Toy Story",
        "release_date": "22/11/1995"
    },
    {
        "picture": "finding_nemo",
        "title": "Finding Nemo",
        "release_date": "30/05/2003"
    },
    {
        "picture": "the_incredibles",
        "title": "The Incredibles",
        "release_date": "27/10/2004"
    },
    {
        "picture": "frozen.jpg",
        "title": "Frozen",
        "release_date": "27/11/2013"
    },
    {
        "picture": "the_lion_guard.jpg",
        "title": "The Lion Guard",
        "release_date": "15/01/2016"
    },
    {
        "picture": "coco.jpg",
        "title": "Coco",
        "release_date": "20/10/2017"
    }
]
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Order Movies by Release DESC
### Method: GET
>```
>{{site}}/movies?order=DESC
>```
### Query Params

|Param|value|
|---|---|
|order|DESC|


### Response: 200
```json
[
    {
        "picture": "coco.jpg",
        "title": "Coco",
        "release_date": "20/10/2017"
    },
    {
        "picture": "the_lion_guard.jpg",
        "title": "The Lion Guard",
        "release_date": "15/01/2016"
    },
    {
        "picture": "frozen.jpg",
        "title": "Frozen",
        "release_date": "27/11/2013"
    },
    {
        "picture": "the_incredibles",
        "title": "The Incredibles",
        "release_date": "27/10/2004"
    },
    {
        "picture": "finding_nemo",
        "title": "Finding Nemo",
        "release_date": "30/05/2003"
    },
    {
        "picture": "toy_story.jpg",
        "title": "Toy Story",
        "release_date": "22/11/1995"
    },
    {
        "picture": "the_lion_king.jpg",
        "title": "The Lion King",
        "release_date": "15/06/1994"
    },
    {
        "picture": "aladdin.jpg",
        "title": "Aladdin",
        "release_date": "25/11/1992"
    }
]
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: All Movies
### Method: GET
>```
>{{site}}/movies
>```
### Headers

|Content-Type|Value|
|---|---|
|Authorization|{{jwt_token}}|


### Response: 200
```json
[
    {
        "picture": "the_lion_king.jpg",
        "title": "The Lion King",
        "release_date": "15/06/1994"
    },
    {
        "picture": "aladdin.jpg",
        "title": "Aladdin",
        "release_date": "25/11/1992"
    },
    {
        "picture": "frozen.jpg",
        "title": "Frozen",
        "release_date": "27/11/2013"
    },
    {
        "picture": "toy_story.jpg",
        "title": "Toy Story",
        "release_date": "22/11/1995"
    },
    {
        "picture": "nemo.jpg",
        "title": "Finding Nemo",
        "release_date": "20/05/2003"
    },
    {
        "picture": "coco.jpg",
        "title": "Coco",
        "release_date": "20/10/2017"
    }
]
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Show Movie
### Method: GET
>```
>{{site}}/movies/6
>```
### Response: 200
```json
{
    "id": 3,
    "picture": "the_lion_king.jpg",
    "title": "The Lion King",
    "release_date": "15/06/1994",
    "raiting": 8,
    "genre_id": "Adventure",
    "cast": [
        {
            "id": 2,
            "picture": "simba.jpg",
            "name": "simba",
            "age": 2,
            "weight": 50,
            "story": "Simba is the main protagonist of The Lion King",
            "created_at": "2023-06-15T20:11:59.849Z",
            "updated_at": "2023-06-15T20:11:59.849Z",
            "movie_id": 3
        },
        {
            "id": 4,
            "picture": "pumba.jpg",
            "name": "pumba",
            "age": 20,
            "weight": 150,
            "story": "Pumba is lovable warthog and best friend of Timon in The Lion King",
            "created_at": "2023-06-15T20:52:45.014Z",
            "updated_at": "2023-06-15T20:52:45.014Z",
            "movie_id": 3
        }
    ]
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Create Movie
### Method: POST
>```
>{{site}}/movies
>```
### Body (**raw**)

```json
{
    "movie": {
        "picture": "beauty_beast.jpg",
        "title": "Beauty and the Beast",
        "release_date": "12/11/1991",
        "raiting": 8.0,
        "genre_id": 14
    }
}


```

### Response: 201
```json
{
    "id": 10,
    "picture": "finding_nemo",
    "title": "Finding Nemo",
    "release_date": "30/05/2003",
    "raiting": 8,
    "genre_id": "Family",
    "cast": []
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Update Movie
### Method: PATCH
>```
>{{site}}/movies/11
>```
### Body (**raw**)

```json
{
    "movie": {
        "picture": "moana.jpg"
    }
}
```

### Response: 200
```json
{
    "id": 11,
    "picture": "moana.jpg",
    "title": "Moana",
    "release_date": "23/11/2016",
    "raiting": 7,
    "genre_id": "Family",
    "cast": []
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Delete Movie
### Method: DELETE
>```
>{{site}}/movies/11
>```
### Response: 204
```json
null
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃
# 📁 Collection: Characters 


## End-point: Search Character by Name
### Method: GET
>```
>{{site}}/characters?name=mouse
>```
### Query Params

|Param|value|
|---|---|
|name|mouse|


### Response: 200
```json
[
    {
        "picture": "mickey.jpg",
        "name": "Mickey Mouse"
    },
    {
        "picture": "minnie.jpg",
        "name": "Minnie Mouse"
    }
]
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Search Character by Age
### Method: GET
>```
>{{site}}/characters?age=25
>```
### Query Params

|Param|value|
|---|---|
|age|25|


### Response: 200
```json
[
    {
        "picture": "beast.jpg",
        "name": "Beast"
    }
]
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Search Character by Movie
### Method: GET
>```
>{{site}}/characters?movie_id=3
>```
### Query Params

|Param|value|
|---|---|
|movie_id|3|


### Response: 200
```json
[
    {
        "picture": "simba.jpg",
        "name": "simba"
    },
    {
        "picture": "pumba.jpg",
        "name": "pumba"
    }
]
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: All Characters
### Method: GET
>```
>{{site}}/characters
>```
### Response: 200
```json
[
    {
        "picture": "simba.jpg",
        "name": "simba"
    },
    {
        "picture": "pumba.jpg",
        "name": "pumba"
    },
    {
        "picture": "aladdin_ch.jpg",
        "name": "Aladdin - Prince Ali"
    }
]
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Show Character
### Method: GET
>```
>{{site}}/characters/2
>```
### Response: 200
```json
{
    "id": 2,
    "picture": "simba.jpg",
    "name": "simba",
    "age": 2,
    "weight": 50,
    "story": "Simba is the main protagonist of The Lion King",
    "movies": "The Lion King"
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Create Character
### Method: POST
>```
>{{site}}/characters
>```
### Body (**raw**)

```json
{
    "character": {
        "picture": "minnie.jpg",
        "name": "Minnie Mouse",
        "age": 90,
        "weight": 110.0,
        "story": "Minnie is Mickey's loyal and loving girlfriend who often joins him on his adventures",
        "movie_id": 13
    }
}
```

### Response: 201
```json
{
    "id": 6,
    "picture": "dory.jpg",
    "name": "Dory",
    "age": 30,
    "weight": 150,
    "story": "Dory is a friendly and forgetful blue tang fish in Finding Nemo",
    "movies": "Finding Nemo"
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Update Character
### Method: PATCH
>```
>{{site}}/characters/3
>```
### Body (**raw**)

```json
{
    "character": {
        "name": "Aladdin",
        "picture": "aladdin.jpg"
    }
}
```

### Response: 200
```json
{
    "id": 3,
    "picture": "aladdin.jpg",
    "name": "Aladdin",
    "age": 18,
    "weight": 70,
    "story": "Aladdin is a street urchin who becomes a prince with the help of a magical genie",
    "movies": "Aladdin"
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Delete Character
### Method: DELETE
>```
>{{site}}/characters/7
>```
### Response: 204
```json
null
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃
_________________________________________________
Powered By: [postman-to-markdown](https://github.com/bautistaj/postman-to-markdown/)
