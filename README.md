# Permission Approver

A terminal utility for macOS that watches for system permission dialogs. Its dashboard shows how many checks it has made, which button it recognized, and whether the dialog disappeared after it acted.

## What a check looks like

| What’s on the Mac | What the original program does |
| --- | --- |
| No matching alert | Keeps watching and shows the time until its next check. |
| An alert with recognizable controls | Reads the available button labels through macOS Accessibility and identifies the approval option. |
| A dialog with ambiguous controls | Reports that it found a dialog but could not identify an approval button. |
| A dialog it acted on | Checks whether the same window is still visible. A closed window alone does not establish which permission macOS ultimately granted. |

## The terminal view

The dashboard keeps the check interval, uptime, check count, approval count, and last observed result together. A single-check mode prints one result and exits. A detection-only mode lets the operator inspect a proposed choice.

## About the local version

The original is a Python executable for macOS. It can approve requests unattended and can optionally enter a supplied password into an authentication dialog. Both actions can grant access to the Mac. This repository documents that local version.
