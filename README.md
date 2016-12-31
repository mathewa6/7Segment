7Segment
========

<img src="https://raw.githubusercontent.com/mathewa6/7Segment/master/Screenshot.png" align = "right" width="300">

Emulating a 7-Segment display in Swift.

This project was created to practise the following:

* Complex Auto-Layout constraints such as ensuring all segment in the 7-segment display align and re-size correctly.
* Bit manipulation and bitwise operations in Swift.
* Implementing 7-segment logic without using cascading if-else.

## Setup ##


- Include the contents of the ``` 7Segment Classes```(All classes with SG prefix) group in Xcode into the project.
- Add an instance of ``` SGSevenSegmentViewController ``` to your ViewController as a childViewController.
- Call ``` display(value: x) ``` where x is an Int between 0-15. Illegal values simply display a '-'.

