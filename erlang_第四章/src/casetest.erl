%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. May 2017 8:13 AM
%%%-------------------------------------------------------------------
-module(casetest).
-author("johnson").

%% API
-export([filter/2]).


%% 自实现lists:filter/2

%%filter(P, [H | T]) ->
%%  case P(H) of
%%    true -> [H | filter(P, T)];
%%    false -> filter(P, T)
%%  end;
%%filter(_, []) -> [].


filter(P, [H|T]) -> filter1(P(H), H, P, T);
filter(H, []) -> [].

filter1(true, H, P, T) -> [H|filter(P, T)];
filter1(false, H, P, T) -> filter(P, T).
