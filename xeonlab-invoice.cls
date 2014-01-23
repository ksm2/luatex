\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{xeonlab-invoice}

%% OPTIONS
%%===============================================
\LoadClass[12pt,DIN,foldmarks=false]{scrlttr2}
\RequirePackage{kvoptions}
\RequirePackage{kvoptions-patch}

\SetupKeyvalOptions{
	family=XeonlabInvoice,
	prefix=XeonlabInvoice@
}

\DeclareStringOption[000000]{brand}
\DeclareBoolOption[true]{foldmarks}

\ProcessKeyvalOptions*


%% PACKAGES
%%===============================================
\RequirePackage{xeonlab-utilities}
\RequirePackage{fontspec}
\RequirePackage{textcomp} %Eurosymbol
\RequirePackage{xcolor}
\RequirePackage[absolute]{textpos}

%% OBJECTS
%%===============================================
\newobject{invoice}
\newobject{from}
\newobject{to}
\newobject{bank}

%% DEFINITIONS
%%===============================================
\definecolor{brand}{HTML}{\XeonlabInvoice@brand}
\newcommand{\textbrand}[1]{\textcolor{brand}{#1}}

\newcommand{\infoblock}[3]{%
	\begin{textblock*}{60mm}(125mm,#1)
		\noindent
		\textbrand{\footnotesize #2}\\
		#3
	\end{textblock*}}

\setkomavar{subject}{\textbrand{Rechnung \readinvoice[number]}}
\setkomavar{signature}{\readfrom[name]} 

\date{}
\setlength{\parindent}{0pt}

\AtBeginDocument{
	% Sichtfensteradresse
	\begin{textblock*}{85mm}(20mm,50mm)
		\noindent
		{\sffamily\scriptsize%
			\textbrand{\readfrom[name]} $\cdot$
			\readfrom[address] $\cdot$
			\readfrom[zipcode]~\readfrom[city]}\\[-3mm]
		\setlength{\unitlength}{1mm}
		\linethickness{.4mm}
		\begin{picture}(85,.4)
			\textcolor{black!50}{\put(0,0){\line(1,0){85}}}
		\end{picture}
	\end{textblock*}
	% Titel
	\begin{textblock*}{60mm}(125mm,32mm)
		\noindent
		\textbrand{\sffamily\Large \readfrom[name]}\\
		\readfrom[kind]
	\end{textblock*}
	% Anschrift
	\infoblock{49mm}{Anschrift}{\readfrom[address]\\\readfrom[zipcode]~\readfrom[city]}
	% Telefon
	\infoblock{68mm}{Telefon}{\readfrom[phone]\\\readfrom[mobile]}
	% Internet
	\infoblock{87mm}{Internet}{\readfrom[email]\\\readfrom[website]}
	% Created Date
	\begin{textblock*}{60mm}(125mm,106mm)
		\noindent
		\textbrand{\footnotesize Datum}\\
		\readinvoice[created]
	\end{textblock*}
	% Due Date
	\begin{textblock*}{60mm}(155mm,106mm)
		\noindent
		\textbrand{\footnotesize Fällig am}\\
		\readinvoice[due]
	\end{textblock*}
	% Bottom left details
	\begin{textblock*}{60mm}(25mm,260mm)
		\noindent
		\textbrand{\readfrom[name]} \\
		\readfrom[kind] \\
		Steuernummer \readfrom[tax] \\
		\readfrom[website]
	\end{textblock*}
	% Bottom right bank details
	\begin{textblock*}{60mm}(125mm,260mm)
		\noindent
		\textbrand{Bankverbindung} \\
		\readbank[iban] \\
		\readbank[bic] $\cdot$ \readbank[name] \\
		Konto~\readbank[account] $\cdot$ BLZ~\readbank[code]
	\end{textblock*}
	\begin{letter}{%
		\textbrand{\readto[name]}\\%
		\readto[address]\\[6pt]%
		\readto[zipcode]~\readto[city]%
	}
	
	\ifXeonlabInvoice@foldmarks
		\begin{textblock*}{297mm}(0mm,0mm)
			\setlength{\unitlength}{1mm}
			\linethickness{.4mm}
			\begin{picture}(220,297)(0,0)
				\textbrand{%
					\put(0,105){\line(1,0){4}}
					\put(0,148.5){\line(1,0){4}}
					\put(0,210){\line(1,0){4}}
				}
			\end{picture}
		\end{textblock*}
	\fi
	\opening{Sehr geehrte Damen und Herren,}
}

\AtEndDocument{

	\closing{Mit freundlichen Grüßen}
	\end{letter}
}