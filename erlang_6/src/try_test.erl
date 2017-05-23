%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 五月 2017 下午6:59
%%%-------------------------------------------------------------------
-module(try_test).
-author("johnson").

%% API
-export([generate_exception/1, demo/0, demo2/0, sqrt/1, test/2, test1/2, my_func/1, test_my_func/1, test_all_fun/1]).
-export([demo3/0]).



%%  try catch 示例
generate_exception(1) -> a;

generate_exception(2) -> throw(a);

generate_exception(3) -> exit(a);

generate_exception(4) -> {'Exit', a};

generate_exception(5) -> error(a).

demo() ->
  [catcher(I) || I <- [1, 2, 3, 4, 5]].

catcher(N) ->
  try generate_exception(N) of
      Val -> {N, normal, Val}
  catch
      throw:X  -> {N, caught, thrown, X};
      exit:X -> {N, caught, exited, X};
      error:X -> {N, caught, error, X}
  end.

%% 用catch捕捉异常错误

demo2() ->
  [ {I, (catch generate_exception(I))} || I <- [1, 2, 3, 4, 5] ].



%% 改进错误信息

sqrt(X) when X < 0 ->
  error({"args can't < 0", X});
sqrt(X) ->
  math:sqrt(X).


%%错误处理一

test(X, F) ->
  case F(X) of
    {ok, Val} ->             %%如果f(X)返回{ok, ...}则执行相关操作
      do_some_thing_with(Val);
    {error, Why} ->            %%如果f(X)返回{error， ...} 则判断进行错误处理
      {"handle this error", Why}
end.

do_some_thing_with(Val) ->
  #{"正确的处理" => Val}.


%%错误处理二

test1(X, F) ->
  {ok, Val} = F(X),      %%如果正确直接执行下面一句， 如果不正确直接不匹配，爆出异常；
  do_some_thing_with(Val).





%% 自定义异常捕获

my_func(X) ->
  case X of
      0 -> throw({thisError, X});
      1 -> throw({otherError, X});
      2 -> throw({"not error",X});   %% 下面没有该异常匹配， 无法捕获
      3 -> X      %% 正常情况下可以不用处理，不处理就是3，
    %% 但是下面的try后面不能跟of， 如果try里面有内容， 后面必须跟上of
  end.

test_my_func(X) ->
  try my_func(X) of
    X -> {tt, X}
  catch
  throw:{thisError, X} -> {thisError, X};
  throw:{otherError, X} -> {otherError, X}
  end.



%% 捕获一切可能的异常

all_fun(X)  ->
  if
    X =:= 0 -> throw({" == 0"});
    X > 3 -> throw("> 3");
    true -> throw(allways_true)
  end.

test_all_fun(X) ->
  try all_fun(X)

  catch
      _:_  -> {allError, "capture all exception"}
  end.


%% 栈跟踪      用元组展示， 每一条信息都包含调用类 方法 方法参数个数 类文件 行号
demo3() ->
  try generate_exception(5)

  catch
      error:X ->
        {X, erlang:get_stacktrace()}
  end.






















funs(X) ->
    if
      X > 1 -> {ok, "this is true"};
      true ->  {error, "can't matching"}
    end.
