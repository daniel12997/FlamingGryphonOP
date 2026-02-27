# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

SCA (Society for Creative Anachronism) Order of Precedence system for the Barony of the Flaming Gryphon, Middle Kingdom. Tracks members, awards/honors, bestowals, recommendations, and event history. Data spans from 1970 to present.

Currently contains only a legacy MySQL database dump (`gryphony_OP.sql.zip`). No application code exists yet.

## Database Schema (gryphony_OP.sql)

**Core tables:** `op_recipients` (members with SCA/mundane names), `op_altnames` (nicknames, former names), `op_honors` (awards/orders with levels and categories), `op_bestowals` (honor-to-recipient grants with dates/events), `op_honorimages` (badge images as BLOBs).

**Recommendations/Reports:** `op_recommendations` (public award nominations with justification text), `op_recevents` (links recs to events), `op_reports` (error/correction tickets), `op_reportStatus` (ticket workflow states).

**Supporting:** `op_calendar` (events), `op_groups` (sub-groups: Havenholde, Hawkes Keye, Norborough, Saint Joan, Unicorn, Winged Hills), `op_configuration` (key-value settings).

**Auth:** `op_users`, `op_collection` (roles), `op_permission`, `op_collection2permission`, `op_user2collection`. Legacy MD5 password hashes — must be replaced.

## Domain Terminology

- **SCA name** (`scaname`): medieval persona name. **Mundane name** (`mname`): real-world name.
- Honor categories: `BAR` = baronial awards/orders (permanent), `FGCH` = champion positions (temporary/rotating).
- Honor levels: 50 = major awards, 30 = recognition orders, 20 = special, 10 = novelty, 0 = champion positions.
- `rec` flag on honors = accepts public recommendations.
- Bestowals use `sortdate` (ISO date for ordering) + `dispdate` (display string for uncertain dates like "2/?/84").

## Workflow

- After completing each implementation step, commit to git with a descriptive conventional commit message.
- See `plan.md` for the full implementation plan and step details.
