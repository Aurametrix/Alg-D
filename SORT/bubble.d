import std.stdio;

/**
*   BubbleSort implementation in D
**/
class BubbleSort {

    int[]   tobsorted;
    public:

    /**
    * Constructor
    **/
    this(int[] array) {
        tobsorted           = array;
    }

    int[] sort() {

        // Iterate through every element in array
        foreach( inout int x; tobsorted) {

            // 2nd iteration through array, comparing elements with each other
            foreach(inout int y; tobsorted) {

                // comare elements to each other
                // If element x < y
                // swap elements
                if(x < y) {
                    debug writefln("swap(%d,%d)", x,y);
                    typeof(x) temp = x;
					x = y;
                    y    = temp;
                }
            }

            // Output current array to console
            foreach(int i; tobsorted) {
                writef("%02d ",i);
            }

            // append newline
            writefln();
        }

        // return sorted array
        return tobsorted;
    }
}

/** Explains itself
*   Initialize int-array with 15 elements
*   Then calls BubbleSort and outputs the sorted array
**/
int main(char[][] args) {

    // initialize array

    static int[]    array   = [15,4,3,14,5,2,1,8,7,19,15,13,9,12,6,11];

    writefln("BubbleSort in D");
    writefln("---------------");
    writef("Sorting following numbers:\t");
    foreach(int i; array) {
        writef("%02d ",i);
    }
    writefln("\nStarting now...");
    writefln();

    BubbleSort  s   = new BubbleSort(array);
    array           = s.sort();

    writefln();
    writefln("I finished!");
    writef("Here's your sorted array:\t");
    foreach(int i; array) {
        writef("%02d ",i);
    }

    return 0;
}
