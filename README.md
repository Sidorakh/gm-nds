# gm-nds

Because YYG couldn't help but make [gm-sds](https://github.com/Sidorakh/gm-sds) obsolete...


## Stack

| Function | Description |
| - | - |
| `Stack()` | Wrapped Stack constructor |
| `Stack.size()` | Return the size of the Stack |
| `Stack.push(value,...)` | Push one or more items to the Stack |
| `Stack.pop()` | Pop an item off the top of the Stack | 
| `Stack.top()` | Returns the item on top of the Stack, or `undefined` if the Stack is empty |
| `Stack.clear()` | Clears the Stack |


## Queue

| Function | Description |
| - | - |
| `Queue()` | Wrapped Queue constructor |
| `Queue.size()` |  Return the size of the Queue |
| `Queue.enqueue()` | Add one or multiple items to the queue |
| `Queue.dequeue()` | Pop an item off the queue |
| `Queue.head()` | Return the item at the front of the queue without removing it from the queue |
| `Queue.tail()` | Return the item at the end of the queue without removing it from the queue |


## Priority

| Function | Description |
| - | - |
| `Priority()` | Wrapped Priority Queue constructor |
| `Priority.push()` | Inserts an item into the Priority Queue in the correct position |
| `Priority.push_old()` | Inserts an item into the Priority Queue and sorts the Queue |
| `Priority.size()` | Returns the size  |
| `Priority.change_priority()` | Changes the priority of a given value (first if multiple are present) and re-sorts the Priority Queue |
| `Priority.clear()` | Clears all entries in the Priority Queue |
| `Priority.pop_min()` | Pops the minimum priority value off the Priority Queue and returns it |
| `Priority.pop_max()` | Pops the maximum priority value off the Priority Queue and returns it |
| `Priority.delete_value(val)` | Deletes the specified value from the Priority Queue if it exists |
| `Priority.find_min()` | Returns the minimum priority value from the Priority Queue |
| `Priority.find_max()` | Returns the maximum priority value from the Priority Queue |
| `Priority.find_priority(priority)` | Returns the value with the specified priority value from the Priority Queue, or `undefined` if it isn't found |


## Serializing/Deserializing

| Function | Description |
| - |- |
| `nds_save(Stack\|Queue\|Priority)` | Creates a JSON string representing a NDS |
| `nds_load(json_string)` | Returns a Stack, Queue, or Priority based on a JSON representation |

NDS JSON structure

A `type` field, declaring the structure type, as one of the following constants - actual values listed in case these need to be created outside of GMS2
| Constant | Value |
| - | - |
| `ds_type_stack` | 3 |
| `ds_type_queue` | 4 |
| `ds_type_priority` | 6 |



A `values` field, declaring the values. In a Priority queue, the values are stored in the array as separate objects or structs, like so:
```js
[
    {val:'first-value', priority:0},
    {val:'some-value', priority:1},
    {val:'another-value', priority:4},
    {val:'final-value', priority:5},
]
```

A full NDS json string would look like so:
```js
{
    "type": 6,
    "values":[
        {"val":"first-value","priority":0},
        {"val":"some-value","priority":1},
        {"val":"another-value","priority":4},
        {"val":"final-value","priority":5},
    ]
}
```





