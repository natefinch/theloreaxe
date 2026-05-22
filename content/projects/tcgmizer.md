---
title: "TCGMizer"
description: "Stop overpaying on shipping. TCGMizer finds the mathematically cheapest combination of TCGPlayer sellers for your cart — including shipping costs — and applies it with one click."
weight: 3
icon: "/images/tcgm-128.png"
---

Buying cards on TCGPlayer means juggling dozens of sellers, each with their own shipping fees. A cart spread across many sellers racks up shipping costs fast, and figuring out the cheapest combination by hand is basically impossible.

TCGMizer does the math for you. It reads your TCGPlayer cart, fetches every available listing and shipping rate, and uses an actual mathematical optimizer to find the cheapest possible combination of sellers — not an approximation, the true optimum. Then it applies the result to your cart with one click.

![TCGMizer popup showing optimization results with seller breakdown and savings](https://github.com/user-attachments/assets/73c80ee1-f1d4-4c7e-8294-7dabbd4ff712)

## How It Works

1. **Go to your TCGPlayer cart** and click the TCGMizer icon
2. **TCGMizer reads your cart** directly from the page — no copy-pasting
3. **It fetches all available listings** for your cards, including cheaper printings from other sets
4. **It fetches shipping rates** and free shipping thresholds for every seller
5. **The solver finds the optimal combination** — minimizing total cost (cards + shipping) while respecting inventory limits
6. **Review the results** — see exactly how much you'll save, broken down by seller
7. **Apply with one click** — TCGMizer clears your cart and re-adds everything from the optimal sellers

![TCGMizer optimization settings showing language, condition, and vendor options](https://github.com/user-attachments/assets/53479c69-b242-4d7b-a8b2-e097bfda3471)

## Why It's Different

Most cart optimizers use heuristics — rules of thumb that get you *close* to the best price. TCGMizer uses [integer linear programming](https://en.wikipedia.org/wiki/Integer_programming) (ILP) with the [HiGHS](https://highs.dev/) solver, the same optimization engine used in academic and industrial applications. It runs entirely in your browser via WebAssembly — no servers, no accounts, no data collection.

## Features

- **Mathematically optimal** — not a heuristic. Finds the true cheapest combination using ILP
- **Alternative printings** — automatically searches for cheaper printings across all sets (toggle off if you want specific versions)
- **Language and condition filters** — choose acceptable languages and conditions before solving
- **Max vendors** — cap the number of sellers to reduce how many packages you receive
- **Minimize vendors mode** — shows you the price vs. convenience tradeoff at different vendor counts
- **Free shipping awareness** — knows each seller's free shipping threshold. Sometimes spending slightly more at one seller triggers free shipping and saves money overall
- **Custom listing support** — handles seller-uploaded custom listings alongside standard ones
- **One-click apply** — replaces your cart with the optimized version. If anything sells out, it falls back to the next cheapest option
- **100% local** — everything runs in your browser. No external servers, no accounts, no data leaves your machine

## Get TCGMizer

TCGMizer is available for Chrome and Firefox. Download the latest release from GitHub.

**[Download from GitHub Releases →](https://github.com/natefinch/tcgmizer/releases)**
