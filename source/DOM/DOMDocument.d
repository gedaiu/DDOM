module DOM.DOMDocument;

public import DOM.DOMNode, DOM.HTMLCollection;

class DOMDocument : DOMNode
{
	private string _URL;
	private string _documentURI;
	private string _compatMode;
	private string _characterSet;
	private string _contentType;
		
	private DOMDocumentType _doctype;
	private DOMElement documentElement;

	HTMLCollection getElementsByTagName(string localName) {
		return new HTMLCollection;
	}

	HTMLCollection getElementsByTagNameNS(string namespace, string localName) {
		return new HTMLCollection;
	}

	HTMLCollection getElementsByClassName(string classNames) {
		return new HTMLCollection;
	}

	
	DOMElement createElement(string localName) {
		return new DOMElement(localName);
	}

	DOMElement createElementNS(string namespace, string qualifiedName) {
		return new DOMElement(namespace);
	}

	DOMDocumentFragment createDocumentFragment() {
		return new DOMDocumentFragment;
	}

	DOMText createTextNode(string data)  {
		return new DOMText;
	}

	DOMComment createComment(string data) {
		return new DOMComment;
	}
	

	DOMProcessingInstruction createProcessingInstruction(string target, string data) {
		return new DOMProcessingInstruction;
	}


	DOMNode importNode(DOMNode node, bool deep = false)  {
		return node;
	}

	DOMNode adoptNode(DOMNode node)  {
		return node;
	}
		
	//[NewObject] Event createEvent(string interface);
	
	//[NewObject] Range createRange();
	
	// NodeFilter.SHOW_ALL = 0xFFFFFFFF
	// [NewObject] NodeIterator createNodeIterator(Node root, optional unsigned long whatToShow = 0xFFFFFFFF, optional NodeFilter filter = null);
	//[NewObject] TreeWalker createTreeWalker(Node root, optional unsigned long whatToShow = 0xFFFFFFFF, optional NodeFilter filter = null);


	this()
	{
		// Constructor code
	}
}

