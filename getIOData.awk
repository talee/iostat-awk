#!/bin/awk -f
# Extract iostat data columns into their separate files for graphing, etc.
# Requires iostat data to be all numbers, separated by whitespace
BEGIN {
    dev = 0;
}
{
    if (dev == 0) {
        print $1 > "data/_user"
        print $2 > "data/_nice"
        print $3 > "data/_system"
        print $4 > "data/_iowait"
        print $5 > "data/_steal"
        print $6 > "data/_idle"
        dev=1;
    } else {
        print $1 > "data/tps"
        print $2 > "data/kB_read_s"
        print $3 > "data/kB_wrtn_s"
        print $4 > "data/kB_read"
        print $5 > "data/kB_wrtn"
        dev=0;
    }
}
