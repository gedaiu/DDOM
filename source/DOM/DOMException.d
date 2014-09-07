module source.ctHtml.DOMException;

import std.conv;

class DOMException : Exception {

	enum DOMExceptionCode {
		IndexSizeError =  "The index is not in the allowed range.	INDEX_SIZE_ERR (1)",
		HierarchyRequestError = "The operation would yield an incorrect node tree.	HIERARCHY_REQUEST_ERR (3)",
		WrongDocumentError = "The object is in the wrong document.	WRONG_DOCUMENT_ERR (4)",
		InvalidCharacterError = "The string contains invalid characters.	INVALID_CHARACTER_ERR (5)",
		NoModificationAllowedError = "The object can not be modified.	NO_MODIFICATION_ALLOWED_ERR (7)",
		NotFoundError = "The object can not be found here.	NOT_FOUND_ERR (8)",
		NotSupportedError = "The operation is not supported.	NOT_SUPPORTED_ERR (9)",
		InvalidStateError = "The object is in an invalid state.	INVALID_STATE_ERR (11)",
		SyntaxError = "The string did not match the expected pattern.	SYNTAX_ERR (12)",
		InvalidModificationError = "The object can not be modified in this way.	INVALID_MODIFICATION_ERR (13)",
		NamespaceError = "The operation is not allowed by Namespaces in XML. [XMLNS]	NAMESPACE_ERR (14)",
		InvalidAccessError = "The object does not support the operation or argument.	INVALID_ACCESS_ERR (15)",
		SecurityError = "The operation is insecure.	SECURITY_ERR (18)",
		NetworkError = "A network error occurred.	NETWORK_ERR (19)",
		AbortError = "The operation was aborted.	ABORT_ERR (20)",
		URLMismatchError = "The given URL does not match another URL.	URL_MISMATCH_ERR (21)",
		QuotaExceededError = "The quota has been exceeded.	QUOTA_EXCEEDED_ERR (22)",
		TimeoutError = "The operation timed out.	TIMEOUT_ERR (23)",
		InvalidNodeTypeError = "The supplied node is incorrect or has an incorrect ancestor for this operation.	INVALID_NODE_TYPE_ERR (24)",
		DataCloneError = "The object can not be cloned.	DATA_CLONE_ERR (25)",
		EncodingError = "The encoding operation (either encoded or decoding) failed.",
		NotReadableError = "The I/O read operation failed."
	};

	public this(DOMExceptionCode code, string file = __FILE__, size_t line = __LINE__) {

		super(code.to!string, file, line);
	}
}