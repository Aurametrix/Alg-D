/++ for arrays-only version +/
/// import std.stdio, std.algorithm, std.array, std.range;
/*********************************
 * In-place version allocates the auxiliary memory on the stack, better for the garbage collector, 
 * but at risk of stack overflow
 */
/// import std.stdio, std.algorithm, core.stdc.stdlib, std.exception, std.range;
 
import std.stdio, std.algorithm, std.array, core.stdc.stdlib, std.exception, std.range;


T[] mergeSort1(T)(in T[] D) /*pure nothrow*/ {
    if (D.length < 2)
        return D.dup;
    return [D[0 .. $ / 2].mergeSorted, D[$ / 2 .. $].mergeSorted]
           .nWayUnion.array;
}
 
 
void mergeSort(T)(T[] data) if (hasSwappableElements!(typeof(data))) {
    immutable L = data.length;
    if (L < 2) return;
    T* ptr = cast(T*)alloca(L * T.sizeof);
    enforce(ptr != null);
    ptr[0 .. L] = data[];
    mergeSort(ptr[0 .. L/2]);
    mergeSort(ptr[L/2 .. L]);
    [ptr[0 .. L/2], ptr[L/2 .. L]].nWayUnion().copy(data);
}
 
void main() {
    auto a = [3, 4, 2, 5, 1, 6];
    a.mergeSort();
    writeln(a);

    [3, 4, 2, 5, 1, 6].mergeSort1.writeln;
}
