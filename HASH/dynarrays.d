void main() {
    int[] ints;
    ints.reserve(100);
    foreach(i; 0..100) {
        ints ~= i;
    }
}

import core.memory;
void* intsPtr = GC.malloc(int.sizeof * 100);
auto ints = (cast(int*)intsPtr)[0 .. 100];

