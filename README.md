A repository to demonstrate that `detailed` test suites do not work with Stack.

## Output

With cabal, everything works normally:

```
$ cabal test exitcode
Preprocessing test suite 'exitcode' for stack-test-detailed-0.1.0.0..
Building test suite 'exitcode' for stack-test-detailed-0.1.0.0..
Running 1 test suites...
Test suite exitcode: RUNNING...
Test suite exitcode: PASS
Test suite logged to: dist/test/stack-test-detailed-0.1.0.0-exitcode.log
1 of 1 test suites (1 of 1 test cases) passed.
```

```
$ cabal test detailed
Preprocessing test suite 'detailed' for stack-test-detailed-0.1.0.0..
Building test suite 'detailed' for stack-test-detailed-0.1.0.0..
[1 of 1] Compiling Main             ( dist/build/detailedStub/detailedStub-tmp/detailedStub.hs, dist/build/detailedStub/detailedStub-tmp/Main.o )
Linking dist/build/detailedStub/detailedStub ...
Running 1 test suites...
Test suite detailed: RUNNING...
Test suite detailed: PASS
Test suite logged to: dist/test/stack-test-detailed-0.1.0.0-detailed.log
1 of 1 test suites (1 of 1 test cases) passed.
```

With stack, exitcode test works:

```
$ stack test :exitcode
stack-test-detailed-0.1.0.0: build (test)
Preprocessing test suite 'exitcode' for stack-test-detailed-0.1.0.0..
Building test suite 'exitcode' for stack-test-detailed-0.1.0.0..
stack-test-detailed-0.1.0.0: test (suite: exitcode)


stack-test-detailed-0.1.0.0: Test suite exitcode passed
Completed 2 action(s).
```

But detailed test fails to compile:

```
$ stack test :detailed
stack-test-detailed-0.1.0.0: build (test)
Preprocessing test suite 'detailed' for stack-test-detailed-0.1.0.0..
Building test suite 'detailed' for stack-test-detailed-0.1.0.0..

<no location info>: error:
    module ‘MyModule’ cannot be found locally

Progress 1/2

--  While building custom Setup.hs for package stack-test-detailed-0.1.0.0 using:
      /Users/john/.stack/setup-exe-cache/x86_64-osx/Cabal-simple_mPHDZzAJ_2.0.1.0_ghc-8.2.2 --builddir=.stack-work/dist/x86_64-osx/Cabal-2.0.1.0 build test:detailed --ghc-options " -ddump-hi -ddump-to-file -fdiagnostics-color=always"
    Process exited with code: ExitFailure 1
```

## Versions

Tested with Stack 1.7.1, 1.9.3
and snapshots
lts-11.22
lts-12.14
lts-12.16
lts-6.35
lts-7.24.

## Notes

Seems to be reported
[here](https://github.com/commercialhaskell/stack/issues/4453)
and fixed
[here](https://github.com/commercialhaskell/stack/commit/75e1091a22e97280b716340468082e26d40e3f88).
