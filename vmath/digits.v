module vmath

import vsl.errno

// digits returns an array of the digits of n in the given base.
pub fn digits(_n int, base int) []int {
	if base < 2 {
		errno.vsl_panic('cannot find digits of n with base $base', .edom)
	}
	mut n := _n
	mut sign := 1
	if n < 0 {
		sign = -1
		n = -n
	}
	mut res := []int{}
	for n != 0 {
		res << (n % base) * sign
		n /= base
	}
	return res
}
