%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. May 2017 11:52 PM
%%%-------------------------------------------------------------------
-module(shop1).
-author("johnson").

%% API
-export([total/1]).

total([{What, N} | T]) -> shop:cost(What) * N + total(T);
total([]) -> 0.

