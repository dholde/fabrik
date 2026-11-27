---
name: grilling
description: Grill the user relentlessly about a plan, decision, or idea. Use when the user wants to stress-test their thinking, or uses any 'grill' trigger phrases.
---

Interview the user relentlessly until you reach a shared understanding. Map this as a **design tree**: every decision branches into the decisions that hang off it.

Start by writing down the **open points**: every decision you can see so far, numbered, one line each, in the order you will ask them. A point whose answer depends on another open point comes after it.

Then, in the same message, ask about the first open point only, give your recommended answer, and wait for the user's answer. Format a question like so:

```
❓ **Q1** - **<question title>**: <question body, might be multiple paragraphs, including multiple choices>

➡️ <your recommended answer>
```

Word each question so "yes" accepts your recommended answer.

After each answer, update the list: mark the point settled, add new points the answer opened, and drop points it made obsolete. Show the updated list briefly, then ask the next open point.

Finding _facts_ is your job, never the user's. When an open point needs a fact from the environment (filesystem, tools, etc.), dispatch a sub-agent with a fresh context window to find it; don't ask the user for anything you could look up yourself. Don't block on it: a running exploration is an unsettled prerequisite, so only the points that depend on it wait for the sub-agent to report; continue with the next open point that doesn't. The _decisions_ are the user's: put each to them and wait.

The session is done when no open points are left: every branch of the design tree visited, nothing left silently assumed. Do not act on it until the user confirms you have reached a shared understanding.
