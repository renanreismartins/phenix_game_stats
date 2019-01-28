FROM bitwalker/alpine-elixir-phoenix:latest

# Set exposed ports
EXPOSE 5000
ENV PORT=5000 MIX_ENV=prod

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile
COPY data.csv /var/opt/

ADD . .

RUN mix do compile, phx.digest

USER default

CMD ["mix", "phx.server"]