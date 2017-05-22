%%%-------------------------------------------------------------------
%%% @author Johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 五月 2017 23:38
%%%-------------------------------------------------------------------
-module(test_map).
-author("Johnson").

%% API
-export([testMap/0, testMap1/0]).




testMap() ->
  Sex = "Man",
  Age = age,

  M = #{name => "Yx", sex => Sex, Age => 29},
  MM = M#{name := "John"},                  %% 更改M中name字段的值
  {M, MM},

  #{name := Value} = MM,                    %% 取映射组中的值时， 只能用 := 来取，  文档里面=>错误的
  Value,
  M3 = MM#{ make => 22},                    %% 新增字段后得到的是一个新的map, 修改之后还是原来的map
  M4 = M3#{ make := 44 },
  {MM, M3, M4}.

testMap1() ->
  Key = email,
  A = #{Key => "qq.com", names => "jim"},
  B = #{email => "qq.com", name => "joh"},
  maps:to_list(A) > maps:to_list(B).


%%1.同为map, size大的比较大;
%%2.size相同, maps:to_list大的比较大; 转为list后, 会从左到右比较两者的键和值,  直到遇到某个大的键或值, 那么这个大的比较大.
%%3.当map与其它erlang数据类型比较时, map大


%%count_char(Str) ->
%%  count_characters(Str, #{});
%%
%%count_characters([ H｜T], #{ H => N} = X) ->
%%  count_characters(T, X#{ H := N + 1});
%%count_characters([ H｜T], X) ->
%%  count_characters(T, X#{ H => 1});
%%count_characters([], X) -> X.




