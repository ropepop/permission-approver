# Permission Approver

**What can a terminal tell you about a macOS permission dialog?**

A permission prompt is easy to recognize when you’re sitting in front of the Mac. From a terminal, even a simple question takes work to answer. Is a prompt still on screen? Is it the same one you saw a moment ago? This project documents a personal macOS automation tool and includes a small, read-only way to explore the first question.

[About the author](https://jolkins.id.lv/aboutme) · [Read the companion source](./inspect-alerts.swift)

## Try the window inspector

On a Mac with the Swift command-line tools, open a terminal in this repository and run

```sh
swift inspect-alerts.swift
```

The companion reports a count of visible windows matching its system-alert filter. Run it before and after dismissing a prompt yourself to compare the two observations. It reads window metadata and leaves the prompt in your hands. A count of zero means the filter found no match.

## Inside the original tool

| Question | How the Python utility answers it |
| --- | --- |
| Which prompt is in front? | It reads the Mac’s front-to-back window list and narrows the search to likely alert windows. |
| What does the prompt offer? | It inspects the buttons that macOS exposes through its accessibility interface. |
| Did the window close? | It looks for the same window again after acting and reports whether it is still visible. |

The distinction in the last row matters. A dialog disappearing is visible evidence that it closed. Confirming the resulting permission would require a separate check.

## What’s published here

The original local utility can act on permission dialogs and optionally handle authentication prompts. This repository contains the case study and a standalone Swift inspector. The inspector counts candidate windows without reading their contents, taking screenshots, submitting credentials, or pressing buttons.

Built by [Aleksandrs Daniils Jolkins](https://jolkins.id.lv/aboutme).
