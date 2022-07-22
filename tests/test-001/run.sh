#!/bin/bash
set -eo pipefail

bash ../scripts/compile src/checker.cpp --check-only
bash ../scripts/compile src/generator.cpp --check-only
bash ../scripts/compile src/interactor.cpp --check-only
bash ../scripts/compile src/validator.cpp --check-only
