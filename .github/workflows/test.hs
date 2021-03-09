import System.Environment
import System.Process

main =
  getEnv "ghc" >>= \ghc ->
    case ghc of
      "7.4.2" ->
        callProcess "cabal"
          [ "test"
          , "--constraint=bytestring == 0.9.*"
          , "--constraint=containers == 0.4.2.*"
          , "--constraint=deepseq == 1.3.*"
          , "--constraint=text == 1.2.3.*"
          , "--constraint=mtl == 2.2.1.*"
          , "--constraint=nats == 1.1.2.*"
          , "--constraint=parsec == 3.1.13.0"
          , "--constraint=QuickCheck == 2.13.*"
          , "--constraint=tasty == 1.2.*"
          ]

      "8.10.1" ->
        callProcess "cabal"
          [ "test"
          , "--constraint=bytestring == 0.11.*"
          , "--constraint=containers == 0.6.*"
          , "--constraint=deepseq == 1.4.*"
          , "--constraint=QuickCheck == 2.14.*"
          , "--constraint=tasty == 1.3.*"
          ]

      _ -> callProcess "cabal" ["test"]
