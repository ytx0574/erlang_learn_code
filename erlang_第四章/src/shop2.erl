%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. May 2017 11:09 PM
%%%-------------------------------------------------------------------
-module(shop2).
-author("johnson").

%% API
-export([total/0]).
-import(lists, [map/2, sum/1]).

%%shop模块并没有导入, 所以下面使用时, 使用完全限定的名称shop:cost
%%-import(shop, [cost/1]).




%%  注意看错误信息, 之前编译正常, map的第二个参数为List, 不小心写成了Truple

total() ->
  Buy = [{oranges, 3}, {newspaper, 1}, {apples, 10}, {pears, 6}, {milk, 3}],

  List = map(fun({What, N}) -> shop:cost(What) * N end, Buy),

  sum(List).
