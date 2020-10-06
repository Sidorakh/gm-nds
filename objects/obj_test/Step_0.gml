///
if (keyboard_check_pressed(ord("Q"))) {	// view stack
	show_debug_message(stack.ds);
}
if (keyboard_check_pressed(ord("W"))) {	// view queue
	show_debug_message(queue.ds);
}
if (keyboard_check_pressed(ord("E"))) {	// view priority
	show_debug_message(priority.ds);
}


if (keyboard_check_pressed(ord("1"))) {	// add to stack
	stack.push(irandom(50));
}
if (keyboard_check_pressed(ord("2"))) {	// add to queue
	queue.enqueue(irandom(50));
}
if (keyboard_check_pressed(ord("3"))) {	// add to priority
	priority.insert("value-"+string(priority.size()), irandom(50));
}


if (keyboard_check_pressed(vk_f1)) {	// pop from stack
	show_debug_message(stack.pop());
}
if (keyboard_check_pressed(vk_f2)) {	// pop from queue
	show_debug_message(queue.dequeue());	
}
if (keyboard_check_pressed(vk_f3)) {	// pop from priority
	show_debug_message(priority.find_min());
	priority.delete_min();
}
