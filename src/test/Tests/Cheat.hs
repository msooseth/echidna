module Tests.Cheat (cheatTests) where

import Test.Tasty (TestTree, testGroup)

import Common (testContract', solcV, solved)

import Echidna.Types.Campaign (WorkerType(..))

cheatTests :: TestTree
cheatTests =
  testGroup "Cheatcodes Tests"
    [ testContract' "cheat/ffi.sol" (Just "TestFFI") (Just (> solcV (0,5,0))) (Just "cheat/ffi.yaml") False FuzzWorker
        [ ("echidna_ffi passed", solved "echidna_ffi") ]
    , testContract' "cheat/ffi2.sol" (Just "TestFFI") (Just (> solcV (0,5,0))) (Just "cheat/ffi.yaml") False FuzzWorker
        [ ("echidna_ffi passed", solved "echidna_ffi") ]
    , testContract' "cheat/gas.sol" (Just "TestCheatGas") (Just (> solcV (0,5,0))) (Just "cheat/ffi.yaml") False FuzzWorker
        [ ("echidna_gas_zero passed", solved "echidna_gas_zero") ]
    ]
