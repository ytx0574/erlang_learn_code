%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. May 2017 10:15 PM
%%%-------------------------------------------------------------------
-module(test).
-author("johnson").

%% API
-export([test/0, test1/0, test2/0, test3/0, map/2]).


%% 列表推导, test 为返回X * 2的元素列表, X的从L中提取
%% test1 为返回{Name, X * 5}的元素列表, {Name, X}从L中提取

test() ->
  L = [1, 2, 4, 5],

  lists:map(fun(X) -> 2 * X end, L),
  [2 * X || X <- L].

test1() ->
  L = [{apples, 4}, {oranges, 5}, {milk, 11}],
  [{Name, X * 5} || {Name, X} <- L].

test2() ->
  L = [{apples, 4}, {oranges, 5}, {milk, 11}],
  [{shop:cost(Name) * X} || {Name, X} <- L].

test3() ->
  L = [{apples, 4}, {oranges, 5}, {milk, 11}],
  lists:sum([shop:cost(Name) * X || {Name, X} <- L]).



%%列表推导 自实现map
map(Func, L) -> [Func(X) || X <- L].

%% lists:map(fun(X) -> X * 0 end, [1, 2, 4]).
%% test:map(fun(X) -> X * 0 end, [1, 2, 4]).


