---
title: Hooks API
for: developers
about: Documents the available lifecycle hooks in Core and how to use them
---

A **hook** is a lifecycle event.

You can register a method for a hook. When the hook is triggered, your method will be
called. It will receive two parameters:

 - An object relevant to the hook (see the specific hook for details)
 - Data passed when the hook was registered (optional)

<ReadMore root='reference/hooks' title="Available hooks"/>
