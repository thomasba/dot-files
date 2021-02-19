#!/usr/bin/env python3
# vim: set noet ts=4:

import sys
import optparse

translations = {
			0:  "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
			1:  "bcdefghijklmnopqrstuvwxyzaBCDEFGHIJKLMNOPQRSTUVWXYZA",
			2:  "cdefghijklmnopqrstuvwxyzabCDEFGHIJKLMNOPQRSTUVWXYZAB",
			3:  "defghijklmnopqrstuvwxyzabcDEFGHIJKLMNOPQRSTUVWXYZABC",
			4:  "efghijklmnopqrstuvwxyzabcdEFGHIJKLMNOPQRSTUVWXYZABCD",
			5:  "fghijklmnopqrstuvwxyzabcdeFGHIJKLMNOPQRSTUVWXYZABCDE",
			6:  "ghijklmnopqrstuvwxyzabcdefGHIJKLMNOPQRSTUVWXYZABCDEF",
			7:  "hijklmnopqrstuvwxyzabcdefgHIJKLMNOPQRSTUVWXYZABCDEFG",
			8:  "ijklmnopqrstuvwxyzabcdefghIJKLMNOPQRSTUVWXYZABCDEFGH",
			9:  "jklmnopqrstuvwxyzabcdefghiJKLMNOPQRSTUVWXYZABCDEFGHI",
			10: "klmnopqrstuvwxyzabcdefghijKLMNOPQRSTUVWXYZABCDEFGHIJ",
			11: "lmnopqrstuvwxyzabcdefghijkLMNOPQRSTUVWXYZABCDEFGHIJK",
			12: "mnopqrstuvwxyzabcdefghijklMNOPQRSTUVWXYZABCDEFGHIJKL",
			13: "nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM",
			14: "opqrstuvwxyzabcdefghijklmnOPQRSTUVWXYZABCDEFGHIJKLMN",
			15: "pqrstuvwxyzabcdefghijklmnoPQRSTUVWXYZABCDEFGHIJKLMNO",
			16: "qrstuvwxyzabcdefghijklmnopQRSTUVWXYZABCDEFGHIJKLMNOP",
			17: "rstuvwxyzabcdefghijklmnopqRSTUVWXYZABCDEFGHIJKLMNOPQ",
			18: "stuvwxyzabcdefghijklmnopqrSTUVWXYZABCDEFGHIJKLMNOPQR",
			19: "tuvwxyzabcdefghijklmnopqrsTUVWXYZABCDEFGHIJKLMNOPQRS",
			20: "uvwxyzabcdefghijklmnopqrstUVWXYZABCDEFGHIJKLMNOPQRST",
			21: "vwxyzabcdefghijklmnopqrstuVWXYZABCDEFGHIJKLMNOPQRSTU",
			22: "wxyzabcdefghijklmnopqrstuvWXYZABCDEFGHIJKLMNOPQRSTUV",
			23: "xyzabcdefghijklmnopqrstuvwXYZABCDEFGHIJKLMNOPQRSTUVW",
			24: "yzabcdefghijklmnopqrstuvwxYZABCDEFGHIJKLMNOPQRSTUVWX",
			25: "zabcdefghijklmnopqrstuvwxyZABCDEFGHIJKLMNOPQRSTUVWXY"
		}

def main():
	usage = "rot.py [-n n] <string>"
	parser = optparse.OptionParser(usage=usage)
	parser.add_option('-n', action='store', type="int", help='Rotate by n (0 <= n <= 26)', )
	options, args = parser.parse_args()
	s = ""
	if len(args) == 0:
		print("Please provide a string!")
		sys.exit(1)
	elif len(args) == 1:
		s = args[0]
	else:
		s = " ".join(args)

	if options.n is not None:
		if 1 <= options.n <= 25:
			rot = str.maketrans("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", translations[options.n])
			t = str.translate(s, rot)
			print(f"rot({options.n:2d}): {t}")
		elif options.n == 0 or options.n == 26:
			print(f"rot({options.n:2d}): {s}")
		else:
			print("Valid range for n: 0 to 26! 0 equals 26")
			sys.exit(1)
	else:
		print(f"rot( 0): {s}")
		for i in range(1,26):
			rot = str.maketrans("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", translations[i])
			t = str.translate(s, rot)
			print(f"rot({i:2d}): {t}")

if __name__ == '__main__':
	main()
