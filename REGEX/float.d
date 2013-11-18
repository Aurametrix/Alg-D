/** everything in here is optional [-+]?[0-9]*\.?[0-9]*      */

/// this one requires at least one digit [-+]?[0-9]*\.?[0-9]+.

/**
 * matches an optional sign, that is either followed by zero or more digits
 * followed by a dot and one or more digits, or one or more digits
 */

import std.stdio, std.regex;
void main(string argv[]){
    string numbers = argv[1]; //takes first argument on the command line
    if(match(numbers, r"^\[-+]?[0-9]*\.?[0-9]+."))
        writeln("Looks like there is a float in there.");
    else
        writeln("No floating point numbers given");
}

