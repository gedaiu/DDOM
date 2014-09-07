module DOM.HTMLCollection;

public import DOM.DOMNode;

class HTMLCollection
{
	private DOMElement[] list;
	private ulong _length;

	DOMElement item(ulong index) {
		return list[index];
	}

	DOMElement namedItem(string name) {
		return list[0];
	}

	this()
	{
		// Constructor code
	}

}

