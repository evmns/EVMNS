
# Solidity Coding Specifications


  >This guide is intended to provide for writing a coding specification for Solidity. As requirements evolve, new and more appropriate specifications may be added, and old ones that do not fit will be discarded.

## Coding specification
### Overview

This guide is intended to provide a coding specification for writing Solidity. It will evolve as requirements evolve, new and more appropriate specifications may be added, and old ones that do not fit will be discarded.

Of course, many projects may have their own coding specifications, so if there are conflicts, refer to your project's coding specifications.

Much of the structure and specification advice in this guide comes from python's pep8 coding specification.

This guide does not say that solidity coding must be done in full accordance with the guidelines, but rather provides an overall consistency requirement, which is similar to the pep8 philosophy: mandatory consistency is stupid.

The purpose of this guide is to provide consistency in coding styles, so the idea of consistency is important, even more so in projects, and most important within the same function or module. The most important thing is to know when to be consistent and when not to be consistent, because sometimes this guide doesn't work, and you need to make trade-offs based on your own needs. See the examples below to decide which one is best for you.

## Code layout
### Indent

Each line is indent by four Spaces

### tab or space
Space is the preferred indent
Do not use tabs and Spaces together
Enter (blank line)
Add two blank lines between two contracts
Compliant way:

    contract A {

        ...}

    contract B {

    ...}

    contract C {

    ...}

Non-compliant way:

    contract A {
    
    . }contract B {
    
    . }
    
    contract C {
    
    . }

A Enter is required between functions in the contract, or two Enters if the function declaration and the function implementation are together

Compliant way:

    contract A {
    
        function spam();
    
        function ham();
    
        }
    
    contract B is A {
    
        function spam() {
    
            ...

        }

        function ham() {
    
            ...
    
        }

    }

Non-Compliant way:

    contract A {
    
    function spam() {
    
    ...
    
    }
    
    function ham() {
    
    ...
    
    }}

Source file coding mode
UTF-8 or ASCII ecoding is preferred

introduce
The introduction declaration is usually made at the beginning of the code

Compliant way:

    import "owned";
    
    contract A {

    ...}

    contract B is owned {

    ...}

Non-Compliant way:

    contract A {
    
        ...}

    import "owned";
    
    contract B is owned {
    
        ...}

How Spaces are used in expressions

Do not use Spaces in the following scenarios

Avoid using Spaces after parentheses, brackets, and curly braces
The way the Yes specification works: `spam(ham[1], Coin({name: “ham”}));`

No non-standard way: `spam( ham[ 1 ], Coin( { name: “ham” } ) );`

Avoid Spaces before commas and semicolons
The way the Yes specification works: `function spam(uint i, Coin coin);`

No non-standard way:`function spam(uint i , Coin coin) ;`

Avoid multiple Spaces before and after the assignment
Compliant way:

    x = 1;

    y = 2;

long_variable = 3;
Non-Compliant way:

    x             = 1;
    
    y             = 2;

long_variable = 3;
Control structure

Contract, library, function, structure curly braces use method:

The open curly brace is the same line as the declaration

The close parenthesis and the open parenthesis declaration remain in the same indent position.

Enter after the open parenthesis

Compliant way:

    contract Coin {
    
        struct Bank {
    
            address owner;
    
            uint balance;
    
        }
    
    }
Non-Compliant ways:

    contract Coin
    
    {
    
        struct Bank {
    
            address owner;
    
            uint balance;
    
        }
    
    }
The advice above also applies to if, else, while, and for.

In addition, there must be a blank line between the if, while, and for conditional statements

Compliant way:

    if (...) {
    
        ...
    
    }
    
    for (...) {
    
        ...
    
    }
Non-Compliant way:

    if (...)
    
    {
    
        ...
    
    }
    
    while(...)
    
    {
    
    }
    
    for (...)
    
    {
    
        ...;
    
    }
You don't need parentheses if you only have a single statement inside the control structure.

Compliant way:
    
    if (x < 10)
    
    x += 1;

Non-Compliant ways:
    if (x < 10)
    
        someArray.push(Coin({
    
            name: 'spam',
    
            value: 42
    
        }));
For an if statement if it contains an else or an else if statement, the else statement gets a new line. else and else if have the same internal specification as if.

Compliant way:

    if (x < 3) {
    
        x += 1;
    
    }
    
    else {
    
        x -= 1;
    
    }
    
    if (x < 3)
    
        x += 1;
    
    else
    
        x -= 1;
Non-Compliant way:
    
    if (x < 3) {
    
        x += 1;} 
    
    else {
    
        x -= 1;}
Function declaration
For short function declarations, it is recommended to place the open parenthesis of the function body on the same line as the function name.

The closing parenthesis and the function declaration keep the same indentation.

Add a space between the open parenthesis and the function name.

Compliant way:
    function increment(uint x) returns (uint) {
    
        return x + 1;
    
    }
    
    function increment(uint x) public onlyowner returns (uint) {
    
        return x + 1;
    
    }
Non-Compliant ways:
    
    function increment(uint x) returns (uint)
    
    {
    
        return x + 1;
    
    }
    
    function increment(uint x) returns (uint)
    
    {
    
        return x + 1;
    
    }
    
    function increment(uint x) returns (uint)
    
    {
    
        return x + 1;
    
    }
    
    function increment(uint x) returns (uint)
    
    {
    
        return x + 1;
    
    }
Default modifiers should be placed before other custom modifiers.

Compliant way:
    
    function kill() public onlyowner {
    
    selfdestruct(owner);
    
    }
Non-Compliant ways:

    function kill() onlyowner public {
    
        selfdestruct(owner);
    
    }
For function declarations with many arguments, all arguments can be displayed line by line, with the same indentation. The close parenthesis of the function declaration is placed on the same line as the open parenthesis of the function body, and is indented as the function declaration.

Compliant way:

    function thisFunctionHasLotsOfArguments(
    
        address a,
    
        address b,
    
        address c,
    
        address d,
    
        address e,
    
        address f,
    
    ) {
    
        do_something;
    
    }
Non-compliant way:

    function thisFunctionHasLotsOfArguments(address a, address b, address c,
    
        address d, address e, address f) {
    
        do_something;
    
    }

    function thisFunctionHasLotsOfArguments(address a,
    
                                            address b,
    
                                            address c,
    
                                            address d,
    
                                            address e,
    
                                            address f) {
    
        do_something;
    
    }
    
    function thisFunctionHasLotsOfArguments(
    
        address a,
    
        address b,
    
        address c,
    
        address d,
    
        address e,
    
        address f) {
    
        do_something;
    
    }
If the function includes more than one modifier, you need to break the modifier and indent it line by line. The open parenthesis of the function body should also be divided.

Compliant way:

    function thisFunctionNameIsReallyLong(address x, address y, address z)
    
        public
    
        onlyowner
    
        priced
    
        returns (address)
    
    {
    
        do_something;
    
    }
    
    function thisFunctionNameIsReallyLong(
    
        address x,
    
        address y,
    
        address z,)
    
        public
    
        onlyowner
    
        priced
    
        returns (address)
    
    {
    
        do_something;
    
    }
Non-compliant way:

    function thisFunctionNameIsReallyLong(address x, address y, address z)
    
                                          public
    
                                          onlyowner
    
                                          priced
    
                                          returns (address) {
    
        do_something;
    
    }
    
    function thisFunctionNameIsReallyLong(address x, address y, address z)
    
        public onlyowner priced returns (address){
    
        do_something;
    
    }
    
    function thisFunctionNameIsReallyLong(address x, address y, address z)
    
        public
    
        onlyowner
    
        priced
    
        returns (address) {
    
        do_something;
    
    }
For derived contracts that require arguments as constructors, if the function declaration is too long or difficult to read, it is recommended that the constructors in their constructors that involve the base class be displayed separately.

Compliant way:

    contract A is B, C, D {
    
        function A(uint param1, uint param2, uint param3, uint param4, uint param5)
    
            B(param1)
    
            C(param2, param3)
    
            D(param4)
    
        {
    
            // do something with param5
    
        }
    
    }
Non-compliant way:

    contract A is B, C, D {
    
        function A(uint param1, uint param2, uint param3, uint param4, uint param5)
    
        B(param1)
    
        C(param2, param3)
    
        D(param4)
    
        {
    
            // do something with param5
    
        }
    
    }
    
    contract A is B, C, D {
    
        function A(uint param1, uint param2, uint param3, uint param4, uint param5)
    
            B(param1)
    
            C(param2, param3)
    
            D(param4) {
    
            // do something with param5
    
        }
    
    }
The programming specification for function declarations is mainly for readability. It is impossible to include all programming specifications in this guide. For areas not covered, programmers can use their own subjective initiative.

### Variable declaration

For array variable declarations, the type and array parentheses cannot have Spaces directly.

Compliant way: `uint[] x;` 

Non-compliant way: `uint [] x;`

### Other suggestions

The assignment operator should be flanked by a space
Normative way:

`x = 3;x = 100 / 10;x += 3 + 4;x |= y && z;`

Non-compliant way:

`x=3;x = 100/10;x += 3+4;x |= y&&z;`

To display the priority, there is a space between the priority operator and the lower priority operator, also to improve the readability of complex declarations. The number of Spaces on either side of the operator must be consistent.
Normative way:

`x = 2**3 + 5;x = 2***y + 3*z;x = (a+b) * (a-**b);`

Non-Compliant way:

`x = 2** 3 + 5;x = y+z;x +=1;`

### Naming Specifications

Naming Specifications are powerful and widely used, and using different naming conventions can convey different information.

The following suggestions are intended to improve the readability of the code, so the specification is not a rule but is intended to help explain the code better.

Finally, consistency in coding style is most important.

### Naming method

To prevent confusion, the following names are used to illustrate (describe) the different naming methods.

  b (single lowercase letter)

  B (single uppercase letter)

  Lowercase

  Lowercase with an underline

  uppercase

  Uppercase with an undersline

  CapWords specifications (capitalized first letter)

  Mixed mode (unlike CapitalizedWords, the first letter is lowercase!)

  Capitalize the first letter of an underscore (note: not recommended for python)

### Attention

When using CapWords canonical (uppercase) abbreviations, the abbreviations are all capitalized. For example, HTTPServerError is a little easier to understand than HttpServerError.

Avoid naming methods

  l-Lowercase letter el. L-lowercase letter el

  O - Uppercase letter oh Uppercase o

  I - Uppercase letter eye Indicates the uppercase i

Never use the characters' l '(lowercase el),' O '(uppercase oh), or' I '(uppercase eye) as single-character variable names. In some fonts these characters are not distinguishable from the numbers 1 and 0. Try using 'l' instead of 'L'.

### Naming of contracts and libraries

Contracts should be formally named with CapWords (capitalized).

### events

Events should be named using the CapWords specification (capitalized).

### Function naming

Function names use mixed case

Function parameter naming

When defining a library function on a custom structure, the name of the structure must be self-explanatory.

### Constant naming

Constants are all uppercase letters separated by underscores.

### Modifier naming

Functional modifiers use lowercase characters separated by underscores.

### Avoid conflict

Single underscore ending
This specification is recommended when there is a conflict with a built-in or reserved name.
