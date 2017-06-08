%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 六月 2017 上午9:45
%%%-------------------------------------------------------------------
-module(b).
-author("johnson").
-import(a, [x/0]).

%% API
-export([start/1]).



%% 动态代码注入，
%% 如果是正在运行的函数的内部函数如a:x()， 那么重新编译后，各个版本都将自动更新到最新版本，
%% 如果正在运行的函数重新编译后，会同时保持两个版本，如b:start(X)， 也就是最后一个版本和倒数第二个版本，之前的版本将不在执行

start(Tag) ->
    spawn(fun() -> loop(Tag) end).

loop(Tag) ->
  sleep(),
  io:format("Vsn33 (~p) a:x() = ~p~n", [Tag, a:x()]),
  loop(Tag).

sleep() ->
  receive
    after 3000 -> true
  end.