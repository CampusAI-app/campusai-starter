# Craft

Habits from the designers whose work sets the bar, collected so you do not have to learn each one
the hard way. Read this at the "look at it" step of anything bigger than a small tweak.

## Hierarchy and layout (Refactoring UI, Schoger and Wathan)
- Reach for weight and colour before size to show what matters.
- Dim the secondary things rather than shouting the main one.
- Start with too much white space, then take it away. Cramped reads cheap.
- Separate things with spacing or background before borders. Borders add noise fast.
- Use a spacing scale, never eyeballed values.

## Colour (Refactoring UI, Jakub Krehel)
- Two or three text colours: dark primary, grey secondary, lighter tertiary.
- Never grey text on a coloured background. Use a tint of that background's own hue.

## Type (Rauno Freiberg, Refactoring UI)
- No font weight below 400. Headings at 500 to 600.
- Do not change weight on hover or when selected. It makes things jump.
- Tabular numbers (`font-variant-numeric: tabular-nums`) anywhere numbers line up or change.
- Lines of text around 45 to 75 characters wide.

## Detail (Jakub Krehel, Rauno Freiberg, Paco Coursey)
- Outer corner radius = inner radius + padding. Mismatched nested corners is the most common
  thing that makes an interface feel off.
- Align by eye, not just by the numbers. Icons often need a nudge.
- Toggles take effect immediately, with no confirm step.
- Icon-only buttons need a label for screen readers.

## Motion (Emil Kowalski, Rauno Freiberg)
- Most interface motion: under about 200 to 300ms, easing out on the way in.
- Only animate `transform` and `opacity`. Anything else stutters.
- Motion has to explain something. Skip it on things people do constantly.
- Respect reduced motion: fewer and gentler, not none.
- Never `transition: all`.

## Phones (Rauno Freiberg)
- Inputs at 16px or larger, or iPhones zoom in on focus.
- Hover effects only where hover exists (`@media (hover: hover)`).

Sources: [Rauno Freiberg, Web Interface Guidelines](https://github.com/raunofreiberg/interfaces),
[Emil Kowalski, Great Animations](https://emilkowal.ski/ui/great-animations),
[Refactoring UI](https://refactoringui.com/), [Jakub Krehel](https://interfaces.dev/),
[Paco Coursey](https://paco.me/).
