#!/usr/bin/env python3

def structure():
    print("""\
    Structure
     n      x
    ---    ---
     a     100
""")

def main():
    p = 100

    print()
    structure()
    print()

    q = input("Which value are you wanting? n|x ").strip().lower()

    if q == "n":
        x = float(input("Ok then what is the 'x' value? "))
    else:
        n = float(input("Ok then what is the 'n' value? "))

    a = float(input("And what is the 'a' value? The amount you need the percentage of?? "))

    if q == "n":
        n = (x * a) / p
        print(f"\nYour value is {n}")
    else:
        x = (n * p) / a
        print(f"\nYour value is {x}%")

if __name__ == "__main__":
    main()
