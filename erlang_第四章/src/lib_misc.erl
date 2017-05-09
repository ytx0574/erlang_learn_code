%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. May 2017 10:16 PM
%%%-------------------------------------------------------------------
-module(lib_misc).
-author("johnson").

%% API
-export([for/3, test/0, test1/0, sum/1, test2/0]).


%%自实现for循环  两个函数顺序不能错乱, 以后肯定会经常用到的
for(Max, Max, Func) -> [Func(Max)];
for(I, Max, Func) -> [Func(I) | for(I + 1, Max, Func)].


test() ->
  for(1, 10, fun(I) -> I end).

test1() ->
  for(1, 10, fun(I) -> I * I end).



sum([H|T]) -> H + sum(T);
sum([]) -> 0.

test2() ->
  sum([1, 3, 5]).


%%sum函数分解
%%1. sum([1, 3, 5])
%%2. sum(1, 3, 5) = 1 + sum([3, 5])
%%3. = 1 + 3 + sum([5])
%%4. = 1 + 3 + 5 + sum([])
%%5. = 1 + 3 + 5 + 0
%%6. = 9