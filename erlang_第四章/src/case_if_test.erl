%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. May 2017 8:13 AM
%%%-------------------------------------------------------------------
-module(case_if_test).
-author("johnson").

%% API
-export([filter/2, filter_case/2, compare/2, some_funcation/3]).


%% 自实现lists:filter/2  case      警告可以用_进行省略

filter_case(P, [H | T]) ->
  case P(H) of
    true -> [H | filter_case(P, T)];
    false -> filter_case(P, T)
  end;
filter_case(P, []) -> [].


%%%% 自实现lists:filter/2  if  没对， 后续跟进
%%filter_if(P, [H | T]) ->
%%  if
%%    false -> filter_if(P, T);
%%    true ->  [H | filter_if(P, T)]
%%  end;
%%filter_if(P, []) -> [].

compare(A, B) ->
  if A > B ->
    io:format("~p > ~p~n", [A, B]);
    A < B ->
      io:format("~p < ~p~n", [A, B]);
    true ->
      io:format("~p = ~p~n", [A, B])
  end.



filter(P, [H | T]) -> filter1(P(H), H, P, T);
filter(P, []) -> []
filter1(true, H, P, T) -> [H | filter(P, T)];
filter1(false, H, P, T) -> filter(P, T).



%% 把后表的数据追加到前表中去， 不推荐做法
%%some_funcation([H | T], [HH | TT]) when length([H | T]) > 0 ->
%%  some_funcation([H | T] ++ [hd([HH | TT])], [HH | TT] -- [hd([HH | TT])]);
%%
%%some_funcation([ H | T], []) -> [H | T].



%% 往表里追加另外一张表  默认先翻转表一， 然后把表二的表头添加到表一，最后再反转整个表
some_funcation([H | T], [HH | TT], HT_Length) ->

  if HT_Length == length([H | T]) ->
      L = lists:reverse([H | T]);
%%      some_funcation([HH, L], TT, _);
    true ->
      L = [H | T]
%%      some_funcation([HH, L], TT, _)
  end,
  some_funcation([HH | L], TT, HT_Length);

some_funcation([H | T], [], _) -> lists:reverse([H | T]).


