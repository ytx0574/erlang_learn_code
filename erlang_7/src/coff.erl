%%%-------------------------------------------------------------------
%%% @author johnson
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 五月 2017 下午5:09
%%%-------------------------------------------------------------------
-module(coff).
-author("johnson").

%% API
-export([]).


upack_image_resource_directory(Dir) ->

  <<Characteristice         : DWORD,
    TimeDataStamp           : DWORD,
    MajorVersion            : WORD,
    MinorVersion            : WORD,
    NumberOfNameEntries     : WORD,
    NumberOfIdEntries       : WORD, _/binary
    >> = Dir.