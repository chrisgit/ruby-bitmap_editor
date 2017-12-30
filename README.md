# Bitmap editor

The idea is to produce a Ruby 2.3 program that simulates a basic interactive bitmap editor.

Bitmaps are represented as an M x N matrix of pixels with each element representing a colour. 

## Program input
The input consists of a file containing a sequence of commands, where a command is represented by a single capital letter at the beginning of the line.

Parameters of the command are separated by white spaces and they follow the command character. 

Pixel coordinates are a pair of integers: a column number between 1 and 250, and a row number between 1 and 250. Bitmaps starts at coordinates 1,1. Colours are specified by capital letters. 

## Commands
There are 6 supported commands:

 Command    | Parameters    | Description                                    
 -----------|---------------|------------------------------------------------------------------------------------
  I         | M N           | Create a new M x N image with all pixels coloured white (O)
  C         |               | Clears the table, setting all pixels to white (O)
  L         | X Y C         | Set the pixel at column X, row Y with colour (C)
  V         | X Y1 Y2 C     | Draw a vertical segment of colour (C) in column X between rows Y1 and Y2 (inclusive)
  H         | X1 X2 Y C     | Draw a horizontal segment of colour (C) in row Y between columns X1 and X2 (inclusive)
  S         |               | Show the contents of the current image
   

### Example Input file
When given an example input file

```
I 5 6 
L 1 3 A 
V 2 3 6 W 
H 3 5 2 Z 
S 
```

Expected Output: 
```
OOOOO
OOZZZ
AWOOO
OWOOO
OWOOO
OWOOO 
```

Broken down the instructions represent
* Create a bitmap with 5 columns and 6 rows
* Draw pixel at column 1 row 3 with colour A
* Draw vertical line at column 2 row 3 to row 6 colour W
* Draw horizontal line at column 3 to column 5 row 2 colour Z
* Show the resultant bitmap

## Requirements
Ruby (2.3.4 and above)

To install Ruby on Linux see https://www.ruby-lang.org/en/documentation/installation/

To install Ruby on Windows see https://rubyinstaller.org/

Or use the Ruby with Docker or ChefDK (version 2 onwards)

Bundler (optional)

## Running unit tests
Unit tests have been written with RSpec, and can be run with

```
rspec
```

or apply a formatting option

```
rspec -f d
```

individual spec files can be run be specifying the name

```
rspec -f d spec\unit\lib\commands\vline_spec.rb
```

You can also run individual specs, see https://relishapp.com/rspec/rspec-core/docs/command-line/line-number-appended-to-file-path

## Editing the bitmap
To run a set of bitmap editing instructions you must call the bitmap editor loader (bin/bitmap_editor) and supply an input file of instructions.

Therefore given an input file of examples/integration/basic.txt you can run the editor with

```  
bin/bitmap_editor examples/integration/basic.txt
```

OR if using Windows then

```  
ruby bin/bitmap_editor examples/integration/basic.txt
```

An exception will be thrown if the input file parameter is missing or the input file does not exist.

Nothing will be displayed unless you specify the Show command (see commands above)

An exception will be thrown if a command (other than Show) is called without first creating a bitmap.

Unknown instructions, i.e. those that are not in the command list are ignored and response of unknown command is output.

Any invalid instructions, i.e. too many or too little parameters, drawing with illegal colours or specifying a range out of balance will throw an exception.

## The approach

The kata has been attempted three times, on each occasion the core design has remained
* Class to represent a bitmap editor which reads commands from a file
* Class to represent bitmap with minimal functionality
* Classes to represent bitmap editor commands

However it was the testing that has changed over the three different efforts.

The kata provided a skeleton project, making the first task creating tests to the existing code so we have confidence that we've not broken anything going forward.

Solving the kata the first time round I used whitebox testing, the second attempt was a mixture of whitebox and blackbox testing and the third attempt a revision of the second. In the first two attempts I used some stubs to prototype return values (such as the Bitmap dump method) to see which works best.

Among other things a good test helps the developer when refactoring code to ensure that they do not break existing functionality. However, there are occasions where the behavior of the code does change and tests are intentionally broken.

Whether you are using a unit test tool or integration style test tool such as cucumber the steps for designing a test can (but not always) follow this patten
* Arrange - this is the setup required in order to run the test
* Act - this is the class or subject under test carrying out an action
* Assert - this is our expectation or the result of the action

Tests are good as they can sometimes identify code or design smells; for example is there too much test setup could indicate complex dependancies.

The test tool for this project is RSpec which has a powerful and simple to use framework which allows the developer to write very readable tests; and in some instances a test can be represented on a single line.

The first iteration of this kata used whitebox testing; where possible public methods were used to make assertions but in some cases the internal structure (such as class instance variables) were extracted and tested. Whitebox testing requires internal knowledge of the system which can lead to more test setup but is useful for isolating components; should the internal structure change the tests need to change. The first iteration also stubbed certain actions such as the reading of the instructions from a file in the bitmap editor (see below) but this is rare for me as I prefer to exercise as much real code as possible and keep mocking a stubbing to a minimum.

````
  context 'read file' do
    before(:each) {
      allow(File).to receive(:exist?).with('test.txt').and_return(true)
      allow(File).to receive(:open).with('test.txt').and_return(content)
    }
    context 'content is S' do
      context 'image has not been created' do
        let(:content) { StringIO.new("S\n") }
        it 'returns "There is no image" message' do
          expect { BitmapEditor.new.run('test.txt') }.to output(/There is no image/).to_stdout
        end
      end
    end
````

The second iteration of this kata attempted to use blackbox testing only; the public methods are called and results asserted upon, no internal knowledge of the classes is required. A good set of tests should identify a failure and assist in locating the system or subsystem that is failing, in order to do that the class/method or subject under test needs to be isolated; with certain types of blackbox testing it is difficult to track down the exact point of failure. For example before the colour pixel, draw horizontal or draw vertical in this kata can be tested the bitmap needs to be created; you could call the bitmap create method (or class) in your test setup but if that fails then your colour or draw method will also fail, in this case whitebox testing or stubbing at the boundaries will help isolate the failure. Unfortunately with the blackbox tests a bad refactor or change in behavior (such as changing the default colour) can result in a lot of broken tests.

For the third and final attempt I tried to test against only public methods, to assert that the bitmap has been updated some of the tests call a method on the bitmap class that outputs an array of rows (hline_spec). In some cases such as the test for the bitmap clear functionality (bitmap_spec) we have to set the bitmap to something other than the default and this requires knowing that the bitmap is stored as a single dimension array.

The bitmap_editor_spec resembles more of a set of integration tests; the tests open a file, carry out instructions and display the result; these tests will all fail if Create or Show commands fail - so it fails to isolate each component.

Authors
-------------------
Authors: Chris Sullivan
