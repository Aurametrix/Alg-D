import std.stdio, std.regex;
void main(string argv[]){
    string phone = argv[1]; //takes first argument on the command line
    if(match(phone, r"^\+[1-9][0-9]* [0-9 ]*$"))
        writeln("Looks like a phone number.");
    else
        writeln("This is not a phone number.");
}
