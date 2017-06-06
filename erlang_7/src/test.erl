%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. May 2017 11:13 PM
%%%-------------------------------------------------------------------
-module(test).
-author("johnson").

%% API
-export([test/0, revertBinary/1]).


test() ->
    Red = 2,
    Green = 61,
    Blue = 20,
    Mem = <<Red:5, Green:6, Blue:5>>,

%%    <<X:5, Y:6, Z:7>> = Mem,
    <<X:4, Y:7, Z:5>> = Mem.

%%    XYZ和上面的RGB值一样， 只需要保证长度一致即可， 所有可以是 <<X:4, Y:7, Z:3>>, 但是对应的值就不一样了

revertBinary(Binary) ->
    if
        is_binary(Binary) -> {};
        true -> "not is binary, please try agen"
    end.