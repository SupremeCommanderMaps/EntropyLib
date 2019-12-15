# EntropyLib

[![Build Status](https://travis-ci.org/JeroenDeDauw/EntropyLib.svg?branch=master)](https://travis-ci.org/JeroenDeDauw/EntropyLib)

A Lua library for [Supreme Commander Forged Alliance Forever][FAF].

This library was created based on often needed code in survival maps.

## Usage

Most files contain classes that can be instantiated via the newInstance constructor.

```lua
local myTextPrinter = import('some/path/TextPrinter.lua').newInstance()

myTextPrinter.print("hello")
myTextPrinter.print("world")
```

The public interface of the class can be found by looking at the return value of `newInstance`.

Function level organization is bottom-up so tools recognize calls to already defined functions.
This means to understand the code within a class you likely want to start at the bottom, since
the top might have a number of low level private functions.

## Updates and contributing

You can find the latest version of the library on the [EntropyLib GitHub project][GitHub], which is
also the place where you can file issues, post feature request, and submit patches.

### Running the tests

Some of the code that does not bind to FA(F) directly is tested using the
[Busted unit testing framework][Busted]. To run the tests on Linux, execute `busted` in the project
root directory. To run them on Windows, well, I don't know how to work with Windows.

If you have Docker and Docker Compose installed, you can run the tests with

    docker-compose run --rm app busted

[FAF]: http://www.faforever.com/
[GitHub]: https://github.com/JeroenDeDauw/EntropyLib/
[Busted]: http://olivinelabs.com/busted/
[Entropy]: https://entropywins.wtf/