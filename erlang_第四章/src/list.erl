%%%-------------------------------------------------------------------
%%% @author Johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 五月 2017 22:54
%%%-------------------------------------------------------------------
-module(list).
-author("Johnson").

%% API
-export([area/1]).

area({rectangle, Width, Height}) -> Width * Height.
