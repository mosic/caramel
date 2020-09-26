% Source code generated with Caramel.
-module(proc_registry_2).
-export_type([name/0]).
-export_type([registry/0]).

-export([register/3]).
-export([registry/0]).
-export([where_is/1]).

-type name() :: any().

-type registry() :: list(name()).

-spec where_is(fun((name()) -> option:t(A))) :: option:t(A).
where_is(F) ->
  Where_is' = fun
  (Ns) ->
  case Ns of
    '[]' -> none;
    [N | Ns] -> case F(N) of
  {some, T} -> {some, T};
  none -> where_is'(Ns)
end
  end
end,
  Where_is'(maps:get(contents, )).

-spec register(fun((name()) -> option:t(A)), name(), B) :: result:t(ok, binary()).
register(F, N, Pid) ->
  case where_is(F) of
    {some, _} -> {error, <<"process already registered">>};
    none -> ':='(, [N | maps:get(contents, )]),
{ok, ok}
  end.


