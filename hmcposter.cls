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
% $Id$
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
\setlength{\textwidth}{45in}
\setlength{\textheight}{32in}
\setlength{\oddsidemargin}{0.5in}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\topmargin}{0.5in}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
%\setlength{\footskip}{0pt}
\setlength{\voffset}{0pt}
\setlength{\hoffset}{0pt}


%%% Define a command to include the HMC Logo.
\DeclareRobustCommand{\@hmclogo}{%
  \begin{minipage}{9.5in}
    \resizebox{9.25in}{!}{\includegraphics{hmclogo}}
  \end{minipage}
}

\RequirePackage{ifthen}
\RequirePackage{palatino}
\RequirePackage{graphics}
\RequirePackage{color}
\definecolor{hmcgold}{rgb}{0.545,0.404,0.188}
\definecolor{dkblue}{rgb}{0,0,0.47}
\definecolor{green}{rgb}{0,1,0}
\RequirePackage{multicol}
\setlength{\columnsep}{1in}
\setlength{\columnseprule}{2pt}

%% Redefine the named font sizes so we can keep most of the code
%%% intact whist still having larger type.

% \renewcommand\LARGE{\fontsize{64pt}{72pt}\selectfont}
% \renewcommand\Large{\fontsize{48pt}{60pt}\selectfont}
% \renewcommand\large{\fontsize{36pt}{44pt}\selectfont}
% \renewcommand\normalsize{\fontsize{24pt}{36pt}\selectfont}


\renewcommand\tiny{\fontsize{12}{14.4}\selectfont}
\renewcommand\scriptsize{\fontsize{16.8}{19.2}\selectfont}
\renewcommand\footnotesize{\fontsize{19.2}{22.8}\selectfont}
\renewcommand\small{\fontsize{21.6}{26.4}\selectfont}
\renewcommand\normalsize{\fontsize{24}{28.8}\selectfont}
\renewcommand\large{\fontsize{28.8}{33.6}\selectfont}
\renewcommand\Large{\fontsize{33.6}{43.2}\selectfont}
\renewcommand\LARGE{\fontsize{40.8}{52.8}\selectfont}
\renewcommand\huge{\fontsize{48}{60}\selectfont}
\renewcommand\Huge{\fontsize{60}{72}\selectfont}



%%% Define some new fields for use in the header/title.

\def\sponsor#1{\gdef\@sponsor{#1}}
\def\@sponsor{\@latex@warning@no@line{No \noexpand\sponsor given}}

\def\department#1{\gdef\@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}

\def\sponsorlogo#1{\gdef\@sponsorlogo{#1}}
\def\@sponsorlogo{\@latex@warning@no@line{No \noexpand\sponsorlogo given}}


%%% Set up the header.

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}                      % Clear all fields.
\fancyhead[LO,LE]{\raisebox{1in}{\@hmclogo}}
\ifthenelse{\isundefined\@sponsorlogo}{}{%
  \fancyhead[RO,RE]{\resizebox{9.25in}{!}{\includegraphics{\@sponsorlogo}}}}
\fancyfoot[RO,RE]{\small Copyright \copyright{} 2005, Harvey Mudd College
  Department of Mathematics.}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{2pt}


%%%% Redefine \@maketitle.

\renewcommand{\@maketitle}{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
    {\color{hmcgold}\LARGE \textsf{\@date\ \@sponsor\ \@department\ Clinic} \par}%
    {\color{hmcgold}\fontsize{100pt}{120pt}\selectfont \textsf{\textbf{\@title}} \par}%
    \vskip 1.5em%
  \end{center}%
  \par
  \vskip 1.5em}


%%% Make footer rule hmcgold.
%%%
%%% This code taken from fancyhdr.sty; written by Piet van Oostrum.
\renewcommand{\footrule}{{\color{hmcgold}\if@fancyplain\let\footrulewidth\plainfootrulewidth\fi
    \vskip-\footruleskip\vskip-\footrulewidth
    \hrule\@width\headwidth\@height\footrulewidth\vskip\footruleskip}}
%%% End code from fancyhdr.sty.


%%% Make vertical rules hmcgold.
%%%
%%% This code is modified from the code in multicol.sty; written by
%%% Frank Mittelbach and part of standard LaTeX.
%%%
%%% It will probably break if the original routine is modified in
%%% future versions of multicol.sty, so be sure to check there.

\renewcommand{\page@sofar}{%
   \process@cols\mult@rightbox
       {\ifvoid\count@
          \setbox\count@\hbox to\hsize{}%
        \else
          \wd\count@\hsize
        \fi}%
   \mult@info\z@
    {Column spec:\MessageBreak
       (\the\multicol@leftmargin\space -->
        \the\full@width\space = \the\hsize
        \space x \the\col@number)%
     }%
\ifvmode\else\errmessage{Multicol Error}\fi
   \moveright\multicol@leftmargin
    \hbox to\full@width{%
     \process@cols\mult@gfirstbox{\box\count@
       \hss{\color{hmcgold}\vrule\@width\columnseprule}\hss}%
     \box\mult@rightbox
      \rlap{\phantom p}%
    }%
}
%%% End code from multicol.sty.

\newenvironment{poster}{%
\thispagestyle{fancy}
{\color{hmcgold}\rule{\textwidth}{2pt}}
\begin{multicols*}{4}
}%
{\end{multicols*}
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



\endinput
