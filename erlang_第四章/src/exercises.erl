%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. May 2017 10:49 PM
%%%-------------------------------------------------------------------
-module(exercises).
-author("johnson").

%% API
-export([tuple_to_list/1, my_tuple_to_list/1, my_time_func/1, my_date_string/0]).
-import(lists, []).


tuple_to_list(T) ->
  erlang:tuple_to_list(T).



%% 自实现tuple_to_list  元组的元素是从1开始取的
my_tuple_to_list(T) ->
  my_tuple_to_list1(1, T, []).

my_tuple_to_list1(I, T, L) ->
  LL = [element(I, T) | L],
  if
    I < size(T) ->
      my_tuple_to_list1(I + 1, T, LL);
    true -> lists:reverse(LL)
  end.

%% [1, 2, 3] 首先取第一个, 然后进入方法1, 组成[1], 然后满足条件,组成[2, 1],
%% 继续满足条件, 组成[3, 2, 1], I的值大于size(T), 所以直接返回LL(顺序要反转)

my_time_func(F) ->
  [].

my_date_string() ->
  Date = erlang:tuple_to_list(date()),
  Time = erlang:tuple_to_list(time()),
  Tuple = erlang:list_to_tuple(Date ++ Time).

%%  [ Y || {a, Y} <- [{a, "年"}, {a, "月"}, {a, "日"}, {a, "时"}, {a, "分"}, {a, "秒"}]].


