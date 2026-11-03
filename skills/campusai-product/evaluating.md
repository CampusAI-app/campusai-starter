# Evaluating the output

Claude sounds exactly as sure when it is wrong as when it is right. So the most valuable skill on
this team is not getting Claude to build something. It is deciding whether what it built is
actually true. Every check below is here because skipping it already cost us something real.

When you are the one working with the person, hold them to these, and hold yourself to them first.
Before you say something is done, run the checks yourself and say which ones you ran.

## The eight checks

**1. "Done" is a claim, not a fact.** Open the link and press the thing yourself. If Claude says the
Save button now fills up, hold it down and watch. Never pass along "it works" that you did not see.

**2. Green is not working.** A build that passes and tests that pass say the code is consistent, not
that the screen is right. We once shipped a product tour that turned the whole app black, with
every one of 2,000 tests passing. Only looking would have caught it.

**3. Look for what disappeared, not just what appeared.** A change can quietly remove something
nobody asked to remove. One of ours deleted an onboarding question that was meant to stay. Ask:
"what did you remove or change that I did not ask for?"

**4. Saved is not the same as used.** A button can say "Saved" while nothing anywhere reads what it
saved. One of our flows stored a student's job preferences in a place the job feed never looked,
so it reported success and the feed never moved. After you save something, check the thing that
should have changed because of it.

**5. Your link may only work for you.** A link can open fine for you because you are logged in,
and ask everyone else to sign in. Open it in a private window before you send it.

**6. Perfect sample data hides problems.** Try a very long name, an empty account, a phone-width
window, the back button, pressing twice, and the twentieth visit instead of the first.

**7. The words on screen must match what is on screen.** We have shipped "Roles matching zzzzz"
over a list of finance roles, and "You're graduating 2028-05". Read every label as if you were the
student and ask whether it is true.

**8. Check the source of any "it says so".** When Claude says "the docs say" or "this matches X", go
look at X. We once reported a waitlist feature as live because a code comment described it. It
had been deleted two months earlier.

## The habit that makes them easy

**Say what you expect before you look.** "When I press Add, the event should show up in Your week
on the dashboard." Then press it and compare. Without a stated expectation, whatever appears looks
fine.

## What to ask Claude

- "What did you change, what did you remove, and what did you not check?"
- "Show me it at phone width, and in dark mode."
- "What exactly did you click to confirm that works?"
- "Open the link in a private window. What do you see?"
- "If this was wrong, how would we know?"

## Reporting it

When you send work to Jacob, say which checks you ran and which you did not. "I checked it on a
phone and in a private window, I did not try an empty account" is a good report. "Done" is not.
