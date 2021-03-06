module D021202ProgramAlarmTest where

import Test.HUnit

import D021202ProgramAlarm (processWithICI)


testIntCode =
    [ TestLabel "" $ TestCase $ assertEqual "processWithICI [1,0,0,0,99]" [2,0,0,0,99] (processWithICI [] [1,0,0,0,99])
    , TestLabel "" $ TestCase $ assertEqual "processWithICI [2,3,0,3,99]" [2,3,0,6,99] (processWithICI [] [2,3,0,3,99])
    , TestLabel "" $ TestCase $ assertEqual "processWithICI [2,4,4,5,99,0]" [2,4,4,5,99,9801] (processWithICI [] [2,4,4,5,99,0])
    , TestLabel "" $ TestCase $ assertEqual "processWithICI [1,1,1,4,99,5,6,0,99]" [30,1,1,4,2,5,6,0,99] (processWithICI [] [1,1,1,4,99,5,6,0,99])
    , TestLabel "" $ TestCase $ assertEqual "processWithICI [3,0,4,0,99]" [1,0,4,0,99] (processWithICI [1] [3,0,4,0,99])
    , TestLabel "" $ TestCase $ assertEqual "processWithICI [1101,100,-1,4,0]" [1101,100,-1,4,99] (processWithICI [] [1101,100,-1,4,0])
    ]


d02Tests :: [Test]
d02Tests = testIntCode
