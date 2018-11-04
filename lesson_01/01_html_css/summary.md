# Introduction to HTML
Review

Let's review what you've learned so far:

    HTML stands for HyperText Markup Language and is used to
    create the structure and content of a webpage.

    Most HTML elements contain opening and closing tags with raw
    text or other HTML tags between them.

    HTML elements can be nested inside other elements. The enclosed
    element is the child of the enclosing parent element.

    Any visible content should be placed within the opening and
    closing <body> tags .

    Headings and sub-headings, <h1> to <h6> tags, are used to
    enlarge text.

    <p>, <span> and <div> tags specify text or blocks.

    The <em> and <strong> tags are used to emphasize text.

    Line breaks are created with the <br> tag.

    Ordered lists (<ol>) are numbered and unordered lists (<ul>)
    are bulleted.

    Images (<img>) and videos (<video>) can be added by linking
    to an existing source.

# HTML Document Standards
A full list of available HTML tags can be found in [Mozilla documentation](https://developer.mozilla.org/en-US/docs/Web/HTML/Element).

- The `<!DOCTYPE html>` declaration should always be the first line of
code in your HTML files. This lets the browser know what version of
HTML to expect.

The `<html>` element will contain all of your HTML code.

Information about the web page, like the title, belongs within the
`<head>` of the page.

You can add a title to your web page by using the `<title>` element,
inside of the head.

A webpage's `title` appears in a browser's tab.

Anchor tags (`<a>`) are used to link to internal pages, external
pages or content on the same page.

You can create sections on a webpage and jump to them using `<a>` tags
and adding ids to the elements you wish to jump to.

`Whitespace` between HTML elements helps make code easier to read while
not changing how elements appear in the browser.

`Indentation` also helps make code easier to read. It makes parent-child
relationships visible.

`Comments` are written in HTML using the following syntax:
`<!-- comment -->`.

# HTML Tables
The `<table>` element creates a table.

The `<tr>` element adds rows to a table.

To add data to a row, you can use the `<td>` element.

Table headings clarify the meaning of data. Headings are added with
the `<th>` element.

Table data can span columns using the `colspan` attribute.

Table data can span rows using the `rowspan` attribute.

Tables can be split into three main sections: a head, a body, and a
footer.

A table's head is created with the `<thead>` element.

A table's body is created with the `<tbody>` element.

A table's footer is created with the `<tfoot>` element.

All the CSS properties you learned about in this course can be applied
to tables and their data.

# CSS Selectors

CSS can change the look of HTML elements. In order to do this,
CSS must select HTML elements, then apply styles to them.

CSS can select HTML elements by tag, class, or ID.

Multiple CSS classes can be applied to one HTML element.

Classes can be reusable, while IDs can only be used once.

IDs are more specific than classes, and classes are more specific
than tags. That means IDs will override any styles from a class,
and classes will override any styles from a tag selector.

Multiple selectors can be chained together to select an element.
This raises the specificity, but can be necessary.

Nested elements can be selected by separating selectors with a space.

The !important flag will override any style, however it should
almost never be used, as it is extremely difficult to override.

Multiple unrelated selectors can receive the same styles by
separating the selector names with commas.

# Visual Rules
CSS declarations are structured into property and value pairs.

The font-family property defines the typeface of an element.

font-size controls the size of text displayed.

font-weight defines how thin or thick text is displayed.

The text-align property places text in the left, right, or
center of its parent container.

Text can have two different color attributes: color and
background-color. color defines the color of the text, while
background-color defines the color behind the text.

CSS can make an element transparent with the opacity property.

CSS can also set the  background of an element to an image with
the background-image property.

# The box model

> Box dimensions, borders, padding, and margin.

The box model comprises a set of properties used to create space
around and between HTML elements.

The height and width of a content area can be set in pixels or
percentage.

Borders surround the content area and padding of an element. The
color, style, and thickness of a border can be set with CSS properties.

Padding is the space between the content area and the border. It can
be set in pixels or percent.

Margin is the amount of spacing outside of an element's border.

Horizontal margins add, so the total space between the borders of
adjacent elements is equal to the sum of the right margin of one
element and the left margin of the adjacent element.

Vertical margins collapse, so the space between vertically adjacent
elements is equal to the larger margin.

margin: 0 auto horizontally centers an element inside of its parent
content area, if it has a width.

The overflow property can be set to display, hide, or scroll, and
dictates how HTML will render content that overflows its parent's
content area.

The visibility property can hide or show elements.

> default box model: box dimensions are affected by border thickness
and padding.


In the default box model, box dimensions are affected by border
thickness and padding.

The box-sizing property controls the box model used by the browser.

The default value of the box-sizing property is content-box.

The value for the new box model is border-box.

The border-box model is not affected by border thickness or padding.

# CSS Display and Positioning: Layout

The position property allows you to specify the position of an element
in three different ways.

When set to relative, an element's position is relative to its default
position on the page.

When set to absolute, an element's position is relative to its closest
positioned parent element. It can be pinned to any part of the web
page, but the element will still move with the rest of the document
when the page is scrolled.

When set to fixed, an element's position can be pinned to any part of
the web page. The element will remain in view no matter what.

The z-index of an element specifies how far back or how far forward
an element appears on the page when it overlaps other elements.

The display property allows you control how an element flows
vertically and horizontally a document.

inline elements take up as little space as possible, and they cannot
have manually-adjusted width or height.

block elements take up the width of their container and can have
manually-adjusted heights.

inline-block elements can have set width and height, but they can
also appear next to each other and do not take up their entire
container width.

The float property can move elements as far left or as far right as
possible on a web page.

You can clear an element's left or right side (or both) using the
clear property.

When combined with an understanding of the box model, positioning
can create visually appealing web pages.

# usefull exercises:
redo projects Broadway and DaviesBurgers
(mostly the Broadway one.)

# CSS color

 There are four ways to represent color in CSS:

    Named colors — there are 147 named colors, which you can 
    review [here](https://msdn.microsoft.com/en-us/library/aa358802(v=vs.85).aspx)

    Hexadecimal or hex colors
        Hexadecimal is a number system with has sixteen digits, 0
        to 9 followed by "A" to "F".
        Hex values always begin with # and specify values of red,
        blue and green using hexademical numbers such as #23F41A.

RGB

    RGB colors use the rgb() syntax with one value for red, one 
    value for blue and one value for green.
    RGB values range from 0 to 255 and look like this: rgb(7, 210,
    50).

HSL

    HSL stands for hue (the color itself), saturation (the intensity
    of the color), and lightness (how light or dark a color is).
    Hue ranges from 0 to 360 and saturation and lightness are both 
    represented as percentages like this: hsl(200, 20%, 50%).

You can add opacity to color in RGB and HSL by adding a fourth value,
a, which is represented as a percentage.

# CSS Typography

Typography is the art of arranging text on a page.

Text can appear in any number of weights, with the font-weight property.

Text can appear in italics with the font-style property.

The vertical spacing between lines of text can be modified with the 
line-height property.

Serif fonts have extra details on the ends of each letter. Sans-Serif
fonts do not.

Fallback fonts are used when a certain font is not installed on a 
user's computer.

Google Fonts provides free fonts that can be used in an HTML file 
with the <link> tag or the @font-face property.

Local fonts can be added to a document with the @font-face property
and the path to the font's source.

The word-spacing property changes how far apart individual words are.

The letter-spacing property changes how far apart individual letters
are.

The text-align property changes the horizontal alignment of text.
