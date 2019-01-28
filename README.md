# Derivco API Stats

Endpoints:

/seasons
 * List all the season summaries

/seasons/{season}
 * List all the games for the season

Check the swagger.yaml for more info on the API.


Considerations:
The project was developed 


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000/seasons`](http://localhost:4000/seasons) from your browser.



# Docker cluster
To build the docker image: `docker build -t derivco .`
and to run it: `docker run  -p 5000:5000 derivco`. Then you can access the 
to make a request to the app through the container access `localhost:5000/seasons`


Running the docker environment with `docker swarm init` and `docker stack deploy --compose-file=docker-compose.yml prod` will create a docker swarm cluster and all the requests will be towards the HAProxy. That can be accessed trough `localhost:80/seasons`.