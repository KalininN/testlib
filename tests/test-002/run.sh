#!/bin/bash
set -eo pipefail

bash ../scripts/compile src/wcmp.cpp
bash ../scripts/test-ref r1 ./wcmp files/input.01 files/output.01 files/answer.01
bash ../scripts/test-ref r2 ./wcmp files/input.01 files/output.01 files/output.01
bash ../scripts/test-ref r3 ./wcmp files/input.01 files/output.01 files/answer2.01
rm -f wcmp wcmp.exe

bash ../scripts/compile src/fcmp.cpp
bash ../scripts/test-ref r4 ./fcmp files/input.01 files/output.01 files/answer.01
bash ../scripts/test-ref r5 ./fcmp files/input.01 files/output.01 files/output.01
bash ../scripts/test-ref r6 ./fcmp files/input.01 files/output.01 files/answer2.01
rm -f fcmp fcmp.exe
