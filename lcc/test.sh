#!/bin/bash
assert() {
	expected="$1"
	input="$2"

	./lcc "$input" > tmp.s
	cc -o tmp tmp.s
	./tmp
	actual="$?"

	if [ "$actual" = "$expected" ]; then
		echo "$input => $actual"
	else
		echo "$input => $expected expected, but got $actual"
		exit 1
	fi
}

# add at step1
assert 0 0
# add at step2
assert 42 42
# add at step3
assert 21 "5+20-4"
# add at step 4
assert 41 " 12 + 34 - 5 "

echo OK