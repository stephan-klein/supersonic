Selectors
==========

Selectors are used to designate to which controls a given rule set applies. Below you will find a list of selectors and combinators supported by Freestyle. Note that each entry is a link to its associated section in the CSS3 specification. Simply click the entry to find detailed information about the given selector or combinator.

###Simple Selectors<a name="simple_selectors"></a>

Simple selectors allow for the selection of controls by `name, `class`, and `id`. A selector may include further restrictions on a selected element via attribute expressions; Freestyle does not currently support those. Below is a list of simple selectors supported in Freestyle.

- <a href="http://www.w3.org/TR/css3-selectors/#type-selectors">element type selector</a> - Select a control by element name
- <a href="http://www.w3.org/TR/css3-selectors/#universal-selector">universal selector</a> - Select any control
- <a href="http://www.w3.org/TR/css3-selectors/#class-html">class selector</a> - Select a control by class name
- <a href="http://www.w3.org/TR/css3-selectors/#id-selectors">id selector</a> - Select a control by ID

Below is a sample of each of the simple selectors.

    /* element type selector */
    button {}

    /* universal selector */
    * {}

    /* class selector */
    .my-class {}

    /* id selector */
    #my-id {}`</pre>

See the <a href="#sheets">Cascading Style Sheets Overview</a> section to learn how to specify the the `id` and `class` elements for a control.
NOTE: Pseudo-elements will parse but they are not implemented.

###Attribute Selectors<a name="attribute_selectors"></a>

Attribute selectors allow for controls to be selected based on the content of their attributes. Objective-c classes do not have attributes, per se, but these can be thought of as objective-c properties, in simple cases. Internally, Freestyle will use Key-value Coding (KVC) to look up a property name. If that lookup is successful, then one of the following tests is performed, returning true only if the match is successful.

- <a href="http://www.w3.org/TR/selectors/#attribute-representation">Attribute Presence</a> - Select a control that has the specified attribute
- <a href="http://www.w3.org/TR/selectors/#attribute-representation">Equals</a> - Select a control that has an attribute equal to a specific value
- <a href="http://www.w3.org/TR/selectors/#attribute-representation">List Item Equals</a> - Select a control that has an attribute with an item in a whitespace-delimited list equal to a specific value
- <a href="http://www.w3.org/TR/selectors/#attribute-representation">Equal with Optional Hyphen</a> - Select a control that has an attribute  equal to a specific value or that is prefixed by the value followed by a hyphen
- <a href="http://www.w3.org/TR/selectors/#attribute-substrings">Starts With</a> - Select a control that has an attribute starting with a specific value
- <a href="http://www.w3.org/TR/selectors/#attribute-substrings">Ends With</a> - Select a control that has an attribute ending with a specific value
- <a href="http://www.w3.org/TR/selectors/#attribute-substrings">Contains</a> - Select a control that has an attribute containing a specific value


###Pseudo-classes<a name="pseudo_classes"></a>
Many of the controls in UIKit allow settings to be associated with specific states: `normal`, `highlighted`, `disabled`, etc. Freestyle uses pseudo-classes to indicate to which state a given rule set should apply.

Below is a sample of some pseudo-classes in use.

    /* normal button state */
    button:normal {}

    /* highlighted button state */
    button:highlighted {}


Pseudo-classes representing control states are currently limited to the last selector in a selector sequence.

Pseudo-classes are also used to match controls that meet a certain criteria. For example, it is possible to indicate that a control can match only if it is the first child of its parent, or the last child, etc. Freestyle supports the following pseudo-classes in this category:

- <a href="http://www.w3.org/TR/selectors/#root-pseudo">:root</a> - Select a control that is the root of a view and has no parent
- <a href="http://www.w3.org/TR/selectors/#first-child-pseudo">:first-child </a>- Select a control that is the first child of its parent
- <a href="http://www.w3.org/TR/selectors/#last-child-pseudo">:last-child </a>- Select a control that is the last child of its parent
- <a href="http://www.w3.org/TR/selectors/#first-of-type-pseudo">:first-of-type</a> - Select a control that is the first child of its type
- <a href="http://www.w3.org/TR/selectors/#last-of-type-pseudo">:last-of-type</a> - Select a control that is the last child of its type
- <a href="http://www.w3.org/TR/selectors/#only-child-pseudo">:only-child</a> - Select a control that is the only child of its parent
- <a href="http://www.w3.org/TR/selectors/#only-of-type-pseudo">:only-of-type</a> - Select a control that is the only child of its type
- <a href="http://www.w3.org/TR/selectors/#empty-pseudo">:empty</a> - Select a control that does not have any children
- <a href="http://www.w3.org/TR/selectors/#nth-child-pseudo">:nth-child()</a> - Select the nth child based on the specified pattern
- <a href="http://www.w3.org/TR/selectors/#nth-last-child-pseudo">:nth-last-child()</a> - Select the nth child from the end based on the specified pattern
- <a href="http://www.w3.org/TR/selectors/#nth-of-type-pseudo">:nth-of-type()</a> -Select the nth child of its type based on the specified pattern
- <a href="http://www.w3.org/TR/selectors/#nth-last-of-type-pseudo">:nth-last-of-type()</a> - Select the nth child of its type from the end based on the specified pattern

###Combinators<a name="combinators"></a>

Combinators allow the expression of complex relationships between controls. A combinator combines any combination of simple selectors and other combinators. Each combinator represents a tree relationship that must be met to select a target control.

- <a href="http://www.w3.org/TR/css3-selectors/#descendant-combinators">Descendant combinator</a> - Select a control that descends from another control
- <a href="http://www.w3.org/TR/css3-selectors/#child-combinators">Child combinator</a> - Select a control that is a child of another control
- <a href="http://www.w3.org/TR/css3-selectors/#adjacent-sibling-combinators">Adjacent sibling combinator</a> - Select a control that comes immediately after another control
- <a href="http://www.w3.org/TR/css3-selectors/#general-sibling-combinators">General sibling combinator</a> - Select a control that comes after another control

Below is a sample of each of these combinators.

    /* descendant combinator */
    view button {}

    /* child combinator */
    view > label {}

    /* adjacent sibling combinator */
    button + label

    /* general sibling combinator */
    button ~ label

