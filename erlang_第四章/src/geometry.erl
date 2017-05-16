%%%-------------------------------------------------------------------
%%% @author Johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 五月 2017 22:45
%%%-------------------------------------------------------------------
-module(geometry).
-author("Johnson").

%% API
-export([area/1, perimeter/1]).

area({rectangle, Width, Height}) -> Width * Height;
area({sqaure, Side}) -> Side * Side;

area({circle, Radius}) -> 3.14 * Radius * Radius;
area({triangle, BottomLength, Height}) -> BottomLength * Height  div 2.


perimeter({rectangle, Width, Height}) -> (Width + Height) * 2;
perimeter({sqaure, Side}) -> Side * 4;
perimeter({circle, Radius}) -> 2 * 3.14 * Radius.

