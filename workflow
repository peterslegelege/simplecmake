Skip to content
DiracResearch
/
dodsp

Type / to search

Code
Issues
Pull requests
Actions
Projects
Security
Insights
ubuntu-22.04
Update sonarcloud.yml #36
Jobs
Run details
Workflow file for this run
.github/workflows/ubuntu-22.04.yaml at b8676be
name: ubuntu-22.04

on:
  push:
    branches: [ "master" ]
  pull_request:
    branches: [ "master" ]

env:
  # Customize the CMake build type here (Release, Debug, RelWithDebInfo, etc.)
  BUILD_TYPE: Release

jobs:
  build:
    # The CMake configure and build commands are platform agnostic and should work equally well on Windows or Mac.
    # You can convert this to a matrix build if you need cross-platform coverage.
    # See: https://docs.github.com/en/free-pro-team@latest/actions/learn-github-actions/managing-complex-workflows#using-a-build-matrix
    runs-on: ubuntu-22.04

    steps:
    - uses: actions/checkout@v3

    - name: Configure CMake
      # Configure CMake in a 'build' subdirectory. `CMAKE_BUILD_TYPE` is only required if you are using a single-configuration generator such as make.
      # See https://cmake.org/cmake/help/latest/variable/CMAKE_BUILD_TYPE.html?highlight=cmake_build_type
      run: cmake -B ${{github.workspace}}/build -DCMAKE_BUILD_TYPE=${{env.BUILD_TYPE}}

    - name: Build
      # Build your program with the given configuration
      run: cmake --build ${{github.workspace}}/build --config ${{env.BUILD_TYPE}} -j 8 2> >(tee "output.txt")

    - name: Test
      working-directory: ${{github.workspace}}/build
      # Execute tests defined by the CMake configuration.
      # See https://cmake.org/cmake/help/latest/manual/ctest.1.html for more detail
      run: ctest -C ${{env.BUILD_TYPE}} -L UNITTEST -j 8
    - name: Post PR comment for warnings/errors
      if: always()
      uses: JacobDomagala/CompileResult@master
      with:
        comment_title: ubuntu-22.04 warnings
        compile_result_file: output.txt
        
Update sonarcloud.yml · DiracResearch/dodsp@b8676be 