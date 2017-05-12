%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. May 2017 7:41 AM
%%%-------------------------------------------------------------------
-module(guards).
-author("johnson").

%% API
-export([f/2, t/1, t1/1, f1/2]).
-export([andalsoTest/2, orelseTest/1]).
-export([ff/1, gg/1]).


%% 当关卡的条件不满足时, 直接报错


f(X, Y) when X > Y, is_integer(X), Y < 6 ->
%%  上面关卡的意思可以理解为C的 X > Y && is_integer(X) && Y < 6
  X * Y.

t(T) when is_tuple(T), tuple_size(T) =:= 2, abs(element(2, T)) > 5 ->
%%  上面关卡理解为: T为元组并且有2个元素, 并且第二个元素的绝对值大于5
element(2, T) * 8.


%% X == dog || X == cat
t1(X) when X =:= dog; X =:= cat ->
  X.

%% is_integer(X) && X > Y || abs(Y) < 23
f1(X, Y) when is_integer(X), X > Y; abs(Y) < 23 ->
  X * Y.

%% andalso orelse
andalsoTest(A, B) when A >= 1 andalso A + 1 > B ->
  A * B.

orelseTest(L) when is_atom(L) orelse (is_list(L) andalso length(L) > 2) ->
  L.


%% or orelse 测试
ff(X) when (X == 0) or (1 / X > 2) ->
  X.
gg(X) when (X == 0) orelse (1 / X > 2) ->
  X.


%% or 会在前面的条件满足时, 还会继续后面的判断   而orelse当前面的条件满足时, 直接返回true. 具体还有待查阅