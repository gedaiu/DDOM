module DOM.DOMTokenList;

import core.vararg;

class DOMTokenList
{
	public ulong length() {
		return 0;
	}

	string item(ulong index) {
		return "";
	}

	bool contains(string token) {
		return false;
	}

	void add(...) {

	}

	void remove(...) {

	}

	bool toggle(string token, bool force = false) {
		return false;
	}

	override string toString() {
		return "";
	}
}

