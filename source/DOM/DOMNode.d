module DOM.DOMNode;

public import DOM.DOMDocument, DOM.DOMTokenList, DOM.DOMAttr;
import std.conv, std.string, std.stdio;


abstract class DOMNode
{
	enum Type {
		Element,
		Text, 
		ProcessingInstruction,
		Comment,
		Document,
		DocumentType,
		DocumentFragment
	};

	enum DocumentPosition {
		Disconected,
		Preceding,
		Following,
		Contains,
		ContainedBy,
		ImplementationSpecific
	}

	private Type _nodeType;
	private string _nodeName;
	private string _baseURI;

	private DOMDocument _ownerDocument;
	private DOMNode _parentNode;
	private DOMElement _parentElement;

	bool hasChildNodes() {
		return false;
	}


	/++
	 + Get the node type
	 +/
	@property
	private Type nodeType() {
		return this._nodeType;
	}

	private DOMNode[] _childNodes;
	private DOMNode firstChild;
	private DOMNode lastChild;
	private DOMNode previousSibling;
	private DOMNode nextSibling;
	
	private string _nodeValue;
	private string _textContent;

	void normalize() {

	}

	bool isEqualNode(DOMNode node) {
		return false;
	}

	DocumentPosition compareDocumentPosition(DOMNode other) {
		return DocumentPosition.ContainedBy;
	}

	bool contains(DOMNode other) {
		return false;
	}
	
	string lookupPrefix(string namespace) {
		return "";
	}

	string lookupNamespaceURI(string prefix) {
		return "";
	}

	bool isDefaultNamespace(string namespace) {
		return false;
	}

	abstract DOMNode cloneNode(bool deep = false);
	abstract DOMNode insertBefore(DOMNode node, DOMNode child);
	abstract DOMNode appendChild(DOMNode node);
	abstract DOMNode replaceChild(DOMNode node, DOMNode child);
	abstract DOMNode removeChild(DOMNode child);

	this()
	{
		// Constructor code
	}

	/++
	 + Parse a node
	 +/
	static DOMNode Parse(string data);
}

/++
 + DOM Element
 + 
 + Link: http://www.w3.org/TR/dom/#element
 +/
class DOMElement : DOMNode {

	private string _namespaceURI;
	private string _prefix;
	private string _localName;
	private string _tagName;
	
	public string id;

	@property
	public string className() {
		return _classList.to!string;
	}

	/++
	 + create node
	 +/
	this(string tagName) {
		_tagName = tagName;
	}

	/++
	 + create node with children
	 +/
	this(string tagName, DOMNode[] childNodes) {
		this(tagName);
		_childNodes = childNodes;
	}

	private DOMTokenList _classList;
	private DOMAttr[] _attributes;

	//string getAttribute(string name) {}
	//string getAttributeNS(string namespace, string localName);
	//void setAttribute(string name, string value);
	//void setAttributeNS(string namespace, string name, string value);
	//void removeAttribute(string name);
	//void removeAttributeNS(string namespace, string localName);
	//boolean hasAttribute(string name);
	//boolean hasAttributeNS(string namespace, string localName);
	
	bool matches(string selectors) {
		return false;
	}
	
	HTMLCollection getElementsByTagName(string localName) {
		return new HTMLCollection();
	}

	HTMLCollection getElementsByTagNameNS(string namespace, string localName) {
		return new HTMLCollection();
	}

	HTMLCollection getElementsByClassName(string classNames)  {
		return new HTMLCollection();
	}

	override DOMNode cloneNode(bool deep = false) {
		return this;
	}

	override DOMNode insertBefore(DOMNode node, DOMNode child) {
		return this;
	}

	override DOMNode appendChild(DOMNode node) {
		return this;
	}

	override DOMNode replaceChild(DOMNode node, DOMNode child) {
		return this;
	}

	override DOMNode removeChild(DOMNode child) {
		return this;
	}

	override string toString() {
		string result = "";

		result = "<" ~ _tagName ~ ">";

		foreach(i; 0.._childNodes.length) {
			result ~= _childNodes[i].to!string;
		}

		result ~= "</" ~ _tagName ~ ">";
		return result;
	}
}




class DOMDocumentFragment : DOMNode {

	override DOMNode cloneNode(bool deep = false) {
		return this;
	}
	
	override DOMNode insertBefore(DOMNode node, DOMNode child) {
		return this;
	}
	
	override DOMNode appendChild(DOMNode node) {
		return this;
	}
	
	override DOMNode replaceChild(DOMNode node, DOMNode child) {
		return this;
	}
	
	override DOMNode removeChild(DOMNode child) {
		return this;
	}
}


class DOMCharacterData : DOMNode {
	private string data;

	private long length();

	string substringData(ulong offset, ulong count) {
		return "";
	}

	void appendData(string data) {}
	void insertData(ulong offset, string data) {}
	void deleteData(ulong offset, ulong count) {}
	void replaceData(ulong offset, ulong count, string data) {}


	override DOMNode cloneNode(bool deep = false) {
		return this;
	}
	
	override DOMNode insertBefore(DOMNode node, DOMNode child) {
		return this;
	}
	
	override DOMNode appendChild(DOMNode node) {
		return this;
	}
	
	override DOMNode replaceChild(DOMNode node, DOMNode child) {
		return this;
	}
	
	override DOMNode removeChild(DOMNode child) {
		return this;
	}

	override string toString() {
		return data;
	}
};


/++
 + A text node 
 + 
 + Link: http://www.w3.org/TR/dom/#text
 +/
class DOMText : DOMCharacterData {
	DOMText splitText(ulong offset) {
		return new DOMText();
	}

	string wholeText() {
		return "";
	}

	this() {
		_nodeType = Type.Text;
	}

	this(string text) {
		this();

		data = text;
	}


	override DOMNode cloneNode(bool deep = false) {
		return this;
	}
	
	override DOMNode insertBefore(DOMNode node, DOMNode child) {
		return this;
	}
	
	override DOMNode appendChild(DOMNode node) {
		return this;
	}
	
	override DOMNode replaceChild(DOMNode node, DOMNode child) {
		return this;
	}
	
	override DOMNode removeChild(DOMNode child) {
		return this;
	}
}

class DOMComment : DOMCharacterData {

	override DOMNode cloneNode(bool deep = false) {
		return this;
	}
	
	override DOMNode insertBefore(DOMNode node, DOMNode child) {
		return this;
	}
	
	override DOMNode appendChild(DOMNode node) {
		return this;
	}
	
	override DOMNode replaceChild(DOMNode node, DOMNode child) {
		return this;
	}
	
	override DOMNode removeChild(DOMNode child) {
		return this;
	}
}

class DOMProcessingInstruction : DOMCharacterData {
	private string _target;


	override DOMNode cloneNode(bool deep = false) {
		return this;
	}
	
	override DOMNode insertBefore(DOMNode node, DOMNode child) {
		return this;
	}
	
	override DOMNode appendChild(DOMNode node) {
		return this;
	}
	
	override DOMNode replaceChild(DOMNode node, DOMNode child) {
		return this;
	}
	
	override DOMNode removeChild(DOMNode child) {
		return this;
	}
}

class DOMDocumentType : DOMNode {
	private string _name;
	private string _publicId;
	private string _systemId;


	override DOMNode cloneNode(bool deep = false) {
		return this;
	}
	
	override DOMNode insertBefore(DOMNode node, DOMNode child) {
		return this;
	}
	
	override DOMNode appendChild(DOMNode node) {
		return this;
	}
	
	override DOMNode replaceChild(DOMNode node, DOMNode child) {
		return this;
	}
	
	override DOMNode removeChild(DOMNode child) {
		return this;
	}
};

/++
 + check if the given character is a whitespace
 +/
bool isWhitespace(const char c) {
	if(c == ' ' || c == '\n' || c == '\r' || c == '\t') {
		return true;
	}

	return false;
}

/++
 + Check if the next char is a closing tag
 +/
long nextCloseTag(const string data, ulong start = 0) {

	foreach(i; start..data.length) {
		if(data[i] == '>') return i;
		if(i+1 < data.length && data[i] == '/' && data[i+1] == '>') return i;

		if(!data[i].isWhitespace) {
			return -1;
		}
	}

	return -1;
}

unittest {
	assert("".nextCloseTag == -1);
	assert("asd>".nextCloseTag == -1);
	assert("  \n\r\tasd".nextCloseTag == -1);
	assert("  \n\r\t>".nextCloseTag == 5);
	assert("  \n\r\t/>".nextCloseTag == 5);
}

/++
 + Remove all the duble whitespaces
 +/
string fixWhiteSpaces(const string data, const bool onlyInTags = false) {
	string result;
	ulong isWhite = 0;

	bool inTag = false;
	bool inQuote = false;
	char quote = ' ';

	foreach(i; 0..data.length) {

		if(!data[i].isWhitespace) {
			isWhite = 0;
		}

		//check if we are in a tag
		if(data[i] == '<') inTag = true;
		if(data[i] == '>') inTag = false;

		//check if we can add the char
		if((!onlyInTags && isWhite < 1) || (onlyInTags && inTag && isWhite < 1) || (onlyInTags && !inTag) || inQuote) {
			result ~= data[i];
		}

		//check open tag
		if(data[i] == '<') isWhite = 1;


		//check quote
		if(inTag && !inQuote && (data[i] == '"' || data[i] == '\'')) {
			inQuote = true;
			quote = data[i];
		} else if(inQuote && data[i] == quote) {
			inQuote = false;
		}

		//check close tag
		auto closeTag = nextCloseTag(data, i+1);
		if(closeTag != -1) {
			i = closeTag-1;
		}

		//check white spaces
		if(data[i].isWhitespace && !inQuote) {
			isWhite++;
		}
	}

	return result;
}

unittest {
	assert("".fixWhiteSpaces == "");
	assert("  ".fixWhiteSpaces == " ");
	assert("  word ".fixWhiteSpaces == " word ");

	assert("  \n\n  ".fixWhiteSpaces == " ");
	assert("\n \r\n\t ".fixWhiteSpaces == "\n");
	assert("\t\t\t".fixWhiteSpaces == "\t");

	assert(" ".fixWhiteSpaces == " ");
	assert("\r".fixWhiteSpaces == "\r");
	assert("\n".fixWhiteSpaces == "\n");
	assert("\t".fixWhiteSpaces == "\t");

	assert("    <   b   ></b>   ".fixWhiteSpaces(true) == "    <b></b>   ");
	assert("    <   b   class='class1  \n class2'  ></b>   ".fixWhiteSpaces(true) == "    <b class='class1  \n class2'></b>   ");
}

/++
 + Parse some elements from a DOM
 +/
DOMNode[] parseDOMPortion(string data) {
	//check if is a document
	data = data.fixWhiteSpaces;

	DOMNode[] nodeList;

	while(data.length > 0) {
		//look for text node
		if(data[0] != '<') {
			long end = 0;

			foreach(i;0..data.length) {
				if(data[i] != '<') {
					end++;
				} else {
					break;
				}
			}

			DOMText node = new DOMText(data[0..end]);

			nodeList ~= node;
			data = data[end..$];
		} else {
			//look for other nodes

			//is element
			nodeList ~= [ data.parseDOMElement ];
		}
	}
		
	return nodeList;
}

DOMElement parseDOMElement(ref string data) {
	//look for the element type
	long end = 0;

	foreach(i;0..data.length) {
		if(data[i] == ' ') {
			end = i-1;
			break;
		} else if(data[i] == '>') {
			end = i;
			break;
		}
	}

	string name = data[1..end];
	data = data[end+1..$];
	DOMNode[] childList;

	//look for the end tag
	long i = 0;
	while(i < data.length) {
		if(i+3+name.length < data.length && data[i..i+3+name.length] == "</"~name~">") {
			end = i;
			break;
		} else if(data[i] == '<') {
			//add the text
			childList ~= new DOMText(data[0..i]);

			//add the nodes
			data = data[i..$];
			childList ~= data.parseDOMElement;

			end = 0;
			i=0;
		} else {
			i++;
		}
	}

	if(end > 0) childList ~= data[0..end].parseDOMPortion;

	data = data[end+3+name.length..$];

	auto elm = new DOMElement(name, childList);

	return elm;
}

//test text parsing
unittest {
	DOMNode[] elm = "".parseDOMPortion;
	assert(elm.length == 0);
	
	elm = "some text".parseDOMPortion;
	assert(elm[0].nodeType  == DOMNode.Type.Text);
	assert(elm[0].to!string == "some text");
}


//test text and element parsing
unittest {
	auto elm = "some text <b >important text</b> other text".parseDOMPortion;

	assert(elm[0].nodeType  == DOMNode.Type.Text);
	assert(elm[0].to!string == "some text ");

	assert(elm[1].nodeType  == DOMNode.Type.Element);
	assert(elm[1].to!string == "<b>important text</b>");

	assert(elm[2].nodeType  == DOMNode.Type.Text);
	assert(elm[2].to!string == " other text");

	elm = "some text <b>important <b>text</b></b> other text".parseDOMPortion;
	assert(elm[0].nodeType  == DOMNode.Type.Text);
	assert(elm[0].to!string == "some text ");
	assert(elm[1].nodeType  == DOMNode.Type.Element);
	assert(elm[1].to!string == "<b>important <b>text</b></b>");
	assert(elm[2].nodeType  == DOMNode.Type.Text);
	assert(elm[2].to!string == " other text");
}
 
