// GM-NDS
// Because YYG decided to make GM-SDS obsolete *very* quickly

function Stack() constructor {
	type = ds_type_stack;
	ds = [];
	for (var i=0;i<argument_count;i++) {
		array_push(ds,argument[i]);
	}
	/// @function push(val,...)
	static push = function() {
	    for (var i=0;i<argument_count;i++) {
			array_push(ds,argument[i]);	
		}
	}
	// @function pop()
	static pop = function() {
		return array_pop(ds);
		
	}
	// @function size()
	static size = function() {
		return array_length(ds);	
	}
	// @function empty()
	static empty = function() {
		ds = [];
	}
	// @function top()
	static top = function() {
		if (array_length(ds)) {
			return ds[array_length(ds)-1]	
		}
		return undefined;
	}
	// @function clear()
	static clear = function()  {
		var new_stack = new Stack();
		array_copy(new_stack.ds,0,ds,0,array_length(ds));
		return new_stack;
	}
}

function Queue() constructor {
	type = ds_type_queue;
	ds = [];
	for (var i=0;i<argument_count;i++) {
		array_push(ds,argument[i]);
	}
	// @function clear()
	static clear = function() {
		ds = [];	
	}
	// @function enqueue()
	static enqueue = function() {
		for (var i=0;i<argument_count;i++) {
			array_push(ds,argument[i]);	
		}
	}
	// @function dequeue()
	static dequeue = function() {
		var val = undefined;
		if (array_length(ds)) {
			val = ds[0];
			array_delete(ds,0,1);
		}
		return val;
	}
	// @function size()
	static size = function() {
		return array_length(ds);	
	}
	// @function empty()
	static empty = function() {
		ds = [];
	}
	// @function head()
	static head = function() {
		if (array_length(ds)) {
			return ds[0];
		}
		return undefined;
	}
	// @function tail()
	static tail = function() {
		if (array_length(ds)) {
			return ds[array_length(ds)-1];	
		}
		return undefined;
	}
	// @function copy()
	static copy = function() {
		var new_queue = new Queue();
		array_copy(new_queue.ds,0,ds,0,array_length(ds));
		return new_queue;
	}
}

function Priority() constructor {
	type = ds_type_priority;
	ds = [];
	static sortfn = function(a,b) {
		if (a.priority < b.priority) {
			return -1;
		}
		if (a.priority > b.priority) {
			return 1;
		}
		return 0;
	}
	/// @function push(val, priority)
	static push = function(val,priority) {
		array_push(ds,{val: val,priority: priority});
		array_sort(ds,sortfn);
	}
	// @function insert()
	static insert = function(val, priority) {
		for (var i=0;i<array_length(ds);i++) {
			if (ds[i].priority < priority) {
				return array_insert(ds,i,{val:val,priority:priority});
			}
		}
		array_push(ds,{val:val,priority:priority});
	}
	// @function size()
	static size = function() {
		return array_length(ds);
	}
	// @function change_priority()
	static change_priority = function(val,priority) {
		for (var i=0;i<array_length(ds);i++) {
			if (ds[i].val == val) {
				ds[i].priority = priority;
				break;
			}
		}
		array_sort(ds,sortfn);
	}
	// @function clear()
	static clear = function() {
		ds = [];
	}
	// @function copy()
	static copy = function() {
		var new_priority = new Priority();
		for (var i=0;i<array_length(ds);i++) {
			new_priority.push(ds[i].val,ds[i].priority);
		}
		return new_priority;
	}
	// @function empty()
	static empty = function() {
		ds = [];
	}
	// @function delete_min()
	static delete_min = function() {
		array_delete(ds,0,1);
	}
	// @function delete_max()
	static delete_max = function() {
		array_pop(ds);	
	}
	// @function delete_value()
	static delete_value = function(val) {
		for (var i=0;i<array_length(ds);i++) {
			if (ds[i].val == val) {
				array_delete(ds,i,1);
				break;
			}
		}
	}
	// @function find_min()
	static find_min = function() {
		if (array_length(ds)) {
			return ds[0].val;
		}
		return undefined;
	}
	// @function find_max()
	static find_max = function() {
		if (array_length(ds)) {
			return ds[array_length(ds)-1].val;	
		}
		return undefined;
	}
	// @function find_priority()
	static find_priority = function(priority) {
		for (var i=0;i<array_length(ds);i++) {
			if (ds[i].priority == priority) {
				array_delete(ds,i,1);
				break;
			}
		}
	}
}


function nds_save(nds) {
	var _nds_struct = {
	    type: nds.type,
		values: nds.values
	};
	return json_stringify(nds_struct);
}
function nds_load(nds_string) {
	var _nds_struct	= json_parse(nds_string);
	var _nds = undefined;
	switch (_nds_struct.type) {
		case ds_type_stack:
			_nds = new Stack();
			array_copy(_nds.ds,0,_nds_struct.ds,0,array_length(_nds_struct));
		break;
		case ds_type_queue:
			_nds = new Queue();
			array_copy(_nds.ds,0,_nds_struct.ds,0,array_length(_nds_struct));
		break;
		case ds_type_priority:
			_nds = new Priority();
			array_copy(_nds.ds,0,_nds_struct.ds,0,array_length(_nds_struct));
		break;
	}
	return _nds;
}


