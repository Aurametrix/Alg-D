// Implementation of Euclid’s algorithm
ulong gcd(ulong a, ulong b) { 
    while (b) {
        auto t = b; b = a % b; a = t;
    }
    return a; 
}

ulong primeFactorsOnly(ulong n) {
    ulong accum = 1;
    ulong iter = 2;
    
    for (; n >= iter * iter; iter += 2 - (iter == 2)) {
        if (n % iter) continue;
        accum *= iter;
        do n /= iter; while (n % iter == 0);
    }
    return accum * n;
}

bool properLinearCongruentialParameters(ulong m, ulong a, ulong c) { 
    // Bounds checking
    if (m == 0 || a == 0 || a >= m || c == 0 || c >= m) return false; 
    // c and m are relatively prime
    if (gcd(c, m) != 1) return false;
    // a - 1 is divisible by all prime factors of m
    if ((a - 1) % primeFactorsOnly(m)) return false;
    // If a - 1 is multiple of 4, then m is a multiple of 4, too. 
    if ((a - 1) % 4 == 0 && m % 4) return false;
    // Passed all tests
    return true;
}
