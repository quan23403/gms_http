-module(gms_http_sup).

-behaviour(supervisor).

-export([
    start_link/0,
    init/1
]).

start_link() ->
    supervisor:start_link(
        {local, ?MODULE},
        ?MODULE,
        []
    ).

init([]) ->

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
                env =>
                    #{
                        dispatch => Dispatch
                    }
            }
        ),

    io:format(
        "Cowboy started on port 8080~n"
    ),

    {ok,
     {
      {one_for_one, 5, 10},
      []
     }}.