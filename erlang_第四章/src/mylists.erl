%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. May 2017 10:59 PM
%%%-------------------------------------------------------------------
-module(mylists).
-author("johnson").

%% API
-export([map/2, test/0]).


%% 自己实现lists:map/2
map(_, []) -> [];
map(Func, [H | T]) -> [Func(H) | map(Func, T)].

test() ->
  map(fun(X) -> X * X end, [1, 2, 3, 4, 5]).