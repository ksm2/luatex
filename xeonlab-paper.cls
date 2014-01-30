\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{xeonlab-paper}

%% OPTIONS
%%===============================================
\LoadClass[12pt]{article}
\RequirePackage{kvoptions}
\RequirePackage{kvoptions-patch}

\SetupKeyvalOptions{
	family=XeonlabPaper,
	prefix=XeonlabPaper@
}

\DeclareStringOption[000000]{brand}

\ProcessKeyvalOptions*


%% PACKAGES
%%===============================================
\RequirePackage{xeonlab-utilities}
\RequirePackage{amsmath}
\RequirePackage{fontspec}
\RequirePackage{unicode-math}
\RequirePackage{xunicode}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{ccicons}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{lastpage}
\RequirePackage{tikz}
\RequirePackage{nameref}
\RequirePackage{titlesec}
\RequirePackage{longtable}

%% OBJECTS
%%===============================================
\newobject{paper}
\ensureobject{paper}
\newobject{from}

%% DEFINITIONS
%%===============================================
\definecolor{brand}{HTML}{\XeonlabPaper@brand}
\newcommand{\textbrand}[1]{\textcolor{brand}{#1}}

\date{}

%% GEOMETRY
%%===============================================
\geometry{a4paper}
\geometry{left=20mm,right=20mm,bottom=30mm,top=30mm}
\geometry{footnotesep=10mm}
\geometry{headsep=10mm}
\geometry{head=10mm}
\geometry{bindingoffset=0mm}
\setlength{\parindent}{5mm}
\setlength{\parskip}{6pt}

\newcounter{year}
\setcounter{year}{\number\year}
\def\@up@cse#1{\MakeUppercase{#1}}
\newcommand{\UcFirst}[1]{%
	\@up@cse#1}
\def\texttight#1{\fontspec{\@dinEng}{#1}}
\def\email#1{\gdef\@email{#1}}
\def\@email{\@latex@error{No \noexpand\email given}\@ehc}
\def\@mycc#1{\csname cc#1\endcsname}
\def\license#1{\gdef\@license{\@mycc{#1}}\let\license\@addlicense}
\def\@addlicense#1{\g@addto@macro{\@license}{~\@mycc{#1}}}
\def\@license{\@latex@error{No \noexpand\license given}\@ehc}

%% HEAD / FOOT
%%===============================================
\pagestyle{fancy}
\lhead{\textsf{\@currentlabelname}}
\chead{}
\rhead{\textsf{\thepage~/~\pageref{LastPage}}}
\lfoot{\textsf{\textbrand{\readfrom[name]} \\ \readfrom[email]}}
\cfoot{}
\rfoot{\textsf{\textbrand{Copyright~\ccCopy~\Roman{year}} \\ \@license}}
\fancypagestyle{firststyle}{%
	\renewcommand{\headrulewidth}{0pt}
	\lhead{}
	\chead{}
	\rhead{}
}
\thispagestyle{firststyle}

%% TITLEPAGE
%%===============================================
\renewcommand{\maketitle}{%
	\noindent\textsf{\fontsize{36pt}{36pt}\selectfont \textbrand{\readpaper[title]}} \\[1cm]
	\textit{von} \fontsize{16pt}{16pt}\selectfont  \textsf{\readfrom[name]} \\[.5cm]
	\fontsize{12pt}{12pt}\selectfont%
	\textit{lizensiert unter} \fontsize{16pt}{16pt}\selectfont \@license%
	\fontsize{12pt}{12pt}\selectfont\space%
	\textit{im} \textsf{\month@ngerman\space\number\year} \\[2cm]%
} % of \maketitle

%% LAYOUT
%%===============================================
\titleformat{\section}[hang]{\Large\sffamily\color{brand}}{\thesection\quad}{0pt}{}
\titleformat{\subsection}[hang]{\large\itshape}{\thesubsection\quad}{0pt}{}
\titleformat{\subsubsection}[hang]{\large}{\thesubsection\quad}{0pt}{}

\endinput