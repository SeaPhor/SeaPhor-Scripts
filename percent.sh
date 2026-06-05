#!/bin/bash
structure () {
    cat <<EOT
    Structure
     n      x
    ---    ---
     a     100
EOT
}
echo ""
structure
echo ""

declare -i p=100
read -p "Which value are you wanting? n|x " q
if [[ $q == "n" ]]; then
    read -p "Ok then what is the 'x' value? " x
else
    read -p "Ok then what is the 'n' value? " n
fi
read -p "And what is the 'a' value? The amount you need the percetage of?? " a

for f in n x a ; do declare -i $f=$f; done

if [[ $q == "n" ]]; then
    p1="$(expr $x \* $a)"
    n="($p1 / $p)"
    echo -e "\nYour value is $n"
else
    p1="$(expr $n \* $p)"
    x="($p1 / $a)"
    echo -e "\nYour value is $x%"
fi
exit 0
