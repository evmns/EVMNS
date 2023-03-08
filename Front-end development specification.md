## What is specificaiton?
What is specification?
Specification, in terms of nouns is the standard stipulated or established by common practice, such as moral standards, technical standards, etc. In terms of verbs: it refers to the operation according to the established standards and requirements, so that a certain behavior or activity can reach or exceed the prescribed standards, such as standardized management, standardized operation.

## Why do we need specifications?

- Reduce the cost of new members joining the team, while avoiding potential problems to some extent;
- Improve development efficiency and team collaboration efficiency, reduce communication costs;
- Achieve a high degree of unified code style, facilitate review, on the other hand, can improve the maintainability of the project;
- Standard is the basis for automation;
- Standard is a direct output of team knowledge precipitation.

## What does the specification include?

As mentioned earlier, the Front-end Collaboration Specifications do not only refer to 'coding standards', which involve all aspects of front-end development activities, such as code library management, front-end and back-end collaboration, code specifications, compatibility specifications;

Not only do we need collaboration within the front-end team, but also throughout the full software life cycle, we need to collaborate with product/design, back-end (or native client team), and testing, and we need to cover these topics.

Now let's start to introduce, if you are the leader of the front-end team, how do I make the front-end standard, what content does this specification need to include?

## 1、Front-end development specifications
Outline the front-end development specifications from the following aspects

- Directory Structure Specification
- Code Naming Specification
- Documentation Writing Specification

### 1.1、Directory Structure Specification
#### 1.1.1、Design purpose
Keep the directory structure consistent with project development to facilitate project construction and management.
#### 1.1.2、Resource classification

1. Source Code Resources: Refers to the source code written by developers, including HTML, CSS, template, etc.

2. Content Resources: Refers to resources that are intended to be provided to visitors as content, including images, fonts, flash, PDF, etc., the most commonly used should be the readme.md file.

#### 1.1.3、Specific Specification
We construct directories from naming principles, root directories, business logic, etc.

##### （1）Naming Principle


    - Clear and concise:
      * src: source code
      * img: image, images
      * js: JavaScript scripts
      * dep: development package 
    - No plurals:
      * No imgs, docs

##### （2）Root directory structure is divided according to functions.

    - src: source code (logic)
    - doc: documentation
    - dep: third-party dependency packages
    - test: test code

##### （3）Divide folders according to business logic.

    - src  Directory explanation：
    - common  Common resources
    - public/static Static resources
    - component  Components
    - view/tpl Template files

    -- src
      -- common Common resources
        -- img
          -- logo.png
          -- sprites.png
        -- css
          -- reset.css
        -- js
          -- conf.js Project Configuration File
      -- public/static Static resources
        -- js
        -- css
        -- tpl
          -- index.html
          -- shopcar.html
        -- img
      -- component Components
        -- home
        -- shopcar
        -- login
        -- register
        -- user
        -- list
        -- detail
      -- view/tpl Project Template, tpl is the abbreviation of template.

##### （4）Summary

The above catalog development standards can be used in two ways：

- Use front-end engineering tools such as webpack, gulp, etc., to build manually
- Use scaffolding tools provided with the frame to modify

### 1.2、Front-end code specification
We will explain this part from the following two aspects：

- CSS naming specification
  - BEM specification
  - OOCSS specification
- Java Script specification
  - ESLint
  - JSLint

#### 1.2.1、CSS Naming Specifications
##### (1)BEM specification

Concept: Block Element Modifier, a front-end naming method designed to help developers achieve modular, reusable, highly maintainable, and structured CSS code. BEM is a naming convention that defines a css class. Each name and its components have a certain meaning. 

With the BEM naming specification, there is theoretically only one selector per line of css code. 

BEM stands for block, element, and Modifier. Modifier is one of the three entities we use to develop components. In the selector, the extended relationship is represented by the following three symbols:

    -   Hyphen: Used only as a hyphen to denote a link between multiple words of a block or child element；
    __  Double underscores: Double underscores are used to connect blocks to their children；
    _   Single underline: A single underline describes the state of a block or a block's child elements；

    example：type-block__element_modifier

**block**

A block is part of a design or layout that has a specific and unique meaning, either semantically or visually.

In most cases, any individual page element (complex or simple) can be treated as a block. Its HTML container will have a unique CSS class name, which is the name of the block.

The CSS class name for the block is prefixed (ui-), which acts like a namespace in CSS.

The formal (actually semi-formal) definition of a block has three basic principles:

1. Only the class name (not the ID) can be used in the CSS. 
2. Each block name should have a namespace (prefix). 
3. Each CSS rule must belong to a block.

**element**

A child element in a block is a child element of a block, and a child element of a child element is also considered a direct child element of a block in bem. The class name of an element in a block must be prefixed with the name of the parent block.

In the example above, li.item is a child of the list,，

    .list{}
    .list .item{}
    
    .list{}
    .list__item{}

**modifier**

A "modifier" can be understood as a specific state of a block, indicating that it holds a specific property.

An example is the best way to explain it. A block representing a button has three default sizes: small, medium, and large. To avoid creating three different blocks, it is best to add modifiers to the blocks. The modifier should have a name (for example, size) and a value (small, normal, or big).

In the example above, represents a selected list and an active list item

    .list{}
    .list.select{}
    .list .item{}
    .list .item.active{}
    
    .list{}
    .list_select{}
    .list__item{}
    .list__item_active{}

**Writing principle**

1. In principle, no more than 2 levels of selector nesting should occur
   Using the BEM principle, decoupling with names, all class names in one layer, increases efficiency and reusability

2. The nesting of two layers of selectors appears in the.mod-xxx item current child, as follows:

Use the recommended nesting method

**Common writing:** 
    
    .xxx{}
    .xxx__item{}
    .xxx__item_current{}
    // Nested writing
    .xxx__item_current .mod-xxx__link{}

recommend：

    .xxx{}
    .xxx__item{}
    .xxx__item_hightlight{}
    .xxx__product-name{}
    .xxx__link{}
    .xxx__ming-zi-ke-yi-hen-chang{}
    
    // Nested writing
    .xxx__item_current{
        .xxx__link{}
    }

The corresponding HTML structure is as follows：

    <ul class="xxx">
        <li class="xxx__item">First item
            <div class="xxx__product-name">I'm the name</div>
            <span class="xxx__ming-zi-ke-yi-hen-chang">Look at class name</span>
            <a href="#" class="xxx__link">I'm link</a>
        <li>
        <li class="xxx__item xxx__item_current">The second and current selection
            <div class="xxx__product-name">I'm the name</div>
            <a href="#" class="xxx__item-link">I'm link</a>
        <li>
        <li class="xxx__item xxx__item_hightlight">The third item is specially highlighted
             <div class="xxx__product-name">I'm the name</div>
            <a href="#" class="xxx__item-link">I'm link</a>
        <li>
    </ul>

**BEM solves problems**

Complete decoupling of components without namespace contamination, such as the potential nesting risks associated with.mod-xxx ul li notation.

**performance**

BEM naming makes the Class name longer, but this bandwidth overhead is negligible after gzip compression

`xxx__item_hightlight`


##### （2）OOCSS specification

Concept: Object Oriented CSS, object-oriented CSS designed to write highly reusable, low coupling, and highly extensible CSS code.

OOCSS is an object-oriented approach to defining style, separating abstraction from implementation, and separating common code.

The most typical use case of the oocss specification is bootstrap

**Distinguish between structure and style**

When defining a reusable component library, we only create the basic structure (html) and the basic class name. We should not create style rules like border, width, height, background, etc., to make the component library more flexible and extensible. Component libraries have different style requirements in different environments. Failure to distinguish their structure and style and add styles to them will make them become a specific component library and difficult to reuse.

The following is a style created by a base library：

    .metadata{
      font-size: 1.2em;
      text-align: left;
      margin: 10px 0;
    }

If I add more style to it：

    .metadata{
        font-size: 1.2em;
        margin: 10px 0;
        /*New style added on the base component*/
        width: 500px;
        background-color: #efefef;
        color: #fff;
    }

This makes the underlying component metadata created earlier a specific component, making it difficult to reuse in other scenarios.

**Distinguish between container and content**

Partition the container and content separately so that the content can be applied to any container.

    #sidebar h3 {
      font-family: Arial, Helvetica, sans-serif;
      font-size: .8em;
      line-height: 1;
      color: #777;
      text-shadow: rgba(0, 0, 0, .3) 3px 3px 6px;
    }

Above, we define a style with the id h3 in sidebar, but we find that the style of h3 in footer is basically the same, only a few differences, so we may write the style like this

    #sidebar h3, #footer h3 {
      font-family: Arial, Helvetica, sans-serif;
      font-size: 2em;
      line-height: 1;
      color: #777;
      text-shadow: rgba(0, 0, 0, .3) 3px 3px 6px;
    }

    #footer h3 {
      font-size: 1.5em;
      text-shadow: rgba(0, 0, 0, .3) 2px 2px 4px;
    }

We might even write this style in a worse way：

    #sidebar h3 {
      font-family: Arial, Helvetica, sans-serif;
      font-size: 2em;
      line-height: 1;
      color: #777;
      text-shadow: rgba(0, 0, 0, .3) 3px 3px 6px;
    }
    
    #footer h3 {
      font-family: Arial, Helvetica, sans-serif;
      font-size: 1.5em;
      line-height: 1;
      color: #777;
      text-shadow: rgba(0, 0, 0, .3) 2px 2px 4px;
    }

We can see unnecessary duplicating styles appearing in the code above. OOCSS encourages us to think about what styles are common across different elements, and then pull those common styles out of modules, components, objects, etc., so that they can be reused anywhere, not depending on a particular container.

    .title-heading {
      font-family: Arial, Helvetica, sans-serif;
      font-size: 2em;
      line-height: 1;
      color: #777;
      text-shadow: rgba(0, 0, 0, .3) 3px 3px 6px;
    }
    #footer .title-heading {
      font-size: 1.5em;
      text-shadow: rgba(0, 0, 0, .3) 2px 2px 4px;
    }

#### 1.2.2、Java Script specification
Code specifications typically include the following aspects:

- Naming conventions for variables and functions
- Rules for using whitespace, indentation, and comments.
- Other common specifications……

Canonical code is easier to read and maintain.

Code specifications are usually set before development and can be negotiated with your team members.

Common Java Script code specification verification tools are:

- ESLint
- JSLint
- JSHint

##### （1）ESLint
Official website： https://cn.eslint.org/

ESLint is a tool for identifying and reporting pattern matches in ECMAScriptJavaScript code, with the goal of ensuring code consistency and avoiding errors. In many ways, it is similar to JSLint and JSHint, with a few exceptions:

ESLint parses JavaScript using Espree.
ESLint uses the AST to analyze patterns in code.
ESLint is fully pluginized. Each rule is a plug-in and you can add more rules at runtime.
The above is from our website. In a nutshell, ES Lint is a code style check tool.

How to use：

      # Install
      npm install -g eslint
      
      # If you're using ESLint for the first time, you must create a new configuration file using the -init command
      eslint --init
      
      # Use ESLint to detect any JavaScript file:
      eslint test.js test2.js
      
      # ESLint has some rules that run commands that will automatically fix them for you
      eslint test.js --fix

Rule definition：

- JavaScript - Uses.eslintrc.js and outputs a configuration object.
- YAML - Use.eslintrc.yaml or.eslintrc.yml to define the structure of the configuration.
- JSON - Use.eslintrc.json to define the structure of the configuration. The JSON file of ESLint allows javascripts style comments.
- Deprecated - Uses .eslintrc, either JSON or YAML.
- package.json - Create an eslintConfig property in package.json where you define your configuration.

ES Lint specification configuration reference：https://cn.eslint.org/docs/rules/

##### （2）JSLint
Official website： https://www.jslint.com/

JS Lint is a good front-end javascript code validation tool for checking code canonicalization, compressing JS, CSS, etc., but its syntax specification checking can sometimes be "harsh."
##### （3）JSHint
Official website： https://jshint.com/

JS Hint is a bit more lightweight than JS Lint. It can find syntax errors in code and suggest a better coding style. Of course, it's not mandatory that you follow the coding style that it prescribes. Because it provides a range of configurations, you can always turn off any errors you feel are unnecessary.
How to use：

    # INSTALL
    npm install jshint -g
    
    # Run the command in the directory you want to scan
    jshint . >> jshint_result.txt

The scan results are written to the jshint result.txt file.
Compared to the strict rules of JS Lint, many of which I feel are a matter of personal preference, JS Hint makes more sense.
JSHint is a global function:

    var result = JSHINT(source, options);

JSHint() method explanation：

- First parameter source: Mandatory. Represents the code to be examined, either js or json, can be passed a string or an array. If you pass strings, use '\r' or '\n' to separate lines of code; If you pass an array, each array element represents a line of code.
- The second parameter option: optional. Represents a configuration item for code inspection. Most are bool, but some, such as predef, can be an array with global variables or global methods; Or it's an object, key is a global variable or method, and value is a bool, whether it's defined or not.
- Return value: JSHint will return true if there is nothing wrong with the code; Otherwise return false.

Configuration item for the second parameter (part) :

| **pro** | **description**                                                                                            |
| ---- |------------------------------------------------------------------------------------------------------------|
| asi      | Whether to use autoinsert semicolons                                                                       |
| bitwise  | If true, the bitwise operator is disallowed                                                                |
| boss     | If true, we allow the use of = in ifforwhile                                                               |
| curly    | If true, the TAB structure is required in ifwhile modules                                                  |
| debug    | If true, the debugger statement is allowed                                                                 |
| eqeqeq   | If true,it is demanded to use '=' abd '!' while comparing .                                                |
| eqnull   | If true, '== null' is allowed                                                                              |
| evil     | If true, the eval method is allowed                                                                        |
| forin    | If true, it is not allowed for in the absence of hasOwnProperty                                            |
| immed    | If true, "immediate invocations" is required.                                                              |
| laxbreak | If true, line breaks are not checked, and the option to automatically insert semicolons must be turned on. |
| maxerr   | The default is 50. When representing how many errors, jshint stops analyzing the code                      |
| newcap   | If true, the constructor must be capitalized                                                               |
| noarg    | If true, arguments.caller and arguments.callee are not allowed                                             |
| noempty  | If true, empty functions are not allowed                                                                   |
| nonew    | If true, no assignment constructors, such as new UIWindow(), are allowed;                                  |
| nomen    | If true, the header and tail of the name are not allowed to be underlined                                  |
| onevar   | If true, var can occur only once in a function                                                             |
| passfail | If true, it terminates at the first error                                                                  |
| plusplus | If true, the ++ or - operations are not allowed                                                            |
| regexp   | If true, then . Or [^...] is not allowed in RE.                                                            |
| undef | If true, all local variables must be declared before they can be used                                                                      |
| sub | If true, a variety of writing methods are allowed to get properties (generally used. To get the value of an object's property.                                                               |
| strict | If this is true, strict usage is required, as described in detail http://ejohn.org/blog/ecmascript-5-strict-mode-json-and-more/                    |
| white | If true, the whitespace usage needs to be strictly applied.                                                                                      |
	
##### （4）Comparison of the three specification tools
ES Lint, JS Lint, and JS Hint all have their own features. I'm just comparing them and depending on what you need。

JSLint

Advantages

- The configuration is already set, can be used instantly

Disadvantages

- Limited configuration options, many rules cannot be disabled
- The rules are strict, and anyone who does not conform to the good style will be warned
- Poor scalability
- The corresponding rule cannot be located based on the error

**JSHint**

Advantages

- There are many parameters that can be configured
- Supports configuration files for easy use
- Supports some common libraries
- Basic ES6 is supported

Disadvantages

- Customized rules are not supported
- The corresponding rule cannot be located based on the error

 
**ESLint**

Advantages

- Default rules include JSLint and JSHint rules for easy migration (this must be intentional XD)
- Can be configured with warning and error levels, or disabled
- Supports plug-in extensions
- You can customize the rules
- You can locate the corresponding rule based on the error
- ES6 is supported
- The only tool that supports JSX

Disadvantages

- Requires some custom configuration (because it is so flexible, but the documentation is very detailed)
- Slow (it's slower than the other two)

### 1.3. Dev documentation specifications
This part is explained in the following parts

- html specification
- css specification
- js specification

#### 1.3.1、HTML specification
##### (1) The sequence of attributes on the label is suggested as follows

- class (class is designed for highly reusable components, so it should come first)
- id name (id is more specific and should be used as little as possible, so put it second)
- data-
- src for type href value
- placeholder title alt
- aria- role
- required readonly disabled

##### （2) idclass naming rules: BEM OOCSS SMACSS(extended)

##### （3）Annotation specification

    <div class="container">
    <!-- head--start -->
    <header></header>
    <!-- head--end -->
    <!-- content--start -->
    <div class="content">
    </div>
    <!-- content--end -->
    <!-- bottom--start -->
    <footer>
    </footer>
    <!-- bottom--end -->
    </div>

### 1.3.2、CSS specification
Attribute order：

- Location attribute： position top right z-index display float
- Size： width height padding margin
- Character series： font line-height letter-spacing color text-align
- Background： background border
- Others： animation transition

Try not to use label selectors：

    .content ul.first-child
    <div class="content">
      <ul>
          <li>
              <a href=""></a>
              <a href=""></a>
              <a href=""></a>
          </li>
       </ul>
       <ul>
          <li>
              <a href=""></a>
              <a href=""></a>
              <a href=""></a>
          </li>
       </ul>
    </div>

Try to use simplified abbreviations for attributes：

    body{
       margin: 10px 0;
       background: url('./img.png') center;
    }

Get rid of the 0 in front of the decimal point

    body{
      margin: 10px .8px;
      background: url('./img.png') center;
    }

#### 1.3.3、JS specification
Variable name

camel Case is recommended for variable names:

    firstName = "John";
    lastName = "Doe";
    
    price = 19.90;
    tax = 0.20;
    
    fullPrice = price + (price * tax);

Spaces and operators

It is usually necessary to add Spaces before and after the operator (= + - * /):

living example:

    var x = y + z;
    var values = ["Volvo", "Saab", "Fiat"];

Code indent

A block of code is usually indent with four Spaces：

Functions:

    function toCelsius(fahrenheit) {
      return (5 / 9) * (fahrenheit - 32);
    }

Statement rule

General rule for simple statements: A statement usually ends with a semicolon.

Example:

    var values = ["Volvo", "Saab", "Fiat"];
    
    var person = {
      firstName: "John",
      lastName: "Doe",
      age: 50,
      eyeColor: "blue"
    };

General rules for complex statements:

Put the opening curly brace at the end of the first line.
Add a space before the opening brace.
Put the closing curly brace on its own line.
Do not end a complex statement with a semicolon.

Function:

    function toCelsius(fahrenheit) {
      return (5 / 9) * (fahrenheit - 32);
    }

Loop statement:

for (i = 0; i < 5; i++) {
  x += i;
}

Conditional statement:

    if (time < 20) {
      greeting = "Good day";
    } else {
      greeting = "Good evening";
    }

Object rule

Rules of object definition:

- Place the open curly bracket on the same line as the class name.
- There is a space between the colon and attribute value.
- Double quotes are used for strings, not numbers.
- Do not add commas after the last property-value pair.
- Place the close curly bracket on its own line, ending with a semicolon.

Example:

    var person = {
      firstName: "John",
      lastName: "Doe",
      age: 50,
      eyeColor: "blue"
    };

Short object code can be written as a single line:

Example:

    var person = {firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};

Naming rules

In general, many coding languages have similar naming conventions, such as:

- Variables and functions are identified by the small hump method, i.e., the first word except the first word is uppercase (lowerCamelCase)
- UPPERCASE for global variables
- Constants (e.g. PI) are UPPERCASE

Do you use one of these rules: hyp-hens, camelCase, or under_scores?

HTML and CSS bar (-) characters:

HTML5 attributes can be prefixed with data- (e.g., data-quantity, data-price).

CSS uses - to concatenate the property name (font-size).

  >"-" Usually considered subtraction in JavaScript, it is not allowed.

**Underline:**

Many programmers prefer to use underscores (e.g., date_of_birth), especially in SQL databases.

The PHP language usually uses underscores.

PascalCase:

PascalCase is more common in C language.

Hump method:

The hump method is usually recommended for JavaScript, and is used by jQuery and other JavaScript libraries.

  >Do not start variable names with $, which conflicts with many JavaScript libraries.

** File extension **

The html file suffix can be.html (or.htm).

The css file suffix is.css.

The JavaScript file suffix is.js.

Use lowercase file names

Most Web servers (Apache, Unix) are case sensitive: london.jpg cannot be accessed through London.jpg.

Other Web servers (Microsoft, IIS) are not case sensitive: london.jpg can be accessed via either London.jpg or london.jpg.

You must maintain a uniform style, we recommend uniform lowercase file names.
