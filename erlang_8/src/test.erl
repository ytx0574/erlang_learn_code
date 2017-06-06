%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 六月 2017 下午7:13
%%%-------------------------------------------------------------------
-module(test).
-author("johnson").

%% API
-export([test/0, testBool/0]).


%% 块表达式的使用， 如果X的绝对值为模2为0则返回 M * 8，否则返回M / 2
test() ->
  [begin
     M = erlang:abs(X),
     if
       M rem 2 =:= 0 -> M * 8;
       true -> M div 2
     end
   end || X <- [-1, 7, -6]].

testBool() ->
  if
    not true -> "xxxxxx";
    true -> []
  end.


