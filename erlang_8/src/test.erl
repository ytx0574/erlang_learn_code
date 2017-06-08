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
%%-export([test/0, testBool/0]).

%%直接导出所有函数
-compile(export_all).

%% 指定版本号 可以为任何类型
-vsn("156.16463.45646").
-vsn(222.22).

%% 用户自定义属性
-somexx("房间里看风景时").
-hello(66.66).
-exps('6666').

%% API
%%-export([testApply3/0, testApply2/0]).


%% apply可直接调用任何函数， Mod， func， Args（参数为list列表）

testApply3() ->
%%  %tuple_to_list({11, 22}),
  apply(erlang, tuple_to_list, [{11, 22}]),

%%  lists:filtermap(fun(X) -> X > 2 end, [1, 2, 4]),
  apply(lists, filtermap, [fun(X) -> X > 2 end, [1, 2, 4]]).

testApply2() ->
%%  文档提示弃用， 没调用成功。。。
  apply(testApplay, []).


%% 获取本模块信息， 每个模块编译后自动生成module_info/0, module_info/1(参数为对应的key
%% 为exports/attributes/compile)
getModuleInfo() ->
  module_info(),
  module_info().
%% test:module_info().
%% beam_lib:chunks("test.beam", [attributes]).
%% beam_lib:all_chunks("test.beam").  得到的全部信息，部分信息已转为binary，然后通过binary_to_term转为原来的数据类型

%% module_info 需要先载入获取的对象， beam_lib:chunks不必载入，可直接从beam文件中获取








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
    not true -> "not true -> false";
    true and flase -> "true and flase -> false";
    true or false -> "true or false -> true";
    true xor false -> "true xor false -> true";        %%异或， 左右两边相同时为false， 不同为true
    true xor true -> "true xor true -> false";
    true -> []
  end.

%%  字符串的理解
%%  和C差不多， 字符串其实是char数组（char对应的Unicode编码）


%%转义序列

escape() ->
%%  输出各自对应的Unicode编码
  io:format("~w~n", ["\b\d\e\f\n\r\s\t\v"]),
  io:format("~w~n", ["\\"]),

%%  字符串里的八进制字符 (把八进制123转为十进制83)
  io:format("~w~n", ["\123\12\1"]),

%%  用\进行转义， 分别转义'  "   \， 并输出各自的Unicode编码
  io:format("~w~n", ["\'\"\\"]),



%% 输出一致， 获取各自的Unicode编码
  io:format("~w~n", ["\a\z\A\Z"]),
  io:format("~w~n", ["azAZ"]).

%% 报错， 一个~w只能对应list中的一个元素， 前后不匹配会报错， 正确的做法是 io:format("~w~n ~w~n  ~w~n ~w~n", [$a, $z, $A, $Z]).
%%  io:format("~w~n", [$a, $z, $A, $Z]).


%% 包含文件      erlang包含文件的扩展名为hrl  所有包含时要让预处理器能找到 file应该包含一个相对路径或绝对路径
- include_lib("hh.hrl").

-undef(Macro).




