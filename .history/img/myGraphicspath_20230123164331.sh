#!/bin/bash

PATH="./img/Task*"

echo -n \\graphicspath{{./}

for i in $PATH; do
    echo -n \{$i/\}
done

echo \}

