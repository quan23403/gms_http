-module(gms_http_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_Type, _Args) ->

    Dispatch =
        cowboy_router:compile([
            {'_', [
                {"/", hello_handler, #{}}
            ]}
        ]),

    {ok, _} =
        cowboy:start_clear(
            http_listener,
            [{port, 8080}],
            #{
                env => #{
                    dispatch => Dispatch
                }
            }
        ),

    io:format(
        "Cowboy started on port 8080~n"
    ),

    {ok, self()}.

stop(_State) ->
    ok.