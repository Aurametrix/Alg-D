import std.stdio;
import std.random;
 
int position;
bool step()
{
    bool r = rand() > (uint.max / 2);
    if(r)
        writefln("Climbed up to %d", ++position);
    else
        writefln("Fell down to %d", --position);
    return r;
}

void step_up()
{
    while(!step)
        step_up;
}

void step_up_nr()
{
    for(uint i = 0; i < 1; step ? ++i : --i) {};
}

void main()
{
    rand_seed(0, 0); // to make it somewhat repeatable
    step_up;
}
