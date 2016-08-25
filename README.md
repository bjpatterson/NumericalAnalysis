# Numerical Analysis Codebase
## Code related to BSU's Math 562 course

Code in this repository is ~entirely written for Octave

## Continuous Integration Testing
This repo makes use of [MOxUnit](https://github.com/MOxUnit/MOxUnit) and [Travis-ci](https://travis-ci.org/) for automated CI testing

### MOxUnit Setup notes:
- Files copied into this repo:
  - The `MOxUnit` directory (the one with source code)
  - The `MoxUnit makefile` (called upon to set up the Travis-ci run)
  - The `.travis.yml` file
  - *(The `MOxUnit` unit tests are intentionally omitted because not all of them were passing on the current build at the time of inclusion)*
- Edits made to get CI working:
  - `.travis.yml` is pointed to `NumericalAnalysis` as the source directory instead of `MOxUnit`
  - `NumericalAnalysis` and `NumericalAnalysis/functions` are added to the octave build path in `MOxUnit/moxunit_set_path`
