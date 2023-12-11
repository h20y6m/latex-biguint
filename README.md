# biguint Package

Provide big unsigned integer.

## System requiremnts

  * TeX format: LaTeX or plain
  * TeX engine: e-pTeX, e-upTeX, LuaTeX, XeTeX or pdfTeX

## Usage

LaTeX:

```latex
\usepackage{biguint}
```

plain:

```tex
\input biguint-generic.tex
```

## Installation

Strip package file.

```
$ pdftex biguint.ins
```

Install files.

  * `*.sty`/`*.tex` → $TEXMF/tex/latex/biguint/
  * `*.dtx`/`*.ins` → $TEXMF/source/latex/biguint/
  * `*.pdf` → $TEXMF/doc/latex/biguint/

### Building in development repository

Install to TEXMFHOME.

```
l3build install --full
```

Typeset documentation.

```
l3build doc
```

Run tests.

```
l3build check
```

## License

This package is distributed under [the MIT License](LICENSE).

---
Yukimasa Morimi ([h20y6m](https://github.com/h20y6m))
