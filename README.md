# Assignment 2: Box Office Trivia

## Introduction

The goal of this assignment is to produce OCaml code that will help you answer
a set of questions about the top-grossing films in movie history.

In this repo there are many files and subdirectories to follow
the organization that keeps Dune happy.  In short, Dune wants
a single "main.ml" file in one directory, and all the rest of the
files in a "library" directory.

Examine these files in particular:
- `lib/part1.ml`: This file contains list-processing problems for you to complete as
    part 1 of the assignment.
- `lib/query.ml`: This file is mostly blank. You will write a set of functions to
    analyze lists of movies as part 2 of the assignment.
- `main/main.ml`: This file contains the driver for the program. Don't modify this
    file, but you can take a look to see how it's organized. It uses the module
    `Arg` to parse command line arguments in a nice way.
- `lib/io.ml`: This utility file contains a set of useful routines for parsing and
    printing movie files. Don't modify it, but feel free to take a look to see
    how it's organized. If you'd like to parse and print other simple text files
    using OCaml, this code could be a starting point.
- `signature.txt`: In this file you will sign the required statement that
    "this is my own work according to University regulations," you will list
     your sources of information, and you will report your answers to the
     movie trivia questions.  Also, explain any unusual design decisions or
     problems you had here.
- `data`: This directory contains the data you need to answer the questions
    asked on this assignment. The data was downloaded and processed in May 2012,
    so it will not be up to date&mdash;films like the *The Hunger Games* will
    have continued to rack up the dollars over the last few years, and new
    movies will have been released. That's okay. In order to make it easy to
    verify your answers, use the data we provide as opposed to more recent data
    that you download from other sites. There is one file for each movie rating
    category (G, PG, PG-13, R) and one file for all-time inflation-adjusted
    gross movies. There are also a couple of small files you can use for
    testing. You will find that the data in the files comes in an arbitrary
    order.

## Part 1: Lists

*First:* In a Unix shell window, `dune build`.
There should be no error messages.
Doing this first makes VS Code error messages more useful.

Your work in part1.ml is to uncomment each
place that says UNCOMMENT ME and then
to fix all the error messages and answer the questions.

Then `dune build` should work again without reporting any errors.

## Part 2: Box Office Analysis in OCaml

The file `query.ml` is missing the implementations to many functions that you
need to code. See the file for details. Your goal should be to focus first on
this file independently of any of the other files. You will use these functions
to query just a few data files. However, we will test your functions thoroughly
when grading them (and you should test them thoroughly when writing them). They
should operate correctly on all possible inputs. At the bottom of the file there
is some sample infrastructure for unit tests that you may use as a model for
your own testing.

Since the data files you are working with are relatively small, you should not
overly concern yourself with the efficiency of your code&mdash;though needlessly
or egregiously inefficient solutions should be avoided. Your main goals are
correctness, clarity and good style. Be sure to refer to our style guide.

We suggest you implement the functions in part 2 in the following order:
1. `take`: return only the first n elements of a movie list
2. `drop`: return everything but the first n elements of a movie list
3. `average`: return the average gross of all movies
4. `decade`: return all movies produced in a given decade
5. `sort`: a polymorphic (selection) sort function
6. `sort_by_gross`: sort by gross revenue
7. `sort_by_year`: sort by year produced
8. `by_studio`: return total gross from all movies produced per studio
9. `sort_by_studio`: sort list of studio-gross revenue pairs by gross revenue

## Part 3: Answering the Box Office Trivia Questions

Scripting is a kind of functional programming: Scripts take data files (often
representing lists) as inputs and produce new data files as outputs. Like
functions in a functional program, scripts often compose: you can pipe the
output on stdout of one script into the input on stdin of another script.

When you have finished coding and thoroughly testing the functions in
`query.ml`, compile the entire application by typing `dune build` at a shell
prompt in your Git root directory. To find out what you can do with your script,
type the following at a shell prompt.

```
./boxoffice -help
```

You should see a list of options you can use. As a simple check to make sure
things are working properly, type the following:

```
./boxoffice -echo < data/trial1.txt
```

That should send the contents of the `trial1.txt` data file out on
to standard output. 

Another command you might try is below. What should it do?

```
./boxoffice -take 1 < data/G.txt
```

Recall that the pipe operator (vertical bar) allows you to send the output of
one command in to the input of another command. With that in mind, what does the
following do?

```
./boxoffice -sort-gross < data/G.txt | ./boxoffice -take 1
```

**To Do:** Use your script to answer the questions about boxoffice trivia posed
in the `signature.txt` file. In addition to reporting the answers to the
questions, report the scripting commands you used to find the answers. Try to
make the script do as much work as you can. If possible, use a series of calls
to your script to produce only the data you need to answer the question and no
more. (This may not be possible.)

## Hand-in Instructions

This problem set is to be done individually.

Your assignment will be automatically submitted every time you push your changes
to your GitHub repository. Within a couple minutes of your submission, the
autograder will make a comment on your commit listing the output of our testing
suite when run against your code. **Note that you will be graded only on your
changes to `part1.ml` and `query.ml`**, and not on your changes to any other
files.

You may submit and receive feedback in this way as many times as you like,
whenever you like.

## Important notes about grading

1. **Rec:** For this assignment, you may add the `rec` keyword to any of the
    `let` statements that define functions if you would like the function to
    call itself. And in the other direction, a function for which we have given
    you a `let rec` needn't call itself, for example, if you have defined a
    recursive auxiliary function to use instead.
2. **Modules:** For this assignment, you should not use functions from the
    `List` module, nor the built-in `@` operator. You should code these
    functions "from first principles" using recursion. Do not use functions from
    any module as a reference to help you re-implement these functions.
3. **Compile errors:** All programs that you submit must type check and compile.
    **Programs that do not compile will be subject to a penalty in addition to
    the deduction for the bug that causes the failure to compile**. If you are
    having trouble getting your assignment to compile, please visit office
    hours. If you run out of time, it is better to comment out the parts that do
    not compile and hand in a file that compiles, rather than handing in a more
    complete file that does not compile.
4. **Missing functions:** We will be using an automatic grading script, so it is
    crucial that you name your functions and order their arguments according to
    the problem set instructions, and that you place the functions in the
    correct files. Otherwise you may not receive credit for a working but
    misnamed function.
5. **Code style:** Finally, please pay attention to style. Refer to the
    [OCaml style guide](https://www.cs.princeton.edu/courses/archive/fall22/cos326/style.php)
    and lecture notes. Ugly code is not fun to debug, nor to grade. Take the
    extra time to think through the problems and find the most elegant solutions
    before coding them up. Good programming style is also required on all the
    subsequent assignments.
