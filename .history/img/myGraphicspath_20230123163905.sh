#!/bin/bash

PATH="./Task*.png"

echo -n \\graphicspath{{./}

for i in $PATH; do
    echo -n \{$i/\}
done

echo \}

