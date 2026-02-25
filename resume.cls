\ProvidesClass{resume}[2024/01/01 v1.0 Resume class]

\LoadClass[10pt,a4paper]{article}

\usepackage{lmodern}
\renewcommand{\normalsize}{\fontsize{10.5}{12.5}\selectfont}
\normalsize

\usepackage{array}
\usepackage{ifthen}

\pagestyle{empty}

\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}}
\def \@name {}

\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
    \def \@addressthree {#1}
  }{
    \def \@addressone {#1}
  }}
}

\def \printaddress #1{
  \begingroup
    \centerline{#1}
  \endgroup
  \par
  \vspace{2pt}
}

\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\textbf{\@name}}}\hfil
    \vspace{4pt}\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document
  \printname
  \@ifundefined{@addressone}{}{\printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{\printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{\printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSection}[1]{
  \vspace{6pt}
  {\MakeUppercase{\textbf{#1}}}
  \vspace{2pt}
  \hrule
  \vspace{4pt}
}{
  \vspace{2pt}
}

%----------------------------------------------------------------------------------------
%	SIZING
%----------------------------------------------------------------------------------------

\def\namesize{\LARGE}
