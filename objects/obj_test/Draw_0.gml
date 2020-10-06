/// @description 
var _str;

_str = "Stack: \n";
for (var i=0;i<stack.size();i++) { 
	_str += string(i) + " | " + string(stack.ds[i]) + "\n";
}

draw_text(4,4,_str);


_str = "Queue: \n";
for (var i=0;i<queue.size();i++) { 
	_str += string(i) + " | " + string(queue.ds[i]) + "\n";
}

draw_text(132,4,_str);


_str = "Priority: \n";
for (var i=0;i<priority.size();i++) { 
	_str += string(i) + " | " + string(priority.ds[i]) + "\n";
}

draw_text(260,4,_str);
