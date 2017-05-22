%%%-------------------------------------------------------------------
%%% @author Johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 五月 2017 22:42
%%%-------------------------------------------------------------------
-module(test_record).
-author("Johnson").

%% API
-export([clear_status/1,test/1]).

%% erl中要使用record， 需要把record的定义写在里面， eshell中使用， 要用rr("xx.hrl")的形式先读入，然后才能调用record
%% 此处为record示例

-record(todo, {status = 22, who = johnson, text = f, string = "hello world", number = 983, sex}).
clear_status(#todo{status = S, who = W} = R) ->
  W.  %% S为传入todo的status值，R为传入的todo

test(#todo{} = R) ->
  R1 = #todo{who = "R1"},
  R2 = R1#todo{who = "R2", text = "this is R2"},

  #todo{text = R2_Text} = R2#todo{},   %%
  #todo{text = R2_Text} = R2,          %% 这两行是等价的，都是给R2_Text给值， R2#todo{} 和R2是等价的
  R2_Text,
R2_who = R2#todo.who.        %% 可以直接点语法取R2的who字段。


%%is_record/2  is_record/3 内置函数， is_record(R2, todo). 判断R2是否是todo记录

