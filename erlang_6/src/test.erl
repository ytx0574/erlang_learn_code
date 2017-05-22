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
-export([read/1, my_read/1, test_my_read/1]).


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

my_read(File) when is_list(File) ->
  case filelib:is_dir(File) of
      false -> case filelib:is_file(File) of
                    true -> file:read_file(File);
                    false -> throw({error, File ++ " is not exist"})
                end;
      true -> throw({error, File ++ " is dir"})
  end.
