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
-export([generate_exception/1, demo/0, demo2/0, sqrt/1]).



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