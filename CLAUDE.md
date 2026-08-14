# CLAUDE.md

Guidance for tailoring a resume variant from a job description. For build/compile
commands (Docker, xelatex, output layout), see [`instructions.md`](instructions.md) —
do not duplicate them here.

## What this repo is

A multi-variant resume for Sai Mun Lee. Each variant is one self-contained
`saimun-resume/cv-<variant>.tex` entry point that `\input{}`s three tailored
section files plus two shared ones. The Docker build auto-discovers every
`cv-*.tex`, so a new variant needs no build config changes.

## Folder convention (current)

```
saimun-resume/
  cv-<variant>.tex          entry point: \position, accent color, \input lines
  cv/<variant>/
    summary.tex
    skills.tex
    experience.tex
  cv/shared/
    certificates.tex        reused by every variant
    education.tex           reused by every variant
```

`cv.tex` (no hyphen) is the reference template and is never built as a variant.

## Tailoring a variant from a JD

1. **Read the JD in full** — separate *minimum* qualifications from *preferred*.
   Fetch JS-heavy postings (e.g. Meta, Google) with the browser, not WebFetch.
2. **Map honestly.** Build a requirement-by-requirement table of what the resume
   already evidences. Name gaps plainly; do not paper over them.
3. **Reweight, don't invent.** Copy the closest existing variant's section files
   into `cv/<variant>/`, then reorder and reframe *true* content to lead with what
   the JD values most. Pull real bullets from other variants if they fit better.
4. **Match the level and role type.** A "product engineer" role wants full-stack
   product delivery surfaced; an "ML platform" role wants serving/infra surfaced.
   Same facts, different emphasis.
5. **Entry point:** copy an existing `cv-<variant>.tex`, set `\position{}`, pick an
   accent color, and point the three `\input{cv/<variant>/...}` lines at the new
   files. Keep the two `cv/shared/` inputs.
6. **Build and eyeball the PDF** (see `instructions.md`). Read the rendered pages —
   check it fits, reads for the target role, and has no LaTeX errors.

## The honest-optimized rule (non-negotiable)

Optimize framing, never truthfulness. Specifically:

- **Never overclaim.** Do not add a technology, metric, or credential the resume
  cannot back up. If a JD asks for something absent (e.g. C++/Java, a specific
  certification), leave the gap — do not fabricate to close it.
- **Confirm before adding any specific tech or security claim** that isn't already
  present in an existing variant.
- **Distinguish adjacent-but-different claims.** *Building* AI products ≠ *using* AI
  tooling to speed up workflows. Serving models ≠ training them from scratch. Match
  the resume to what the JD actually asks, not a near-neighbor.
- When a metric or detail is genuinely true but lives in another variant, reusing it
  is fine; conjuring a new number is not.

## Owner context

Sai Mun is a senior SWE. Production depth is tabular-FM serving + recommenders;
LLM/RAG is prototyping only. Frame accordingly.
