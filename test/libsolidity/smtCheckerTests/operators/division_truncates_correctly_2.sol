pragma experimental SMTChecker;
contract C {
	function f(int x, int y) public pure {
		x = 7;
		y = 2;
		assert(x / y == 3);
	}
}
// ----
// Warning 1218: (105-123): Error trying to invoke SMT solver.
