#!/usr/bin/dmd -run
/* sh style script syntax is supported! */
/* Hello World in D
   To compile:
     dmd hello.d
   or to optimize:
     dmd -O -inline -release hello.d
   or to get generated documentation:
     dmd hello.d -D
  */
import std.stdio;  // References to  commonly used I/O routines.
void main(char[][] args)   // 'void' here means return 0 by default.
{
    // Write-Formatted-Line
     writefln("Hello World, "   // automatic concatenation of string literals
              "Reloaded");
     // Strings are denoted as a dynamic array of chars 'char[]'
     // auto type inference and built-in foreach
     foreach(argc, argv; args)
    {
        // OOP is supported, of course! And automatic type inference.
         auto cl = new CmdLin(argc, argv);
 
        // 'writefln' is the improved 'printf' !!
         // user-defined class properties.
         writefln(cl.argnum, cl.suffix, " arg: %s", cl.argv);
        // Garbage Collection or explicit memory management - your choice!!!
         delete cl;
    }
     // Nested structs, classes and functions!
     struct specs
    {
        // all vars. automatically initialized
         int count, allocated;
    }
 
    // Note that declarations read right-to-left. 
    // So that 'char[][]' reads as an array of an array of chars.

    specs argspecs(char[][] args)
    // Optional (built-in) function contracts.
     in{
        assert (args.length > 0); // assert built in
     }
    out(result){
        assert(result.count == CmdLin.total);
        assert(result.allocated > 0);
    }
    body{
        specs* s = new specs;
        // no need for '->'
         s.count = args.length;  // The 'length' property is number of elements.
         s.allocated = typeof(args).sizeof; // built-in properties for native types
         foreach(argv; args)
            s.allocated += argv.length * typeof(argv[0]).sizeof;
        return *s;
    }
 
    // built-in string and common string operations, e.g. '~' is concatenate.
     char[] argcmsg  = "argc = %d";
    char[] allocmsg = "allocated = %d";
    writefln(argcmsg ~ ", " ~ allocmsg,
         argspecs(args).count,argspecs(args).allocated);
}
/**
   Stores a single command line argument.
 */
 class CmdLin
{
    private {
     int _argc;
     char[] _argv;
     static uint _totalc;
    }
 
 public:
/************
      Object constructor.
      params:
        argc = ordinal count of this argument.
        argv = text of the parameter
  *********/
     this(int argc, char[] argv)
    {
        _argc = argc + 1;
        _argv = argv;
        _totalc++;
    }
 
    ~this() /// Object destructor
     {
        // Doesn't actually do anything for this example.
     }
 
     int argnum() /// A property that returns arg number
     {
        return _argc;
    }
     char[] argv() /// A property  that returns arg text
     {
        return _argv;
    }
     wchar[] suffix() /// A property  that returns ordinal suffix
     {
        wchar[] suffix;  // Built in  Unicode strings (utf8,utf16, utf32)
         switch(_argc)
        {
        case 1:
            suffix = "st";
            break;
        case 2:
            suffix = "nd";
            break;
        case 3:
            suffix = "rd";
            break;
        default:  // 'default' is mandatory with "-w" compile switch.
             suffix = "th";
        }
        return suffix;
    }
 
/* **************
      * A property of the whole class, not just an instance.
      * returns: The total number of commandline args added.
      *************/
     static typeof(_totalc) total()
    {
        return _totalc;
    }
     // Class invariant, things that must be true after any method is run.
     invariant
     {
         assert(_argc > 0);
         assert(_totalc >= _argc);
     }
}
