# Awesome-CV Docker Instructions

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running

## Build the Docker Image (one-time)

```bash
docker build -t awesome-cv .
```

> **Note:** The first build pulls the full TeX Live image (~2-4 GB). Subsequent builds use the Docker cache and are instant.

## Output Layout

All build outputs are grouped under a top-level `output/` folder, one subfolder
per document. Each subfolder holds that document's PDF plus its LaTeX artifacts
(`.aux`, `.log`, `.xdv`):

```
output/
├── cv-swe/         cv-swe.pdf, cv-swe.log, ...
├── cv-fullstack/   cv-fullstack.pdf, ...
├── cv-cloud/       cv-cloud.pdf, ...
├── cv/             cv.pdf, ...
└── coverletter/    coverletter.pdf, ...
```

> The commands below use two volume mounts — `saimun-resume/` as the source and a
> top-level `output/` as the destination — and set the working directory to
> `saimun-resume/` (`-w`) so the LaTeX class and `cv/` section files resolve
> locally. `mkdir -p` creates the target subfolder because `xelatex` requires the
> output directory to exist.

## Compile Your CV

Three tailored variants are available, targeting Google L5:

**Software Engineer (Backend/Distributed Systems):**
```bash
docker run --rm \
  -v "$(pwd)/saimun-resume:/doc/saimun-resume" \
  -v "$(pwd)/output:/doc/output" \
  -w /doc/saimun-resume awesome-cv \
  sh -c "mkdir -p /doc/output/cv-swe && xelatex -output-directory=/doc/output/cv-swe cv-swe.tex"
```

**Full Stack Engineer:**
```bash
docker run --rm \
  -v "$(pwd)/saimun-resume:/doc/saimun-resume" \
  -v "$(pwd)/output:/doc/output" \
  -w /doc/saimun-resume awesome-cv \
  sh -c "mkdir -p /doc/output/cv-fullstack && xelatex -output-directory=/doc/output/cv-fullstack cv-fullstack.tex"
```

**Cloud Engineer:**
```bash
docker run --rm \
  -v "$(pwd)/saimun-resume:/doc/saimun-resume" \
  -v "$(pwd)/output:/doc/output" \
  -w /doc/saimun-resume awesome-cv \
  sh -c "mkdir -p /doc/output/cv-cloud && xelatex -output-directory=/doc/output/cv-cloud cv-cloud.tex"
```

## Compile All Variants at Once

The build **auto-discovers every `saimun-resume/cv-*.tex` file** and emits each to
its own `output/<name>/` folder. This is also the image's default command, so
running the image with the same volume mounts but **no extra arguments** builds
every variant that exists (the three below, plus any you add later):

```bash
docker run --rm \
  -v "$(pwd)/saimun-resume:/doc/saimun-resume" \
  -v "$(pwd)/output:/doc/output" \
  awesome-cv
```

Equivalently, spelled out:

```bash
docker run --rm \
  -v "$(pwd)/saimun-resume:/doc/saimun-resume" \
  -v "$(pwd)/output:/doc/output" \
  -w /doc/saimun-resume awesome-cv sh -c '
    for f in cv-*.tex; do
      name="${f%.tex}"; \
      mkdir -p "/doc/output/$name" && \
      xelatex -output-directory="/doc/output/$name" "$f";
    done'
```

## Adding a New Variant (e.g. a company-specific resume)

Each resume is a single self-contained file.
[`saimun-resume/cv.tex`](saimun-resume/cv.tex) is the reference template — to add a
new variant, **copy it** and adjust a few lines. Because the build globs
`cv-*.tex`, the new file is picked up automatically with **no command or Dockerfile
changes**. (`cv.tex` itself has no hyphen, so it is never built as a variant.)

1. Copy the template to a `cv-<company>.tex` file:
   ```bash
   cp saimun-resume/cv.tex saimun-resume/cv-acme.tex
   ```
2. (Optional) Create tailored section files under `saimun-resume/cv/<variant>/`, e.g.
   `cv/acme/summary.tex`, `cv/acme/skills.tex`, `cv/acme/experience.tex`, or reuse
   existing ones. Certificates and education are shared across variants and live in
   `cv/shared/`.
3. Edit `saimun-resume/cv-acme.tex`:
   - Set the job title: `\position{Senior Software Engineer, Acme}`
   - Point the `\input{}` lines at the sections you want:
     ```latex
     \input{cv/acme/summary.tex}
     \input{cv/acme/skills.tex}
     \input{cv/acme/experience.tex}
     \input{cv/shared/certificates.tex}
     \input{cv/shared/education.tex}
     ```
   - (Optional) Update the footer label in `\makecvfooter{...}`.
4. Run the "Compile All Variants at Once" command (or the no-argument default). Your
   resume is produced at `output/cv-acme/cv-acme.pdf` automatically.

To build only the new variant (replace `acme` with your company name):

```bash
docker run --rm \
  -v "$(pwd)/saimun-resume:/doc/saimun-resume" \
  -v "$(pwd)/output:/doc/output" \
  -w /doc/saimun-resume awesome-cv \
  sh -c "mkdir -p /doc/output/cv-acme && xelatex -output-directory=/doc/output/cv-acme cv-acme.tex"
```

## Compile Other Documents

**Original CV:**
```bash
docker run --rm \
  -v "$(pwd)/saimun-resume:/doc/saimun-resume" \
  -v "$(pwd)/output:/doc/output" \
  -w /doc/saimun-resume awesome-cv \
  sh -c "mkdir -p /doc/output/cv && xelatex -output-directory=/doc/output/cv cv.tex"
```

**Cover Letter:**
```bash
docker run --rm \
  -v "$(pwd)/saimun-resume:/doc/saimun-resume" \
  -v "$(pwd)/output:/doc/output" \
  -w /doc/saimun-resume awesome-cv \
  sh -c "mkdir -p /doc/output/coverletter && xelatex -output-directory=/doc/output/coverletter coverletter.tex"
```

> **Note:** `coverletter.tex` references a profile image at `./examples/profile`
> (line 53). With the working directory set to `saimun-resume/`, that path does not
> resolve — point it at an image inside `saimun-resume/` (e.g. `./profile`) before
> building, or the compile fails with "File `./examples/profile' not found".

## Troubleshooting

- If you get permission errors, make sure Docker Desktop is running.
- If fonts are missing, rebuild the image with `docker build --no-cache -t awesome-cv .`
- Output PDFs appear under your local `output/<document>/` directory thanks to the `-v` volume mount.
