%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. May 2017 11:30 PM
%%%-------------------------------------------------------------------
-module(shop).
-author("johnson").

%% API
-export([cost/1]).


cost(oranges)        -> 5;
cost(newspaper)      -> 8;
cost(apples)         -> 2;
cost(pears)          -> 9;
cost(milk)           -> 7.

