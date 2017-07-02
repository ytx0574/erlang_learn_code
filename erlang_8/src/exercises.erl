%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. Jun 2017 11:09 PM
%%%-------------------------------------------------------------------
-module(exercises).
-author("johnson").

%% API
-export([test/2, loopModuleInfo/3, maxFuncOfWithModule/0]).










%% 习题一

%% 从code:all_loaded()获取所有的Module 并进行遍历
test([H | T], Map)  ->
  Module = element(1, H),
%%  io:format("====== ~p:~p  ~n", [Module, Module:module_info()]),

  ModuleInfo = Module:module_info(),
%%  io:format("module info ~p~n", [ModuleInfo]),

%%  定义变量M接收loopModuleInfo返回的值, 然后另做递归传递下去
  M = loopModuleInfo(Module, ModuleInfo, Map),

  test(T, M);
test([], Map) -> Map.


%%遍历每个MuduleInfo
loopModuleInfo(Module, [H | T], Map) ->

%%  io:format("~p  ~p~n", [H, is_tuple(H)]),
  FirstElement = element(1, H),         %%ModuleInfo是一个List, 而List里面又是几个元组. 要拿到导出函数, 只有遍历元组并找到第一个元素为exports的元组
  if
    FirstElement =:= exports ->
%%      io:format("~p funs:~p~n", [Module, element(2, H)]),
      Map#{Module => element(2, H)};        %%以Module为key 然后往Map里面添加对应的函数列表,
    true -> loopModuleInfo(Module, T, Map)
  end.



maxFuncOfWithModule() ->
  Map = test(code:all_loaded(), #{}),
  Keys = maps:keys(Map),
  Values = maps:values(Map),
  MaxValue = lists:max(Values),           %%从Map中获取所有的Value, 并找到最大的Value, 然后根据Value找到最大的值
  maps:filter(fun(_Key, Value) -> Value =:= MaxValue end, Map).


xx() ->
  dict:from_list().



