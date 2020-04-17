# todo_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# NOTES on building a To-Do app in Flutter  

1. Using `Map` - It is a collection of key value pairs where in you have to define the type of the key and the value. It helps to transform the data. It can be used in a helper function. We can retrieve a value via its key.  

## Common Dependencies
Some of the common dependencies used in the flutter app:  

**sqflite** - The database plugin  

**path_provider** - Finds commonly used locations on the file system. It is different on iOS and Android Devices.   

**intl** - Internationalization package. Includes date/number formatting and parsing.  

## SINGLETON
When you need a class to instantiate only once, for example DbHelper class, you make it a singleton. The class contains methods to retrieve the database and reads/writes over it. Therefore, once you call it, you only need it once.  

A singleton restricts the instantiation of a class to 1 instance only.  

Use `factory` keyword to create a constructor in the class and this factory constructor will override thed default constructor.  
![image](https://user-images.githubusercontent.com/18363595/79313419-ec180e00-7f1d-11ea-87d9-afc09ab1fa1f.png)

## Async programming in flutter  
![image](https://user-images.githubusercontent.com/18363595/79314485-5aa99b80-7f1f-11ea-9207-2b183213628c.png)

When you start the app, a single thread or path of execution is automatically created. This is the MAIN thread. The MAIN thread is also called the UI thread, because one of its responsibilites is to show populate all the UI widgets and responding to user input.  

For example - when you touch the screen, its the MAIN thread that deals with the appropriate response, raising the appropriate events, executing the animations and executing any code that runs on interaction with the button.  

If you run long operations, like network access or DB queries on the MAIN thread, the app may get unresponsive and the user can get the feeling that the app is slow.  

If the app does not respond to a user event like screen touch for more than 5 seconds, the app OS may automatically respond with "Application Not Responding" message. 

In order to run long operations without slowing down, you can delegate some tasks to another thread, so that 2 parts of our app can work in parallel. Now this is called MULTI THREADING. 

In flutter, async programming is done using:
1. Future  
2. Async/Await  

## FUTURE (like Promises in JS)
A `Future` represents a means for getting a value sometime in the future.  When the execution of code inside the Future finishes, only then the `then()` gets fired. Just like Promises in JS.  

## ASYNC/AWAIT
The async/await keywords allow you to write async code that looks like sync code.  

If the async fails, it returns a `Future` wrapped around a `null` value.  

# LIST VIEW
A scrollable list of widgets arranged linearly. List View is the most commonly used scrolling widget.

# FLOATING ACTION BUTTON
A floating action button is a circular icon button that hovers over content to promote a primary action button in the application.  

# NAVIGATION
Navigation in flutter is based on a stack. The stack has pages/screens that the app has used from the beginning. When you want to change the screen, you call an object `Navigator`. This has 2 methods:  
1. push()  -> Go to a particular/next screen. Therefore, you need to specify the route i.e. the page you want to load.  
2. pop()  -> Go back  

Flutter has `MaterialPageRoute` class which helps to achieve this. Both `push()` and `pop()` requires the current context.  

# DROPDOWN BUTTON
The DropdownButton `onChanged` expects a function. If given `null` while developing UI, the Dropdown list items will not be shown. 



# Do's and Dont's
1. First create the UI and then the functionality - onPress, onChanged, etc...  
2. Make sure you are following a new tutorial as many tutorials will have depreciated packages.   

