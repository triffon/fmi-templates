%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Базови настройки %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fmirsacad}[2024/11/10 v0.9 Template for reviews and statements for academic positions]

% шрифтове и кодирания
\RequirePackage[utf8]{inputenc}
\RequirePackage[T2A]{fontenc}

\AddToHook{env/statement/before}{\begin{document}}
\AddToHook{env/statement/after}{\end{document}}
\AddToHook{env/review/before}{\begin{document}}
\AddToHook{env/review/after}{\end{document}}

% становище
\newenvironment{statement}{
  \gdef\fmi@documenttype{\fmi@statement}
  \gdef\fmi@documentpreparedby{\fmi@statementpreparedby}
  \gdef\fmi@thedocument{\fmi@thestatement}
  \fmi@rshead
}{
  \fmi@rsfoot
}

% рецензия
\newenvironment{review}{
  \gdef\fmi@documenttype{\fmi@review}
  \gdef\fmi@documentpreparedby{\fmi@reviewpreparedby}
  \gdef\fmi@thedocument{\fmi@thereview}
  \fmi@rshead
}{
  \fmi@rsfoot
}

% доцент
\DeclareOption{assocprof}{
  \def\fmi@position{\fmi@assocprof}
}

% професор
\DeclareOption{prof}{
  \def\fmi@position{\fmi@prof}
}

\DeclareOption{bulgarian}{
  % български език
  \PassOptionsToPackage{bulgarian}{babel}

  \def\fmi@statement{становище}
  \def\fmi@statementpreparedby{Становището е изготвено от}
  \def\fmi@thestatement{становището}
  \def\fmi@review{рецензия}
  \def\fmi@reviewpreparedby{Рецензията е изготвена от}
  \def\fmi@thereview{рецензията}

  \def\fmi@assocprof{\glqq доцент\grqq}
  \def\fmi@prof{\glqq професор\grqq}

  \def\fmi@singlecandidate{е подал документи \textbf{единствен кандидат}}
  \def\fmi@manycandidates{са подали документи \textbf{следните кандидати}}

  \def\papers{\fmi@titletype{публикации в български и чуждестранни научни издания и научни форуми}}
  \def\studia{\fmi@titletype{студии}}
  \def\monographs{\fmi@titletype{монографии}}
  \def\books{\fmi@titletype{книги}}
  \def\patents{\fmi@titletype{свидетелства и патенти}}
  \def\textbooks{\fmi@titletype{учебници и учебни пособия}}

  \def\fmi@confirm{%
    \if\fmi@conclusion0%
    НЕ \fi%
    потвърждавам}
  \def\fmi@evaluation{%
    \if\fmi@conclusion0%
    отрицателна%
    \else положителна%
    \fi}
  \def\fmi@recommendation{%
    \if\fmi@conclusion0%
    НЕ \fi%
    препоръчвам}

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%% Структура на документа %%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  \def\fmi@rshead{
    \begin{center}
      \onehalfspacing
      \Large\bfseries\MakeUppercase{\fmi@documenttype}\\[2ex]
      \small
      по конкурс за заемане на академична длъжност\\
      \fmi@position\\
      в професионално направление \fmi@field,\\
      за нуждите на \fmi@organisation\ (\fmi@org),\\
      \fmi@institute\ (\fmi@inst),\\
      обявен в ДВ бр. \fmi@stategazetteno\ от \fmi@stategazettedate\ и на интернет страниците на ФМИ и СУ
      \vspace{3ex}
    \end{center}

    \fmi@documentpreparedby\ \fmi@reviewer, професионално направление \fmi@reviewerfield, в качеството му на член на научното жури по конкурса съгласно Заповед \fmi@orderno/\fmi@orderdate\ на \fmi@orderissuer.

    За участие в обявения конкурс \fmi@candidatenumber:

    \begin{itemize}
      \fmi@candidatelist
    \end{itemize}}

  \def\fmi@rsbody{
    \begin{enumerate}[label=\textbf{\Roman*.}]
    \item \textbf{Общо описание на представените материали:}

      \begin{enumerate}[label=\textbf{\arabic*.}]
      \item \textbf{Данни за кандидатурата}

        Представените по конкурса документи от кандидата съответстват на изискванията на \nohyphens{ЗРАСРБ}, \nohyphens{ППЗРАСРБ} и Правилника за условията и реда за придобиване на научни степени и заемане на академични длъжности в СУ \glqq Св. Климент Охридски\grqq (\nohyphens{ПУРПНСЗАДСУ}).

        За участие в конкурса кандидатът \fmi@candidatename\ е представил списък от общо \arabic{fmi@titlecount} заглавия, в т.ч. \fmi@titlelist.

        \ifnum\fmi@otherdocscount>0
        \ifnum\fmi@otherdocscount>1
        Представени са \fmi@otherdocscount\ на брой други документи, покрепящи постиженията на кандидата.
        \else
        Представен е един допълнителен документ извън изискуемите по процедурата.
        \fi

        \fmi@otherdocscomment
        \else
        Допълнителни документи извън изискуемите по процедурата не са приложени.
        \fi

        \fmi@generaldocscomment

      \item \textbf{Данни за кандидата}

        \fmi@candidatedata

      \item \textbf{Обща характеристика на научните трудове и постижения на кандидата}

        \fmi@resultsreview

        \ifnum\fmi@conclusion=1
        След подробен преглед установих, че:
        \begin{enumerate}[label=\alph*)]
        \item представените от кандидата научни трудове отговарят на минималните национални изисквания по чл.~2б, ал.~2 и 3 на \nohyphens{ЗРАСРБ}, раздел III и приложението към чл.~1а, ал.~1 на  \nohyphens{ППЗРАСРБ} и на съответните допълнителни изисквания в \nohyphens{ПУРПНСЗАДСУ};
        \item представените от кандидата научни трудове не повтарят такива от предишни процедури за придобиване на научно звание и академична длъжност;
        \item няма доказано по законоустановения ред плагиатство в представените по конкурса научни трудове.
        \end{enumerate}
        \fi

      \item \textbf{Характеристика и оценка на преподавателската дейност на кандидата}

        \fmi@teachingreview

      \item \textbf{Съдържателен анализ на научните и научно-приложните постижения на кандидата съдържащи се в материалите за участие в конкурса}

        \fmi@scientificreview

      \item \textbf{Критични бележки и препоръки}

        \fmi@recommendations

      \item \textbf{Лични впечатления за кандидата}

        \fmi@personalcomments

      \item \textbf{Заключение за кандидатурата}

        След като се запознах с представените в конкурса материали и научни трудове и въз основа на направения анализ на тяхната значимост и съдържащи се в тях научни и научно-приложни приноси, \fmi@confirm, че научните постижения отговарят на изискванията на \nohyphens{ЗРАСРБ}, \nohyphens{ППЗРАСРБ} и \nohyphens{ПУРПНСЗАДСУ} за заемане от кандидата на академичната длъжност \fmi@position\ в научната област и професионално направление на конкурса.
        В частност, кандидатът удовлетворява минималните национални изисквания в професионалното направление и не е установено плагиатство в представените по конкурса научни трудове.

        Давам своята \textbf{\fmi@evaluation} оценка на кандидатурата.
      \end{enumerate}

    \item \textbf{\MakeUppercase{Общо заключение}}

      Въз основа на гореизложеното, \textbf{\fmi@recommendation} на научното жури да предложи на компетентния орган по избора на \fmi@institute\ при \fmi@organisation\ да избере \fmi@candidatename\ да заеме академичната длъжност \fmi@position\ в професионално направление \fmi@field.
    \end{enumerate}}

  \def\fmi@rsfoot{
    \vspace{5ex}
    \begin{tabular*}\textwidth{l@{\extracolsep{\fill}}p{22em}}
      \@date & Изготвил \fmi@thedocument: \makebox[10em]\hrulefill\\
             & \small\fmi@reviewer
    \end{tabular*}}
}

\DeclareOption{english}{
  % English
  \PassOptionsToPackage{main=english}{babel}

  \def\fmi@statement{statement}
  \def\fmi@statementpreparedby{This statement is written and submitted by}
  \def\fmi@thestatement{the statement} % не се използва

  \def\fmi@review{review}
  \def\fmi@reviewpreparedby{This review is written and submitted by}
  \def\fmi@thereview{the review} % не се използва

  \def\fmi@assocprof{``Associate Professor''}
  \def\fmi@prof{``Professor''}

  \def\fmi@singlecandidate{A \textbf{single candidate} has submitted an application}
  \def\fmi@manycandidates{\textbf{The following candidates} have submitted applications}

  \def\papers{\fmi@titletype{publications in domestic and international scientific issues and conferences}}
  \def\studia{\fmi@titletype{studia}}
  \def\monographs{\fmi@titletype{monographs}}
  \def\books{\fmi@titletype{books}}
  \def\patents{\fmi@titletype{certificates and patents}}
  \def\textbooks{\fmi@titletype{textbooks and teaching materials}}

  \def\fmi@confirm{%
    \if\fmi@conclusion0%
    DO NOT \fi%
    confirm}
  \def\fmi@evaluation{%
    \if\fmi@conclusion0%
    negative%
    \else positive%
    \fi}
  \def\fmi@recommendation{%
    \if\fmi@conclusion0%
    DO NOT \fi%
    recommend}

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%% Структура на документа %%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  \def\fmi@rshead{
    \begin{center}
      \onehalfspacing
      \Large\bfseries\MakeUppercase{\fmi@documenttype}\\[2ex]
      \small
      on the competition for the academic position\\
      \fmi@position\\
      in professional field \fmi@field,\\
      at \fmi@organisation\ (\fmi@org),\\
      \fmi@institute\ (\fmi@inst),\\
      announced in State Gazette No.\fmi@stategazetteno/\fmi@stategazettedate\ and the internet sites of FMI and SU
      \vspace{3ex}
    \end{center}

    \fmi@documentpreparedby\ \fmi@reviewer, professional field \fmi@reviewerfield, appointed to the academic jury for this competition by \fmi@orderissuer\ in accordance with Order \fmi@orderno/\fmi@orderdate.

    \fmi@candidatenumber\ for this competition:

    \begin{itemize}
      \fmi@candidatelist
    \end{itemize}}

  \def\fmi@rsbody{
    \begin{enumerate}[label=\textbf{\Roman*.}]
    \item \textbf{General Description of the Submitted Documents:}

      \begin{enumerate}[label=\textbf{\arabic*.}]
      \item \textbf{Application Details}

        The documents submitted by the candidate are in full compliance with the requirements of the Academic Staff Development Act (\nohyphens{ZRASRB}), the Regulations Act for the Implementation of \nohyphens{ZRASRB} (\nohyphens{PPZRASRB}), and the Regulations Act about the Terms and Conditions for Acquisition of Academic Degrees and Occupation of Academic Positions at SU (\nohyphens{PURPNSZADSU}).

        For the purposes of the competition \fmi@candidatename\ has presented a total of \arabic{fmi@titlecount} titles, including \fmi@titlelist.

        \ifnum\fmi@otherdocscount>0
        \ifnum\fmi@otherdocscount>1
        The candidate has submitted a total of \fmi@otherdocscount\ additional documents supporting the professional achievements.
        \else
        The candidate has submitted one additional document supporting the professional achievements.
        \fi

        \fmi@otherdocscomment
        \else
        The candidate has not submitted any further documents in addition to the documents required by way of procedure.
        \fi

        \fmi@generaldocscomment

      \item \textbf{Short Biographical Data}

        \fmi@candidatedata

      \item \textbf{General Evaluation of Scientific Work and Professional Achievements}

        \fmi@resultsreview

        After a detailed review of the submitted scientific publications I confirm that:
        \begin{enumerate}[label=\alph*)]
        \item the sumitted publications are in full compliance with the minimal national requirements under Art. 2B (2) and (3) of \nohyphens{ZRASRB}, as well as with the additional requirements of SU for the academic position \fmi@position\ in the professional field of this competition;
        \item none of the submitted publications have been submitted in a preceding procedure for acquiring a scientific title or an academic position;
        \item there is no lawful evidence for plagiarism in the submitted publications.
        \end{enumerate}

      \item \textbf{Description and Evaluation of Teaching Activities}

        \fmi@teachingreview

      \item \textbf{Analysis of the Content of the Theoretical and Applied Contributions Described in the Submitted Publications}

        \fmi@scientificreview

      \item \textbf{Critical Remarks and Recommendations}

        \fmi@recommendations

      \item \textbf{Personal Impressions}

        \fmi@personalcomments

      \item \textbf{Conclusion}

        Based on the review of the documents and scientific publications submitted for this competition, as well as on the analysis of their significance and the theoretical and applied contributions, I hereby \fmi@confirm\ that the scientific achievements of the candidate meet and exceed the requirements of \nohyphens{ZRASRB}, \nohyphens{PPZRASRB}, and \nohyphens{PURPNSZADSU} for acquiring the academic position \fmi@position\ in the scientific and professional field of this competition.
        More specifically, the candidate satisfies the minimal national requirements of the professional field and no plagiarism has been detected in the submitted scientific publications submitted.

        I hereby state my \textbf{\fmi@evaluation} assessment of the application of \fmi@candidatename.
      \end{enumerate}

    \item \textbf{\MakeUppercase{General Conclusion}}

      Based on the above, I hereby \textbf{\fmi@recommendation} to the scientific jury to propose to the competent authority of the \fmi@institute\ at \fmi@organisation\ to elect \fmi@candidatename\ to the academic position \fmi@position\ in professional field \fmi@field.
    \end{enumerate}}

  \def\fmi@rsfoot{
    \vspace{5ex}
    \begin{tabular*}\textwidth{l@{\extracolsep{\fill}}p{22em}}
      \@date & Prepared by: \makebox[10em]\hrulefill\\
             & \small\fmi@reviewer
    \end{tabular*}}
}

% предаване на всички непознати опции към базовия клас report
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% становище на български език за доцент по подразбиране
\ExecuteOptions{bulgarian,assocprof}

% обработка на опциите
\ProcessOptions

% зареждане на базов клас report
\LoadClass[12pt,a4paper]{report}

% след като са заредени опциите, да се зареди поддръжка на съответния език
\RequirePackage{babel}

% настройка на отстъпи
\RequirePackage[a4paper, margin=2cm]{geometry}

% фино форматиране на списъци
\RequirePackage{enumitem}

% автоматична първа главна буква
\RequirePackage{datatool-base}
\RequirePackage{mfirstuc}

% автоматичен интервал при нужда
\RequirePackage{xspace}

% контролиране на разстояние между редовете
\RequirePackage{setspace}

% контролиране на сричкопренасянето
\RequirePackage{hyphenat}

% за гъвкаво създаване на нови среди
\RequirePackage{environ}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Генерични команди за управление на променливи %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% генерични команди за създаване на име на променлива и име на съответна команда
\newcommand{\fmi@varname}[1]{\csname fmi@#1\endcsname}
\newcommand{\fmi@cmdname}[1]{\csname #1\endcsname}

% генеричина команда за създаване на нова променлива, установяване на стойност по подразбиране
% и на команда за задаването на стойност на променливата
\newcommand{\fmi@newvar}[2]{
  \expandafter\expandafter\expandafter\def\fmi@varname{#1}{#2}
  \expandafter\expandafter\expandafter\newcommand\fmi@cmdname{#1}[1]{
    \expandafter\expandafter\expandafter\def\fmi@varname{#1}{##1}}
}

% генеричина команда за създаване на нова променлива, установяване на стойност по подразбиране
% и на среда за задаването на стойност на променливата
\newcommand{\fmi@newenvvar}[2]{
  \expandafter\expandafter\expandafter\def\fmi@varname{#1}{#2}
  \NewEnviron{#1}{%
    \edef\fmi@tmpbody{\unexpanded{\expandafter\expandafter\expandafter\gdef\fmi@varname{#1}}%
      {\unexpanded\expandafter{\BODY}}}%
    \fmi@tmpbody}
}

% генеричина команда за създаване на две нови променливи, установяване на стойности по подразбиране
% и на команда за едновременното задаване на стойности на променливите
% \edef\fmi@newvars#1#2#3#4#5{
\newcommand{\fmi@newvars}[5]{
  \expandafter\expandafter\expandafter\def\fmi@varname{#1#2}{#4}
  \expandafter\expandafter\expandafter\def\fmi@varname{#1#3}{#5}
  \expandafter\expandafter\expandafter\newcommand\fmi@cmdname{#1}[2]{
    \expandafter\expandafter\expandafter\def\fmi@varname{#1#2}{##1}
    \expandafter\expandafter\expandafter\def\fmi@varname{#1#3}{##2}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Обикновени променливи %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% професионално направление
\fmi@newvar{field}\ldots

% организация, за чиито цели е конкурсът
\fmi@newvar{organisation}\ldots

% съкратено име на организация, за чиито цели е конкурсът
\fmi@newvar{org}\ldots

% институт или факултет на организацията, за чиито цели е конкурсът
\fmi@newvar{institute}\ldots

% съкратено име на институт или факултет на организацията, за чиито цели е конкурсът
\fmi@newvar{inst}\ldots

% брой и дата на държавен вестник
\fmi@newvars{stategazette}{no}{date}\ldots\ldots

% рецензент: академична длъжност, научна степен,  име, презиме, фамилия - месторабота на рецензента
% професионално направление на рецензента
\fmi@newvars{reviewer}{}{field}\ldots\ldots

% номер и дата на заповед
\fmi@newvars{order}{no}{date}\ldots\ldots

% издаващ заповедта
\fmi@newvar{orderissuer}\ldots

% брой на другите документи (във вид на служебни бележки и удостоверения от работодател,
% ръководител на проект, финансираща организация или възложител на проект,
% референции и отзиви, награди и други подходящи доказателства

% Бележки и коментар по документите
\fmi@newvars{otherdocs}{count}{comment}0{}

% Общ коментар по структурирането на документите
\fmi@newenvvar{generaldocscomment}{}

% Кратки професионални и биографични данни за кандидата
\fmi@newenvvar{candidatedata}\ldots

% Дава се оценка на научните резултати на кандидата.
% В кои научни области и по кои проблеми е работил
% и продължава да работи кандидатът.
\fmi@newenvvar{resultsreview}\ldots

% Оценка на учебно-педагогическа дейност на кандидата.
\fmi@newenvvar{teachingreview}\ldots

% Оценяват се научните и научно-приложните приноси на кандидата,
% като се заяви ясно какъв е характерът им:
% нови теории, хипотези, методи и др.; обогатяване на съществуващи знания;
% приложение на научни постижения в практиката.
% Отражение на резултатите на кандидата в трудовете на други автори.
% Числови показатели – цитати, импакт-фактор и др.
% При колективни публикации да се отрази приносът на кандидата.
\fmi@newenvvar{scientificreview}\ldots

% Посочват се критични бележки, отправени към рецензираните трудове
% по отношение на: постановка; анализи и обобщения; методично равнище;
% точност и пълнота на резултатите; литературна осведоменост.
\fmi@newenvvar{recommendations}\ldots

% лични впечатления от кандидата
\fmi@newenvvar{personalcomments}\ldots

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Сложни променливи и команди за различните компоненти на документа %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\fmi@candidatelist{}
\def\fmi@candidate#1{\item #1} % академична длъжност, научна степен, име, презиме, фамилия, научна организация

% брояч на добавените кандидати
\newcounter{fmi@candidatecount}
\setcounter{fmi@candidatecount}{0}

% брояч на описаните кандидатури
\newcounter{fmi@candidaturecount}
\setcounter{fmi@candidatecount}{0}

% добавяне на нов кандидат към списъка с кандидати
\newcommand{\addcandidate}[2]{
  \g@addto@macro\fmi@candidatelist{\item #1, #2}
  \ifx\fmi@candidatenumber\undefined
  \def\fmi@candidatenumber{\fmi@singlecandidate}
  \else
  \def\fmi@candidatenumber{\fmi@manycandidates}
  \fi
  \addtocounter{fmi@candidatecount}1
  \expandafter\newcommand\csname fmi@candidatearray\the\value{fmi@candidatecount} \endcsname{#1}
}

% команда за рефериране на името на кандидата
% с малка първа буква
\def\candidate{\fmi@candidatename\xspace}

% голяма първа буква
\def\Candidate{\emakefirstuc{\fmi@candidatename}\xspace}

\newcounter{fmi@titlecount}

\newcommand{\fmi@titletype}[2]{
  \addtocounter{fmi@titlecount}{#2}
  \ifx\fmi@titlelist\undefined
  \def\fmi@titlelist{#2 #1}
  \else
  \edef\fmi@titlelist{\fmi@titlelist, #2 #1}
  \fi}

\def\fmi@conclusion{1}                % 1 за положителна оценка, 0 за отрицателна

\newcommand{\positiveconclusion}{
  \def\fmi@conclusion{1}}
\newcommand{\negativeconclusion}{
  \def\fmi@conclusion{0}}

\newenvironment{candidature}[1]{
  \addtocounter{fmi@candidaturecount}1
  \def\fmi@candidatename{\csname fmi@candidatearray\the\value{fmi@candidaturecount} \endcsname}
  \csname #1conclusion\endcsname
  % ако има повече от една кандидатура, да се сложи името на кандидата
  \ifnum\value{fmi@candidatecount}>1
  \newpage
  {\Large\textbf{\fmi@candidatename}}
  \fi
  \setcounter{fmi@titlecount}0
}{
  \fmi@rsbody
}
