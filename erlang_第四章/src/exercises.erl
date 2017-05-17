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
-export([tuple_to_list/1, my_tuple_to_list/1, my_time_func/1, my_date_string/1]).
-export([get_pathon_datetime_method/0, filter/2, filter_case/2]).
-export([even/1, odd/1, split/1, split2/1]).
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




%%练习题2
%% 计算4444444次执行F函数的时间
my_time_func(F) ->
%%  Now1 = erlang:now(),
  T1 = calendar:local_time(),
  L = lib_misc:for(1, 4444444, F),
  T2 = calendar:local_time(),
  calendar:time_difference(T1, T2).  %%返回数据为{d, {h, m, s}}, L为444444次for 后组成的F的结果集


%%练习题3
%% 格式化输出日期
my_date_string(Str) when is_list(Str) ->
  Date = erlang:tuple_to_list(date()),
  Time = erlang:tuple_to_list(time()),
  Date1 = [integer_to_list(X) || X <- Date],      %% 组合日期列表, 列表元素为list int 转为 字符串list
  Time1 = [integer_to_list(X) || X <- Time],
  string:join(Date1, Str) ++ " " ++ string:join(Time1, Str).  %%使用-分隔列表元素, 列表元素必须是字符串

%%  [ Y || {a, Y} <- [{a, "年"}, {a, "月"}, {a, "日"}, {a, "时"}, {a, "分"}, {a, "秒"}]].

%% 练习题4  没看过python
get_pathon_datetime_method() ->
  [].




%% 习题5
even(Num) when is_integer(Num) ->
  X = Num rem 2 =:= 0,
  X.
odd(Num) when is_integer(Num) ->
  Num rem 2 =:= 1.





%% 习题6

filter_case(P, [H | T]) ->
  case P(H) of
    true -> [H | filter_case(P, T)];
    false -> filter_case(P, T)
  end;
filter_case(_, []) -> [].

filter(F, L) ->

  Bool = length(L) > 0,           %%如果L为空列表, 那么表头和表尾都无法取到( hd(L), tl(L)崩溃 ), 有一个都可以取到
  case Bool of
      true ->

        [H | T] = L,
        case F(H) of
            true -> [H | filter(F, T)];
            false -> filter(F, T)
        end;

      false -> L
  end.


%% 习题7

%% 循环两次
split(L) ->
  Odds = [ B || B <- L, odd(B) ],
  Evens = [ X || X <- L, even(X)],
  {Odds, Evens}.


%% 循环一次
split2(L) ->
  splitsub(L, [], []).

splitsub([H | T], Odds, Evens) ->
  case H rem 2 of
      1 -> splitsub(T, [H | Odds], Evens);
      0 -> splitsub(T, Odds, [H | Evens])
  end;
splitsub([], Odds, Evens) -> {Odds, Evens}.

%%  [ Y || is_boolean(F(Y)), F(Y) == true, Y <- L ].

