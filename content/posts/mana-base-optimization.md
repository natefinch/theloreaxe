---
title: "Mana Base Optimization: The Math Behind Consistent Lands"
date: 2026-04-20T09:00:00-04:00
draft: false
description: "How many lands should you run? What's the right color distribution? I ran the hypergeometric probabilities so you don't have to."
tags: ["Strategy", "Math"]
---

How many sources of each color do you actually need? What's the probability of curving out on time? I ran the hypergeometric distributions so you don't have to. Here's what the numbers say.

## The Fundamental Question

Every deckbuilder faces the same tension: you need enough lands to cast your spells, but every land you draw instead of a spell is a potential missed threat or answer.

The classic rule of thumb — 24 lands in a 60-card deck — is a reasonable starting point, but it's just that: a starting point.

## Hypergeometric Distribution

The hypergeometric distribution tells us the probability of drawing a specific number of successes from a finite population without replacement. For Magic, this translates to: what's the probability of having X lands in your opening hand?

For a 60-card deck with 24 lands, drawing 7 cards:

- **0 lands**: 1.3%
- **1 land**: 8.7%
- **2 lands**: 23.2%
- **3 lands**: 31.5%
- **4 lands**: 23.3%
- **5+ lands**: 12.0%

## Color Requirements

The more demanding your color requirements, the more sources you need. A card that costs 1GG needs more green sources than one that costs 2G, even though both are three-mana spells.

As a general guideline for a two-color deck in a 60-card format:
- Single pip (1G): 14 sources
- Double pip (GG): 18 sources
- Triple pip (GGG): 22 sources
