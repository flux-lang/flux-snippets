// vim: syntax=rust 

/*

sorting algorithms

*/

// maybe need more specific typing, like Comparable or smth
// sorts list in place

// adapted from https://www.rosettacode.org/wiki/Sorting_algorithms/Quicksort

fn quicksort(list as List[Any], start=0, stop=length(list)) {
    if stop - start > 0 {
        let [ left, right ] = [start, stop];
        pivot = list[start]; 
        while left <= right {
            while list[left] < pivot {
                left += 1;
            };
            while list[right] > pivot {
                right -= 1;
            };
            if left <= right {
                swap(&list[left], &list[right]);
                left += 1;
                right -= 1;
            }
        };
        quicksort(list, 0, right);
        quicksort(list, left, length(list))
    };
}