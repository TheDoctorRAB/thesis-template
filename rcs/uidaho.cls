% Sets up the class
\LoadClass[oneside]{book}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{./rcs/UIdaho}[University of Idaho Thesis]


% --------------------------------------------------------------------------
% Packages
\RequirePackage{color}
\RequirePackage[table]{xcolor}
\RequirePackage{amsmath,amsfonts,amssymb,nicefrac,mathtools}
\RequirePackage[eulergreek]{sansmath}
%\RequirePackage[showframe]{geometry} %use showframe to check that nothing infringes on margins
\RequirePackage{geometry}
\RequirePackage{array}
\RequirePackage{graphicx} % Allows placement of graphics
\RequirePackage{setspace} % Allows fcns like doublespace, singlespace, and singlehalfspacing of text
\RequirePackage{listings} % For code listings
\RequirePackage{titlesec}
\RequirePackage{ulem}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{adjustbox}
\RequirePackage{indentfirst}
\RequirePackage{multirow}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{lipsum}
\RequirePackage{fmtcount}
\RequirePackage{textcomp}
\RequirePackage{gensymb}
\RequirePackage{url,xurl}
\urlstyle{same}
\RequirePackage{./rcs/slither} %custom package providing syntax highlighting for python and serpent, must have slither.sty in ./rcs/ directory
\RequirePackage{hyperref}
\RequirePackage[acronym,nomain,nonumberlist]{glossaries}
\RequirePackage[inline]{enumitem}
\setlist[enumerate]{label=\arabic*)}
\setlist[itemize]{label=\textbullet}
\RequirePackage{xargs}
\RequirePackage{verbatim}
\RequirePackage[bottom]{footmisc}


% Set margins
\geometry{letterpaper,
	left= 1.25in,
	right=1in,
	bottom=1in,
	top=1in}

	
% Set pagenumber to top right
\pagestyle{fancy}
\fancyhf{}
\fancyfoot{}
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[R]{\thepage}

\fancypagestyle{plain}{\fancyhf{}
\fancyfoot{}
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[R]{\thepage}}


\makeatletter  % DO NOT REMOVE THIS (unless you know what you are doing)


% --------------------------------------------------------------------------
% This fixes issues with table of contents for appendices (Source: https://tex.stackexchange.com/a/231875)
\g@addto@macro{\appendix}{%
  \renewcommand\chaptername{Appendix}%
  \addtocontents{toc}{\protect\renewcommand*{\protect\chaptername}{\protect\appendixname}}%
}



% --------------------------------------------------------------------------
% Configure Table of Contents (TOC)

% Change TOC name to Table of Contents
\renewcommand{\contentsname}{Table of Contents}

% Define command to match the default dot fill for the book class in the TOC
\newcommand \Dotfill {\leavevmode \cleaders \hb@xt@ 0.9em{\hss .\hss }\hfill \kern \z@}


% --------------------------------------------------------------------------
% Configure sections

% Change the chapter and section display format in the TOC
\titlecontents{chapter}% <section-type>
[0pt]% <left>
{}% <above-code>
{\chaptername\ \thecontentslabel:\ }% <numbered-entry-format>
{}% <numberless-entry-format>
{\Dotfill\contentspage}% <filler-page-format>

\titlecontents{section}% <section-type>
[10pt]% <left>
{}% <above-code>
{\thecontentslabel:\ }% <numbered-entry-format>
{ \contentslabel}% <numberless-entry-format>
{\Dotfill\contentspage}% <filler-page-format>

\titlecontents{subsection}%
[20pt]%
{}%
{}%
{\contentslabel}%
{\Dotfill\contentspage}%



% --------------------------------------------------------------------------
% Define an environment that vertically centers
\newenvironment{vplace}[1][1]{%
	\par
	\vspace*{\stretch{#1}}
	}{%
	\par
	\vspace{\stretch{1}}%
	}


% --------------------------------------------------------------------------
% Command Definitions
\newcommand{\thesisdegree}[1]{
	\def\@degree{#1}}

\newcommand{\doctype}[1]{
	\def\@doctype{#1}}

\newcommand{\advisor}[1]{
	\def\@advisor{#1}}

\newcommand{\major}[1]{
	\def\@major{#1}}

\newcommand{\committee}[1]{
	\def\@committee{#1}}



\newcommand{\deptadmin}[1]{
	\def\@deptadmin{#1}}

\newcommand{\graddate}[1]{
	\def\@graddate{#1}}

\newcommand*{\SignatureAndDate}[1]{%
	\noindent\hspace{1in}\makebox[2.5in]{\hrulefill} \hfill\makebox[1.5in]{\hrulefill}\\%
	\noindent\hspace{1in}\makebox[2.5in][l]{#1}      \hfill\makebox[1.5in][l]{Date}%
}%

\newcommand\frontmattersection[1]{%
	\addcontentsline{toc}{chapter}{#1}%
	\chaptermark{#1}
	}


% --------------------------------------------------------------------------
% Title Page
\newcommand{\thesistitlepage}{\thispagestyle{empty}
	\vspace*{0.5in}
		\begin{center}
			\Large\textbf{\@title}\\ 
			\vspace{48pt}\normalsize
			A \@doctype\\
			Presented in Partial Fulfillment of the Requirements for the\\
			Degree of \@degree\\
			with a\\
			Major in \@major\\
			in the\\
			College of Graduate Studies\\
			University of Idaho\\
			by\\
			\@author\\
			\vspace{60pt}
			Approved by:\\
			Major Professor: \@advisor\\
			Committee Members: \@committee\\
			Department Administrator: \@deptadmin\\
			\vspace{80pt}
			\@graddate
		\end{center}

	\clearpage}


% --------------------------------------------------------------------------

% --------------------------------------------------------------------------


\newcommand\immediateaddcontentsline[3]{%
	\begingroup
	\let\origwrite\write
	\def\write{\immediate\origwrite}%
	\addcontentsline{#1}{#2}{#3}%
	\endgroup
}


% --------------------------------------------------------------------------
% More custom commands to add niceties

\newcommand{\etal}{\textit{et al}.\ }
\newcommand{\ie}{\textit{i}.\textit{e}.\ }
\newcommand{\eg}{\textit{e}.\textit{g}.\ }
\newcommand{\andor}{\nicefrac{and}{or}}

\newcommand{\node}[1]{\texttt{#1}}
\newcommand{\tbf}[1]{\textbf{#1}}

% Easy equations
\newcommand{\eq}[1]{\begin{align*}#1\end{align*}} % Usage: \eq{ <equation> }



% --------------------------------------------------------------------------
%% Put your additional LaTeX customizations and definitions here %%

\newcommand{\sci}[1][]{$\times$ 10\textsuperscript{#1} }

%Nuclides
%\newcommand{\<call>}[<mass number (optional)>][default]{$^{#1}A$}
\newcommand{\F}[1][19]{$^{#1}F$ }
\newcommand{\Li}[1][]{$^{#1}Li$ }
\newcommand{\Na}[1][23]{$^{#1}Na$ }
\newcommand{\K}[1][39]{$^{#1}K$ }
\newcommand{\B}[1][]{$^{#1}B$ }
\newcommand{\Be}[1][]{$^{#1}Be$ }
\newcommand{\I}[1][135]{$^{#1}I$ }
\newcommand{\Xe}[1][135]{$^{#1}Xe$ }
\newcommand{\Nd}[1][149]{$^{#1}Nd$ }
\newcommand{\Pm}[1][149]{$^{#1}Pm$ }
\newcommand{\Sm}[1][149]{$^{#1}Sm$ }
\newcommand{\Gd}[1][157]{$^{#1}Gd$ }
\newcommand{\U}[1][]{$^{#1}U$ }
\newcommand{\Pu}[1][239]{$^{#1}Pu$ }
\newcommand{\Ca}[1][]{$^{#1}Ca$ }
\newcommand{\Am}[1][]{$^{#1}Am$ }
\newcommand{\Po}[1][]{$^{#1}Po$ }
\newcommand{\Ra}[1][]{$^{#1}Ra$ }

\newcommand{\UF}[1][4]{UF\textsubscript{#1} }
\newcommand{\flinak}{FLiNaK }
\newcommand{\flibe}{FLiBe }

%Acronyms
\newcommand{\acf}{\acrfull} %full acronym
\newcommand{\acl}{\acrlong} %long acronym
\newcommand{\acs}{\acrshort} %short acronym
\newcommand{\acfp}{\acrfullpl} %full acronym plural
\newcommand{\aclp}{\acrlongpl} %long acronym plural
\newcommand{\acsp}{\acrshortpl} %short acronym plural

%Acronyms
\newacronym{npp}{NPP}{Nuclear Power Plant}
\newacronym{lwr}{LWR}{Light Water Reactor}
\newacronym{smr}{SMR}{Small Modular Reactor}
\newacronym{nrc}{NRC}{Nuclear Regulatory Commission}
\newacronym{iaea}{IAEA}{International Atomic Energy Agency}
\newacronym{ans}{ANS}{American Nuclear Society}
\newacronym{inl}{INL}{Idaho National Laboratory}
\newacronym{hpc}{HPC}{High Performance Computing}
\newacronym{nrel}{NREL}{National Renewable Energy Laboratory}
\newacronym{oak}{ORNL}{Oak Ridge National Laboratory}
\newacronym{haleu}{HALEU}{High-Assay Low-Enriched Uranium}
\newacronym{cogs}{CoGS}{College of Graduate Studies}
