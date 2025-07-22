var handle<string,int> &my_class = this_thread::get_id();
int myvalue = 0;
int myvalue2 = 0;
int myvalue3 = 0;
if (!my_class.is_null()) {
myvalue = this->get_data("test_data");
myvalue2 = this->get_data("test_data2");
myvalue3 = this->get_data("test_data3");
}

Note: All class-based associative accesses are done in the same thread that the simulation is running. Therefore, it is not possible to store any data in class-based associative accesses.

## 7.4.2.8.4. Array of Associative Access Methods¶

This example shows how to use different methods of associative access methods within an array of associative accesses.

## 7.4.2.8.5. Non-Array of Associative Access Methods¶

In the following example, we create an associative access method and use it to change the value of the associative access.

## 7.4.2.8.6. Array of Associative Access Methods with Class-Based Associative Access¶

This example shows how to create class-based associative accesses within an array of associative accesses.

## 7.4.2.8.7. Array of Associative Access Methods with Class-Based Associative Access and Thread-Based Associative Access¶

In this example, we create class-based associative accesses within an array of associative accesses. We change the value of the associative access inside a class method.

## 7.4.2.8.8. Associative Access Methods with Class-Based Associative Access and Thread-Based Associative Access¶

In this example, we create an array of class-based associative accesses and change the value of the associative access inside a class method.

In the following example, we create an array of associative access methods and use them to change the values of the associative access methods.

In the following example, we create an associative access method and use it to change the value of the associative access method.

## 7.4.2.8.9. Associative Access Method with Class-Based Associative Access¶

This example shows how to use an associative access method with class-based associative access.

## 7.4.2.8.10. Array of Associative Access Methods with Thread-Based Associative Access¶

In this example, we create an array of thread-based associative accesses and change the value of the associative access method inside a thread method.

In the following example, we create an associative access method with thread-based associative access.

In the following example, we create an associative access method and use it to change the value of the associative access method within a thread.