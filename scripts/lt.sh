#!/usr/bin/env bash

echo "#!/usr/bin/env bash" > lt 

cat utils.sh >> lt

cat src/clean.sh | sed '/^clean$/d' | sed '/^source*/d' | sed '/^#/d' >> lt
cat src/update.sh | sed '/^update$/d' | sed '/^source*/d' | sed '/^#/d' >> lt

cat >> lt << ---
function lt {
    if [ "\$1" = "clean" ]
    then
        clean
    elif [ "\$1" = "update" ]
    then
        update
    else
        echo "Usage: lt [clean|update]"
    fi
}

lt "\$@"
---
