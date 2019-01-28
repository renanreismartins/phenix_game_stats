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

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


To build the docker image: `docker build -t derivco .`
and to run it: `docker run  -p 5000:5000 derivco`. Then you can access the 
to make a request to the app through the container access `localhost:5000`  

Running the docker environment with `docker-compose up` all the requests will be towards the HAProxy.