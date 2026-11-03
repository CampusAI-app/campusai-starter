# Testing

The people who built CampusAI know how everything works, so to them it all feels obvious. A new
student does not. Testing is how we find out what is actually confusing, and fresh eyes are the
most valuable thing a new tester has. They fade within about a week, so the first pass matters most.

## How to go through it

**Pick one area at a time.** The briefing, the calendar, job match, the class tracker, the
academic planner, organizations, events. Going everywhere at once produces vague notes.

**Be a specific student, not yourself.** Try the same area as two or three of these:
- a freshman with no resume and no idea what they want
- a junior chasing a summer internship in finance
- an international student who needs work authorization
- someone who skipped every optional question during sign-up
- someone on a phone between classes, with one minute

**Look for the empty states.** What does a page show before you have saved anything, uploaded
anything, or answered anything? That is what every new student sees first, and it is where most
of the confusion lives.

**Try to break it.** Odd inputs, the back button, pressing things twice, a very long name.

**Talk out loud and record it.** A voice memo while you click is faster and more honest than
typing afterwards. Say what you expected, what happened, and how it made you feel. "I have no
idea what this button does" is a great note.

## Turning a recording into feedback

Give Claude the transcript and ask it to turn it into feedback. Each item gets four parts:

1. **What I did.** The page, and exactly what was clicked or typed.
2. **What I expected.**
3. **What happened.** In the words that were on the screen.
4. **How much it matters.** Blocks me / annoying / small polish.

"It's buggy" tells no one anything. "On the calendar I pressed the online section of my class and
nothing happened, I expected it to be added to my week" can be fixed today.

Keep likes too. Knowing what works stops someone from accidentally removing it.

## Where it goes

**Test runs** come to you. When the team ships something to test, a run shows up on the
**Testing** page in Base with your name on it. Go through it one feature per screen and answer
Works, Something's off, or Can't test this, then give it a 1 to 10. A "Something's off" answer
gets the four parts above.

**Everything else** goes through the **Feedback** button at the top right of the platform, one
item at a time. Ideas go there too. Anything urgent, text Jacob.
