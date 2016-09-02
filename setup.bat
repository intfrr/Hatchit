@echo off

IF NOT EXIST  %~dp0build mkdir build

cd build

IF NOT EXIST %cd% mkdir ThirdParty

IF "%1" == "-hatchit" (
    cmake ../ -G "Visual Studio 14 2015 Win64"
)

IF NOT "%1" == "-hatchit" (
    cd ThirdParty

    cmake ../../ThirdParty -G "Visual Studio 14 2015 Win64" -DDIRECTX=NO -DASSIMP_BUILD_ASSIMP_TOOLS=NO
    msbuild.exe ThirdPartyLibs.sln /p:Configuration=Debug
    msbuild.exe ThirdPartyLibs.sln /p:Configuration=Release

    cd ..

    cmake ../ -G "Visual Studio 14 2015 Win64"
)