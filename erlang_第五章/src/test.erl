%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 五月 2017 下午4:29
%%%-------------------------------------------------------------------
-module(test).
-author("johnson").
-import(jiffy, [encode/1, encode/2]).

%% API

-export([test/0, map_search_pred/2]).




%% 习题二

map_search_pred(Map, Pred) ->

  Keys = maps:keys(Map),
  map_search(Keys, Map, Pred).

map_search([ H | T], Map, Pred) ->

  case Pred(H, maps:get(H, Map)) of
      false -> map_search(T, Map, Pred);
      true -> {H, maps:get(H, Map)}
  end;
map_search([], _, _) -> "unfind this Key & Value".


test() ->
  Str = file:read_file("json.json"),

  Map = #{name => "yx", age => 22, des => "666"}.
%%  Str1 = maps:to_json().    我靠 这个方法被取消了, 先记下, 后面再来实现.

%%  M = maps:from_list(Str).
