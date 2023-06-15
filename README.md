# Project: Alkemy Disney API
# 📁 Collection: Characters 


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
        "picture": "aladdin_ch.jpg",
        "name": "Aladdin"
    }
]
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Show Character
### Method: GET
>```
>http://localhost:3000/api/v1/characters/3
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
{ "character": {
        "picture": "timon.jpg",
        "name": "timon",
        "age": 18,
        "weight": 120.0,
        "story": "Timon is a funny meerkat and best friend of Pumba in The Lion King",
        "movie_id": 3
    } 
}

```

### Response: 201
```json
{
    "id": 5,
    "picture": "timon.jpg",
    "name": "timon",
    "age": 18,
    "weight": 120,
    "story": "Timon is a funny meerkat and best friend of Pumba in The Lion King",
    "movies": "The Lion King"
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
        "name": "Aladdin - Prince Ali"
    }
}
```

### Response: 200
```json
{
    "id": 3,
    "picture": "aladdin_ch.jpg",
    "name": "Aladdin - Prince Ali",
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
>{{site}}/characters/5
>```
### Response: 204
```json
null
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃
# 📁 Collection: Movies 


## End-point: All Movies
### Method: GET
>```
>{{site}}/movies
>```
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
>{{site}}/movies/3
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
        "name": "The Incredibles",
        "release_date": "27/10/2004",
        "raiting": 8.0,
        "genre_id": 15,
        "picture": "the_incredibles"
    }
}
```

### Response: 201
```json
{
    "id": 9,
    "picture": "the_incredibles",
    "title": null,
    "release_date": "27/10/2004",
    "raiting": 8,
    "genre_id": "Family",
    "cast": []
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Update Movie
### Method: PATCH
>```
>{{site}}/movies/9
>```
### Body (**raw**)

```json
{
    "movie": {
        "title": "The Incredibles"
    }
}
```

### Response: 200
```json
{
    "id": 9,
    "picture": "the_incredibles",
    "title": "The Incredibles",
    "release_date": "27/10/2004",
    "raiting": 8,
    "genre_id": "Family",
    "cast": []
}
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃

## End-point: Delete Movie
### Method: DELETE
>```
>{{site}}/movies/7
>```
### Response: 204
```json
null
```


⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃ ⁃
_________________________________________________
Powered By: [postman-to-markdown](https://github.com/bautistaj/postman-to-markdown/)
