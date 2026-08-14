FROM danteev/texlive:latest

WORKDIR /doc
COPY . /doc

# Default: auto-discover every saimun-resume/cv-*.tex variant and build each into
# its own output/<name>/ folder. Adding a new resume (e.g. cv-acme.tex) needs no
# change here — it is picked up automatically. Mount the source and output dirs
# at runtime so results are written back to the host:
#   docker run --rm \
#     -v "$(pwd)/saimun-resume:/doc/saimun-resume" \
#     -v "$(pwd)/output:/doc/output" \
#     awesome-cv
CMD ["sh", "-c", "cd /doc/saimun-resume && for f in cv-*.tex; do name=${f%.tex}; mkdir -p /doc/output/$name && xelatex -interaction=nonstopmode -output-directory=/doc/output/$name $f; done"]
