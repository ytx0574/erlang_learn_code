%%%-------------------------------------------------------------------
%%% @author Johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 五月 2017 22:59
%%%-------------------------------------------------------------------
-module(geometry1).
-author("Johnson").

%% API
-export([area/1, test/0]).

%%添加测试代码
test() ->
  12 = area({rectangle, 3, 4}),
  144 = area({sqaure, 12}),
  [this, is, ok, worked].

%%添加fun 计算长方形的面积和正方形的面积
area({sqaure, Side}) -> Side * Side;
area({rectangle, Width, Height}) -> Width * Height;
area({circle, Radius}) -> 3.14 * Radius * Radius.



area([]) -> 22.
