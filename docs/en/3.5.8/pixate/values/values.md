Values
========

Below is a list of value types supported by Freestyle.

### Angle<a name="angle"></a>

An angle is a number followed by one of the following units: deg, rad, grad. Note that there must be no whitespace between the number and its unit. Zero values face horizontally to the right and then rotate counter-clockwise as the value increases.

### Blend Modes<a name="blend_modes"></a>

Below is a list of blend modes as defined by iOS. For a complete description of each mode, visit the [Apple developer center](https://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CGContext/index.html#//apple_ref/doc/c_ref/CGBlendMode).

*   clear
*   color
*   color-burn
*   color-dodge
*   copy
*   darken
*   destination-atop
*   destination-in
*   destination-out
*   destination-over
*   difference
*   exclusion
*   hard-light
*   hue
*   lighten
*   luminosity
*   multiply
*   normal
*   overlay
*   plus-darker
*   plus-lighter
*   saturation
*   screen
*   soft-light
*   source-atop
*   source-in
*   source-out
*   xor

### Color<a name="color"></a>

A color is defined as a 3- or 6-digit hexadecimal number, as an SVG named color, or using any of the following color functions: rgb, rgba, hsl, hsla, hsb, or hsba. When using a hexadecimal number, each digit in a 3-digit hex number and each pair of digits in a 6-digit hex number correspond to an rgb color. The digits define each channel in order: red, green, then blue. For a list of named colors and their values, see [SVG named colors](http://www.w3.org/TR/css3-color/#svg-color).

    color                 ::= <named-color>
                            |  <hex-color>
                            |  <rgb-color>
                            |  <hsl-color>
                            |  <hsb-color>

    named-color           ::= // See link above for names and values.

    hex-color             ::= #<hex-digit>{3} |  #<hex-digit>{6}

    rgb-color             ::= rgb(<byte-or-percent> [, <byte-or-percent>]{2}])
                            |  rgba(<byte-or-percent> [, <byte-or-percent>]{2}, <unit-or-percent>])
                            |  rgba(<named-color>, <unit-or-percent>)
                            |  rgba(<hex-color>, <unit-or-percent>)

    hsl-color             ::= hsl(<angle-or-percent>, <byte-or-percent>, <byte-or-percent>)
                            |  hsla(<angle-or-percent>, <byte-or-percent>, <byte-or-percent>, <unit-or-percent>)

    hsb-color             ::= hsb(<angle-or-percent>, <byte-or-percent>, <byte-or-percent>)
                            |  hsba(<angle-or-percent>, <byte-or-percent>, <byte-or-percent>, <unit-or-percent>)

    hex-digit             ::= 'a' - 'f' | 'A' - 'F' | '0' - '9'

    byte-or-percentage    ::= 0 - 255 | <percentage>

    unit-or-percentage    ::= 0.0 - 1.0 | <percentage>

    angle-or-percentage   ::= <radian> | <gradian> | <degree>

    percentage            ::= <number>%

    radian                ::= <number>rad

    gradian               ::= <number>grad

    degree                ::= <number>deg

    number                ::= // See http://www.w3.org/TR/css3-values/#numbers`</pre>

### Inset<a name="inset"></a>

Insets are used to specify offsets for end-caps. This allows images to be resized while preserving the size of certain parts of the content. This is useful for button images, for example. If a single value is specified, it is used for top, right, bottom, and left insets. If two values are specified, the first number is used for the top and  bottom insets, and the second number is used for the right and left insets. If three values are specified, the first numbers is used for the top inset, the second number is used for the right and left insets, and the third number is used for bottom inset. If four values are specified, they indicate the top, right, bottom, and left values, in that order.

    <inset>       ::= <inset-value> [,? <inset-value>]{3}
    <inset-value> ::= <number> | <length>`</pre>

### Length<a name="length"></a>

A length is a number followed by one of the following units: `px`, `cm`, `mm`, `in`, `pt`, `pc`, `dpx`. Note that there must be no whitespace between the number and its unit.

Freestyle provides the device pixel unit, `dpx`, as an extension.  This could be used, for example, to generate the thinnest possible line on a given device.

### Number<a name="number"></a>

A number is an integer or floating point value. A number may optionally start with a minus sign, '-', or a plus sign, '+'. For an integer, the first digit must be in the range of 1 to 9, inclusive. Zero or more digits may follow. A floating point number starts with zero or more digits followed by a period, '.', followed by one or more digits. This can be summarized with the following regular expression:

    `[-+]?([0-9]*\.[0-9]+|[0-9]+)`

### Padding<a name="padding"></a>

Padding is used to create empty space within the border of a content of a region. If a single value is specified, it is used for `top`, `right`, `bottom`, and `left` `padding`. If two values are specified, the first number is used for the `top` and `bottom` padding, and the second number is used for the `right` and `left` padding. If three values are specified, the first number is used for the `top` padding, the second number is used for the `right` and `left` padding, and the third number is used for `bottom` padding. If four values are specified, they indicate the `top`, `right`, `bottom`, and `left` values, in that order.

    <padding>       ::= <padding-value> [,? <padding-value>]{3}
    <pading-value>  ::= <number> | <length>`</pre>

### Paint<a name="paint"></a>

Paints are used to specify how geometry is filled and how a geometry's stroke is filled. A paint may be a solid color or a linear gradient. Paints include an optional blending mode which defaults to 'normal' when not specified. More than one paint may be applied to geometry using a comma-delimited list of paints.

    paints              ::= <paint> [, <paint>]*
    paint               ::= [<color> | <linear-gradient> | <radial-gradient>] <blend-mode>?
    linear-gradient     ::= linear-gradient([<gradient-angle> ,]? <color> [, <color>]*)
                          |  linear-gradient([<gradient-angle> ,]? <color> <percentage> [, <color> <percentage>]*)
    gradient-angle      ::= <angle> | <gradient-direction>
    gradient-direction  ::= top | top left | left top | top right | right top | right
                          |  bottom | bottom right | right bottom | bottom left | left bottom | left

    radial-gradient     ::= radial-gradient(<color> [, <color>]*)
                          |  radial-gradient(<color> <percentage> [, <color> <percentage>]*)`</pre>

NOTE: Freestyle's CSS implementation does not support the full radial gradient syntax.

### Percentage<a name="percentage"></a>

A percentage is a number followed by a percent sign, `%`. Note that there must be no whitespace between the number and the percent sign.

### Shadow<a name="shadow"></a>

A shadow is to define inner and outer shadows in box-shadow properties. A shadow may be offset in any direction, and may include a blur amount and a color.

    <shadow>          ::= inset? <h-offset> <v-offset> [<blur-radius> <spread-distance>?]? <color>
    <h-offset>        ::= <length>
    <v-offset>        ::= <length>
    <blur-radius>     ::= <length>
    <spread-distance> ::= <length>


### Shape<a name="shape"></a>

A shape is used to define the contour of the background of a control. If the value is not specified, then the default value will be `rectangle`.

    ::= rectangle | ellipse | arrow-button-left | arrow-button-right

### Size<a name="size"></a>

A size consists of a width `<length>` followed by whitespace and a height `<length>`. If only one number is specified, then its value will be used for both the width and height values.

    <size>       ::= <size-value> [,? <size-value>]?
    <size-value> ::= <length> | <number>`</pre>

### String<a name="string"></a>

A string is composed of a single-quote or double-quote, zero or more characters, ending with a matching quote type as was used to start the string. Carriage returns and newlines are not allowed in the content of the string.

    "This is a double-quoted string"
    'This is a single-quoted string'

NOTE: The current implementation successfully scans escape sequences, but they are not post-processed. For example, `abc\000A def` is a valid string, but the `\000A` escape sequence will not be expanded to a newline.

### Transform<a name="transform"></a>

A transform value consists of one-or-more [SVG transforms](http://www.w3.org/TR/SVG/coords.html#TransformAttribute) separated by whitespace. Supported transforms are `translate`, `scale`, `rotate`, `skewX`, `skewY`, and `matrix`.

    <transforms> ::= <transform>+
    <transform>  ::= <translate> | <scale> | <rotate> | <skewX> | <skewY> | <matrix>
    <translate>  ::= translate(<number> [,? <number>]?)
    <scale>      ::= scale(<number> [,? <number>]?)
    <rotate>     ::= rotate(<number> [,? <number> ,? <number>]?)
    <skewX>      ::= skewX(<number>)
    <skewY>      ::= skewY(<number>)
    <matrix>     ::= matrix(number> [,? <number>]{5})

### URL<a name="url"></a>

URLs are specified using the `url` function. This function expects a single `<string>` value. The quotes may be omitted. The referenced resource must be available within your application bundle or the device's documentation folder.