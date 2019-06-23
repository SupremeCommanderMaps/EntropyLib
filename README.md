Common lua code for FAF maps

Most files contain classes that can be instantiated via the newInstance constructor.

```
local myTextPrinter = import('some/path/TextPrinter.lua').newInstance()

myTextPrinter.print("hello")
myTextPrinter.print("world")
```

The public interface of the class can be found by looking at the return value of `newInstance`.

Function level organization is bottom-up so tools recognize calls to already defined functions.
This means to understand the code within a class you likely want to start at the bottom, since
the top might have a number of low level private functions.