<p align="center">
<img src=https://drive.google.com/uc?export=view&id=1XOqik5P0CnPdmt452a-BoI_Jj6cTYeL1 alt="Banner">
</p>
<h3 align="center">Alkemy Backend Challenge - Ruby on Rails</h3>

---

<p align="center">Resolucion del antiguo challenge de alkemy para la acceleracion de Ruby on Rails, el objetivo de este challenge es desarrollar una API para explorar el mundo Disney, la cual permitira conocer y modificar los personajes que lo componen y entender en que peliculas participaron. Por otro lado, debera exponer la informacion para que cualquier frontend pueda consumirla.
<br> 
</p>

---

## 📝 Tabla de Contenidos
- [Funcionalidades](#features)
- [Modelado de la Base de Datos](#database)
- [Instalación/Ejecucion](#getting_started)
- [Uso de la API](#api_usage)
- [Endpoints API](#api_endpoints)
    - [Users](#api_users)
    - [Tokens](#api_tokens)
    - [Genre](#api_genre)
    - [Movies](#api_movies)
        - [Movies Search](#api_movies_search)
        - [Movies CRUD](#api_movies_search)
    - [Characters](#api_characters)
        - [Characters Search](#api_characters_search)
        - [Characters CRUD](#api_characters_crud)
- [Rspec Testing](#testing)
- [Tecnologias](#tech_stack)
- [Documentacion Postman](#postman)
- [Autor](#authors)

## 🧐 Funcionalidades <a name = "features"></a>

- Autenticación de usuarios mediante un Json Web Token
- Usuarios (Users): Endpoints Create, Read, Update, Delete
- Tokens (Tokens): Endpoints Create
- Generos (Genre): Endpoints Index, Create, Read, Update, Delete
- Peliculas (Movies): Endpoints Index, Create, Read, Update, Delete
    - Busqueda por params querys: title, id_genre, order 
- Personajes (Characters): Endpoints Index, Create, Read, Update, Delete
    - Busqueda por params querys: name, age, id_movie 

## 💾 Modelo <a name = "database"></a>
<br>

Placeholder
<!-- ![modelo](https://drive.google.com/uc?export=view&id=15WpnYT1KBapNUwiOu8AQeY1SiPOBGN91) -->

## 🏁 Instalación/Ejecución <a name = "getting_started"></a>

Asegúrate de tener instalado lo siguiente en tu sistema:

- Ruby (versión 3.1.2)
- Ruby on Rails (versión 7.0.4)
- PostgreSQL

Clonar el repositorio

```bash
git clone git@github.com:Mettralla/old_alkemy_challenge_disney_api.git
```

Ir al directorio del proyecto

```bash
cd old_alkemy_challenge_disney_api
```

Instalar dependencias

```bash
bundle install
```

Configuración de la base de datos

Antes de ejecutar la aplicación, asegúrate de configurar la conexión a tu base de datos PostgreSQL.

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <%= ENV["USER"] %> # ASIGNAR ENV_VARIABLE O INGRESAR USER
  password: <%= ENV["DATABASE_PASSWORD"] %> # ASIGNAR ENV_VARIABLE O INGRESAR PASSWORD
```

Crear base de datos

```bash
rake db:create
```
Realizar migraciones

```bash
rails db:migrate
```
Iniciar server

```bash
rails server
```
El servidor estara corriendo en localhost:3000, sin embargo este proyecto no cuenta con un frontend.

## 🏁 Usar la API <a name = "api_usage"></a>

Para tener libre acceso a los endpoints necesitaras crear un usuario y loguearte para generar un token de acceso.

**Crear un usuario:**

Para crear el usuario necesitas enviar un json con un email y un password mediante un POST request.

request: POST

>```
>http://localhost:3000/api/v1/users
>```

body(raw): "Content-type:application/json"
```json
{
    "user": {
        "email": "toot@gmail.com",
        "password": "g00d_p4$$"
    }
}
```

Esto devolvera un status 201 junto al registro creado.

**Generar token:**

Para generar el token necesitas enviar un json con el email y el password del usuario creado mediante un POST request.

request: POST

>```
>http://localhost:3000/api/v1/tokens
>```

body(raw): "Content-type:application/json"
```json
{
    "user": {
        "email": "toot@gmail.com",
        "password": "g00d_p4$$"
    }
}
```

Response: 200 OK
```json
{
    "token": "jwt_token",
    "email": "toot@gmail.com"
}
```

Adjuntando el jwt_token en los headers de tus consultas seras capaz de operar con todos los endpoints de la API:


```header
Authorization: <jwt_token>
```

## API Endpoints <a name = "api_endpoints"></a>
## 📁 Collection: Users <a name = "api_users"></a>

## End-point: Create User
### Method: POST
>```
>http://localhost:3000/api/v1/users
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

## End-point: Show User
### Method: GET
>```
>http://localhost:3000/api/v1/users/1
>```
### Response: 200
```json
{
    "id": 1,
    "email": "toot@gmail.com"
}
```

## End-point: Update User
### Method: PATCH
>```
>http://localhost:3000/api/v1/users/1
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

## End-point: Delete User
### Method: DELETE
>```
>http://localhost:3000/api/v1/users/1
>```
### Response: 204
```json
null
```

## 📁 Collection: Tokens <a name = "api_tokens"></a>

## End-point: Create Token
### Method: POST
>```
>http://localhost:3000/api/v1/tokens
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
    "token": "jwt_token",
    "email": "toot@gmail.com"
}
```

## 📁 Collection: Genres <a name = "api_genres"></a>


## End-point: All Genres
### Method: GET
>```
>http://localhost:3000/api/v1/genres
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

## End-point: Show Genre
### Method: GET
>```
>http://localhost:3000/api/v1/genres/14
>```
### Response: 200
```json
{
    "id": 15,
    "name": "Family",
    "picture": "family.jpg"
}
```

## End-point: Create Genre
### Method: POST
>```
>http://localhost:3000/api/v1/genres
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

## End-point: Update Genre
### Method: PATCH
>```
>http://localhost:3000/api/v1/genres/16
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

## End-point: Delete Genre
### Method: DELETE
>```
>http://localhost:3000/api/v1/genres/16
>```
### Response: 204
```json
null
```
## 📁 Collection: Movies <a name = "api_movies"></a>


## End-point: Search Movie by Title <a name = "api_movies_search"></a>
### Method: GET
>```
>http://localhost:3000/api/v1/movies?title=lion
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

## End-point: Search Movie by Genre
### Method: GET
>```
>http://localhost:3000/api/v1/movies?genre_id=10
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

## End-point: Order Movies by Release ASC
### Method: GET
>```
>http://localhost:3000/api/v1/movies?order=ASC
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

## End-point: Order Movies by Release DESC
### Method: GET
>```
>http://localhost:3000/api/v1/movies?order=DESC
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

## End-point: All Movies <a name = "api_movies_crud"></a>
### Method: GET
>```
>http://localhost:3000/api/v1/movies
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

## End-point: Show Movie
### Method: GET
>```
>http://localhost:3000/api/v1/movies/6
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

## End-point: Create Movie
### Method: POST
>```
>http://localhost:3000/api/v1/movies
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

## End-point: Update Movie
### Method: PATCH
>```
>http://localhost:3000/api/v1/movies/11
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

## End-point: Delete Movie
### Method: DELETE
>```
>http://localhost:3000/api/v1/movies/11
>```
### Response: 204
```json
null
```

## 📁 Collection: Characters <a name = "api_characters"></a>


## End-point: Search Character by Name <a name = "api_characters_search"></a>
### Method: GET
>```
>http://localhost:3000/api/v1/characters?name=mouse
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


## End-point: Search Character by Age
### Method: GET
>```
>http://localhost:3000/api/v1/characters?age=25
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


## End-point: Search Character by Movie
### Method: GET
>```
>http://localhost:3000/api/v1/characters?movie_id=3
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

## End-point: All Characters <a name = "api_characters_crud"></a>
### Method: GET
>```
>http://localhost:3000/api/v1/characters
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

## End-point: Show Character
### Method: GET
>```
>http://localhost:3000/api/v1/characters/2
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

## End-point: Create Character
### Method: POST
>```
>http://localhost:3000/api/v1/characters
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

## End-point: Update Character
### Method: PATCH
>```
>http://localhost:3000/api/v1/characters/3
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


## End-point: Delete Character
### Method: DELETE
>```
>http://localhost:3000/api/v1/characters/7
>```
### Response: 204
```json
null
```
## 🔧 Rspec Testing <a name = "testing"></a>

### Ejecución de los Tests

Para ejecutar todos los tests y ver los resultados en formato de documentación con colores, sigue estos pasos:

1. Asegúrate de tener todas las dependencias.

2. Abre una terminal y navega hasta el directorio raíz del proyecto.

3. Ejecuta el siguiente comando para ejecutar todos los tests y ver los resultados en formato de documentación con colores:

```
bundle exec rspec --format documentation --color
```

Esto ejecutará todos los tests del proyecto y mostrará los resultados detallados en la consola. Los tests están agrupados por categorías y cada uno muestra una descripción clara de lo que se está probando.

## ⛏️ Tecnologias <a name = "tech_stack"></a>

- ruby "3.1.2"
- rails "7.0.4"
- pg "1.1"
- bcrypt "3.1.7"
- rack-cors
- factory_bot_rails
- rspec-rails "6.0.0"
- jwt "2.7"

## 📮 Documentacion Postman <a name = "postman"></a>

- Documentacion de la API hecha con Postman:
    - [Postman Collection](./docs/Alkemy_Disney_API.postman_collection.json)
- Conversion de Postman to Markdown: 
    - [postman-to-markdown](https://github.com/bautistaj/postman-to-markdown/)

## ✍️ Autores <a name = "authors"></a>
- [Daniel Tejerina](https://github.com/Mettralla) - [Linkedin](https://www.linkedin.com/in/daniel-alejandro-tejerina/)

***
