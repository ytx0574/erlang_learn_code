%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. Jun 2017 11:52 PM
%%%-------------------------------------------------------------------
-module(ml).
-author("johnson").

%% API
-export([loop/1, test/1]).




%%  预定义宏  类似C语言中宏


-ifdef(debug_flag).

-define(DEBUG(X), io:format("DEBUG  ~p:~p ~p~n", [?MODULE, ?LINE, X])).

-else.

-define(DEBUG(X), void).

-endif.


loop(0) ->
  done;
loop(N) ->
  ?DEBUG(N),
  loop(N - 1).

%% 编译时，带入debug_flag标签 c(ml, {d, debug_flag}).        编译时， 一定要输出{ok，module}，才算是编译成功




%%模式的匹配操作符


%%  如ml:test([{tag, {one, a}, c} | []]).中， Z1，B, T各自对应着调用函数的值，但是为了匹配，
%% 如果参数有固定的值，如本例中的tag，那么传入的参数也要有对应的tag， 否则传入参数和它定义的就不匹配。
test([{tag, {one, A} = Z1, B} = Z2 | T]) ->
  Z1,
  B,
  T,
  A,
  Z2.

