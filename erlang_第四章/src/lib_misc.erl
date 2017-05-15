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
-export([for/3, test/0, test1/0, sum/1, test2/0, test3/0, qsort/1]).
-export([pythag/1, perms/1, odds_and_evens1/1, odds_and_evens2/1]).


%%自实现for循环  两个函数顺序不能错乱, 以后肯定会经常用到的
for(Max, Max, Func) -> [Func(Max)];
for(I, Max, Func) -> [Func(I) | for(I + 1, Max, Func)].


test() ->
  for(1, 10, fun(I) -> I end).

test1() ->
  for(1, 10, fun(I) -> I * I end).
test3() ->
  L = [22, 3, 55, 5, 000, 342, 55, 4, "44"],
  qsort(L).


qsort([]) -> [];
qsort([Pivot | T]) ->
  qsort([ X || X <- T, X < Pivot ])
  ++ [Pivot] ++
    qsort([ X || X <- T, X >= Pivot]).
%%  上面代码X和Pivot替换, 则为倒叙排列. 字符串排列最后


%%毕达哥拉斯三元数组  下面的表达式如果数字过大, 会导致出结果慢
pythag(N) ->
  [ {A, B, C} ||
    A <- lists:seq(1, N),
    B <- lists:seq(1, N),
    C <- lists:seq(1, N),
    A + B + C =< N,
    A * A + B * B =:= C * C
  ].

%%回文构词  填字游戏, 排列出字母的所有组合, 过长导致出结果慢
perms([]) -> [[]];
perms(L) ->
  [ [H | T] || H <- L, T <- perms(L -- [H])].

%%lists:seq/2  意思是从1到N的所有值组成的列表


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


%% 一分为二， 遍历两次
odds_and_evens1(L) ->
  Odds = [X || X <- L, (X rem 2) =:= 1],
  Evens = [X || X <- L, (X rem 2) =:= 0],
  {Odds, Evens}.



%% 一分为二， 遍历一次
odds_and_evens_acc([H | T], Odds, Evens) ->
  case H rem 2 of
      1 -> odds_and_evens_acc(T, [H | Odds], Evens);
      0 -> odds_and_evens_acc(T, Odds, [H | Evens])
  end;
odds_and_evens_acc([], Odds, Evens) ->
  {lists:reverse(Odds), lists:reverse(Evens)}.


odds_and_evens2(L) ->
  odds_and_evens_acc(L, [], []).