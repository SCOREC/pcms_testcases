for trial in Cyclone* ; do
    size=$(echo $trial | sed 's/^.*\.//')
    for comp in core edge ; do
        prefix="baseline,$size,$comp,"
        for timefile in $trial/$comp/timing_0*txt.00* ; do
            step=$(echo $timefile | sed 's/^.*_0//' | sed 's/\..*$//' | sed 's/^0*//')
            prefix="baseline,$size,$comp,$step,"
            awk '/\"MAIN_LOOP\"/ {print '"\"$prefix\""' $5}' $timefile 
        done
     done
done
