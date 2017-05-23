%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. May 2017 12:07 AM
%%%-------------------------------------------------------------------
-module(test).
-author("johnson").

%% API
-export([read/1, my_read/1, test/1]).


read(File) ->
  file:read_file("J.json"),
  file:read_file("lgConfig.plist"),
  file:read_file("xcoderamdata.sh"),
  file:read_file("hongmao_pro.p12"),
  file:read_file("apns2test_pro.mobileprovision"),
  file:read_file("Joh.pdf"),
  file:read_file("Joh.pdf.zip"),
  file:read_file("wtfjh.deb"),
  file:read_file("test.erl"),
  file:read_file("libswiftcore.dylib"),
  file:read_file("Reveal"),
  file:read_file("xx"),
  file:read_file("folder").



%% 习题一
%% 分别判断是否是目录 是否是文件 读取是否错误
my_read(File) when is_list(File) ->
  case filelib:is_dir(File) of
      false -> case filelib:is_file(File) of
                    true ->
                      Tuple = file:read_file(File),
                      if
                        element(1, Tuple) =:= error -> throw(Tuple);
                        true -> Tuple
                      end;
                    false -> throw({error, File ++ " is not exist"})
                end;
      true -> throw({error, File ++ " is dir"})
  end.


%% 习题二  当X>3时, 用户提示信息在showMsgToUser/0添加,

test(X) ->
  try showMsg(X)

  catch
      error:{devError, X} -> erlang:get_stacktrace();
      throw:X -> {X, erlang:get_stacktrace()}        %% 这里切记, 抛出什么内容 就catch什么内容, 否则无法正常处理异常
  end.


showMsg(X) ->
  if
    X > 3 -> showMsgToUser("X的值不能大于3"), throw(X);
    true -> {ok, "no error"}
  end.

showMsgToUser(Msg) ->
  Msg.



