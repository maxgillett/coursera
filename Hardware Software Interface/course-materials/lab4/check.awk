function check(val, expected) {
    if (val != expected) {
        print name " check failed"
        exit 1
    }
}

/Cache block size:/ {
    check($4, block_size)
    next
}

/Cache size:/ {
    check($3, cache_size)
    next
}

/Cache associativity:/ {
    check($3, cache_assoc)
    next
}

// { exit 1 } # Extra lines fail test
