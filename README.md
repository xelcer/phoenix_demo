# phoenix_demo

Simple Elixir/Phoenix demo with authentication and CRUDs using 
[Coherence](https://github.com/smpallen99/coherence) and [ExAdmin](https://github.com/smpallen99/ex_admin).

## Setup

    $ git clone https://github.com/xelcer/phoenix_demo
    $ cd phoenix_demo
    $ mix do deps.get, deps.compile
    $ mix ecto.setup
    $ npm install
    $ iex -S mix phoenix.server

And navigate to http://localhost:4000/
