/// base class for BaseView and Layout
Item {
	property int count; 					///< number of children elements
	property bool trace;					///< output debug info in logs: layouts, item positioning

	property int spacing;					///< spacing between adjanced items, pixels
	property int currentIndex;				///< index of current focused item
	property int contentWidth;				///< content width
	property int contentHeight;				///< content height
	property bool keyNavigationWraps;		///< key navigation wraps from first to last and vise versa
	property bool handleNavigationKeys;		///< handle navigation keys, move focus

	///@private
	constructor: {
		this.count = 0
	}

	///@private
	function _scheduleLayout() {
		this._context.delayedAction('layout', this, this._doLayout)
	}

	///@private
	function _doLayout() {
		this._processUpdates()
		this._layout()
	}

	///@private
	function _processUpdates() { }

	onSpacingChanged,
	onRecursiveVisibleChanged: {
		if (this.recursiveVisible)
			this._scheduleLayout()
	}
}
