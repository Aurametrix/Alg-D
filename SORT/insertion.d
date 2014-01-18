void insertionSort(T)(T[] data) pure nothrow {
    foreach (i, value; data[1 .. $]) {
        auto j = i + 1;
        for ( ; j > 0 && value < data[j - 1]; j--)
            data[j] = data[j - 1];
        data[j] = value;
    }
}
 
void main() {
    import std.stdio;
    auto items = [18, 34, 26, 44, 19, 2, 57, 1, 25, 14];
    items.insertionSort();
    writeln(items);
}
