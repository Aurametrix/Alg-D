/**
Import the std.algorithm library for the swap function, and 
the stdio libraray for printing stuff out.
*/
import std.algorithm;
import std.stdio;

// partition function  
  ulong partition(T)(T[] array) {
  if(array.length < 2) { return 0; }

  auto pivot = array[$-1];

  // increment i, and decrement j in each iteration of the while loop before using them.
  // i,j must start at the location before they are really wanted.
  //
  // negative numbers can't be hold, so -1 requires special care in the while loop
  ulong i = -1;
  ulong j = array.length-1;

  // If i == -1, it will wrap around to a really big postive number.
  // i should be tested is the 1st iteration, while -1, and the last iter. when i >= j.
  while(i < j || i == -1) {
    // Find the next element from the start that is larger or equal to the pivot element.
    //
    // The pivot at the the end of the array is a sentinel, no need to 
    // check for overrunning this array in direction.
    i += 1;
    while(array[i] < pivot) {
      i += 1;
    }

    // Find the next element from the end that is less than or equal
    // to the pivot.  Must guard against running past the i'th
    // element, since the array could be all greater than the pivot
    // If j was 0 before this, things would be bad.  That
    // is why the function asserts that the length be more than 1.
    j -= 1;
    while(i < j && array[j] > pivot) {
      j -= 1;
    }

    if(i < j && j < array.length) {
      // Swap the values pointed at by i and j.  Now, array[x] for x
      // <= i is <= pivot, and array[x] for x >= j is >= pivot.
      swap(array[i], array[j]);
    }
  }


  // We know i >= j.
  // 1) If i was incremented to be equal to j, then
  //  i = j = array.length - 1, and array[i] is the only element >=
  //  pivot.
  // 2) Or, i was incremented to j, and array[j] >= pivot from the
  //    previous iteration.  In this case, array[j] >= pivot.
  // 3) Or, i was incremented so that array[i] >= pivot, then j was
  //    decremented till j == i.  So, array[i] >= pivot.
  /// So, array[i] is always greater than or equal to the pivot after
  // the while loop.  And, array[i-1] is less than or equal to pivot,
  // if i > 0.

  // Swap the pivot into the right place.  Everything to the left is
  // <= pivot.  Every thing to the right is >= pivot.
  swap(array[i], array[$-1]);
  // Return the pivot location
  return i;
}
  
/**  
       static if (ss == SwapStrategy.unstable)
            quickSortImpl!(lessFun)(r);
        else //use Tim Sort for semistable & stable
            TimSortImpl!(lessFun, Range).sort(r, null);
*/