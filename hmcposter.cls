% \iffalse meta-comment
%
% hmcposter.cls -- LaTeX class to create posters
% 
% Copyright (C) 2005 Claire M. Connelly and 
% the Department of Mathematics, Harvey Mudd College
% 
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
% 
% Contact: Claire Connelly <cmc@math.hmc.edu>
%          Department of Mathematics
%          Harvey Mudd College
%          1250 N. Dartmouth Ave.
%          Claremont, CA 91711
% 
% \fi
%%
%% HMC Poster LaTeX class file.
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hmcposter}[2005/02/25 HMC Mathematics LaTeX poster class]

%%% Declare and set some options.

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%\ExecuteOptions{}
\ProcessOptions\relax %% <-- Change this if we decide to declare some
                      %%     options for this class!
\LoadClass[24pt]{article}

\setlength{\paperwidth}{48in}
\setlength{\paperheight}{36in}
\setlength{\textwidth}{46in}
\setlength{\textheight}{32in}
\setlength{\oddsidemargin}{0.5in}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\topmargin}{0.5in}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
%\setlength{\footskip}{0pt}
\setlength{\voffset}{0pt}
\setlength{\hoffset}{0pt}



\RequirePackage{palatino}
\RequirePackage{multicol}
\setlength{\columnsep}{1in}
\setlength{\columnseprule}{2pt}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}                      % Clear all fields.
\fancyhead{}
\fancyfoot[RO,RE]{\small Copyright \copyright{} 2005, Harvey Mudd College
  Department of Mathematics.}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{2pt}

\renewcommand\LARGE{\fontsize{64pt}{72pt}\selectfont}
\renewcommand\normalsize{\fontsize{24pt}{36pt}\selectfont}
\renewcommand\Large{\fontsize{48pt}{60pt}\selectfont}
\renewcommand\large{\fontsize{36pt}{44pt}\selectfont}


\def\sponsor#1{\gdef\@sponsor{#1}}
\def\@sponsor{\@latex@warning@no@line{No \noexpand\sponsor given}}

\def\department#1{\gdef\@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}


\renewcommand{\@maketitle}{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
    {\LARGE \@date\ \@sponsor\ \@department\ Clinic \par}%
    {\fontsize{100pt}{120pt}\selectfont \@title \par}%
    \vskip 1.5em%
  \end{center}%
  \par
  \vskip 1.5em}


\newenvironment{poster}{%
\thispagestyle{fancy}
\rule{\textwidth}{2pt}
\begin{multicols*}{4}
}%
{\end{multicols*}
%\rule{\textwidth}{2pt}%
}


%\newcommand\section{\@startsection {section}{1}{\z@}%
%                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
%                                   {2.3ex \@plus.2ex}%
%                                   {\normalfont\Large\bfseries}}
%\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
%                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
%                                     {1.5ex \@plus .2ex}%
%                                     {\normalfont\large\bfseries}}
%\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
%                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
%                                     {1.5ex \@plus .2ex}%
%                                     {\normalfont\normalsize\bfseries}}
%\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
%                                    {3.25ex \@plus1ex \@minus.2ex}%
%                                    {-1em}%
%                                    {\normalfont\normalsize\bfseries}}
%\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
%                                       {3.25ex \@plus1ex \@minus .2ex}%
%                                       {-1em}%
%                                      {\normalfont\normalsize\bfseries}}

% \newenvironment{figure}
%                {\@float{figure}}
%                {\end@float}

\renewenvironment{figure}
               {\def\@captype {figure}}
               {}

\renewenvironment{table}
               {\def\@captype {table}}
               {}

% \renewcommand{\caption}{%
%   \ifx\@captype\@undefined
%     \@latex@error{\noexpand\caption outside float}\@ehd
%     \expandafter\@gobble
%   \else
%      \refstepcounter\@captype
%      \expandafter\@firstofone
%   \fi
%    {\@dblarg{\@caption\@captype}}%
% }


% \def\@float#1{%
%   \@ifnextchar[%
%     {\@xfloat{#1}}%
%     {\edef\reserved@a{\noexpand\@xfloat{#1}[\csname fps@#1\endcsname]}%
%      \reserved@a}}
% \def\@xfloat #1[#2]{%
%   \@nodocument
%   \def \@captype {#1}%
%    \def \@fps {#2}%
%    \@onelevel@sanitize \@fps
%    \def \reserved@b {!}%
%    \ifx \reserved@b \@fps
%      \@fpsadddefault
%    \else
%      \ifx \@fps \@empty
%        \@fpsadddefault
%      \fi
%    \fi
%    \ifhmode
%      \@bsphack
%      \@floatpenalty -\@Mii
%    \else
%      \@floatpenalty-\@Miii
%    \fi
%   \ifinner
%      \@parmoderr\@floatpenalty\z@
%   \else
%     \@next\@currbox\@freelist
%       {%
%        \@tempcnta \sixt@@n
%        \expandafter \@tfor \expandafter \reserved@a
%          \expandafter :\expandafter =\@fps
%          \do
%           {%
%            \if \reserved@a h%
%              \ifodd \@tempcnta
%              \else
%                \advance \@tempcnta \@ne
%              \fi
%            \fi
%            \if \reserved@a t%
%              \@setfpsbit \tw@
%            \fi
%            \if \reserved@a b%
%              \@setfpsbit 4%
%            \fi
%            \if \reserved@a p%
%              \@setfpsbit 8%
%            \fi
%            \if \reserved@a !%
%              \ifnum \@tempcnta>15
%                \advance\@tempcnta -\sixt@@n\relax
%              \fi
%            \fi
%            }%
%        \@tempcntb \csname ftype@\@captype \endcsname
%        \multiply \@tempcntb \@xxxii
%        \advance \@tempcnta \@tempcntb
%        \global \count\@currbox \@tempcnta
%        }%
%     \@fltovf
%   \fi
%   \global \setbox\@currbox
%     \color@vbox
%       \normalcolor
%       \vbox \bgroup
%         \hsize\columnwidth
%         \@parboxrestore
%         \@floatboxreset
% }

\endinput
