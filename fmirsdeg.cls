%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Базови настройки %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fmirsdeg}[2022/02/05 v0.8.2 Faculty of Mathematics and Informatics template for reviews and statements for educational and scientific degrees]

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
  \fmi@rsbody

  \fmi@rsfoot
}

% рецензия
\newenvironment{review}{
  \gdef\fmi@documenttype{\fmi@review}
  \gdef\fmi@documentpreparedby{\fmi@reviewpreparedby}
  \gdef\fmi@thedocument{\fmi@thereview}
  \fmi@rshead
}{
  \fmi@rsbody

  \fmi@rsfoot
}

% доктор
\DeclareOption{phd}{
  \def\fmi@degree{\fmi@esdeg\ ``\fmi@phd''}
  \def\fmi@progchair#1{#1}
}

% доктор на науките
\DeclareOption{dsc}{
  \def\fmi@degree{\fmi@sdeg\ ``\fmi@dsc''}
  \def\fmi@progchair#1{}
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

  \def\fmi@esdeg{образователна и \fmi@sdeg\xspace}
  \def\fmi@sdeg{научна степен}
  \def\fmi@phd{доктор}
  \def\fmi@dsc{доктор на науките}

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
      по процедура за придобиване на \fmi@degree\\
      от\\
      кандидат \fmi@candidatename,\\
      в научна област \fmi@area,\\
      професионално направление \fmi@field,\\
      \fmi@progchair{%
      докторска програма ``\fmi@programme'',\\
      катедра \fmi@chair,\\}
      Факултет по математика и информатика (ФМИ),\\
      Софийски университет ``Св. Климент Охридски'' (СУ).
      \vspace{3ex}
    \end{center}

      \fmi@documentpreparedby\ \fmi@reviewer, професионално направление \fmi@reviewerfield, в качеството му на член на научното жури по процедурата съгласно Заповед \fmi@orderno/\fmi@orderdate\ на Ректора на Софийския университет.}

  \def\fmi@rsbody{
    \begin{enumerate}[label=\textbf{\arabic*.}]
    \item \textbf{Обща характеристика на дисертационния труд и предоставените материали}

      Представените по конкурса документи от кандидата съответстват на изискванията на \nohyphens{ЗРАСРБ}, \nohyphens{ППЗРАСРБ} и Правилника за условията и реда за придобиване на научни степени и заемане на академични длъжности в СУ ``Св. Климент Охридски'' (\nohyphens{ПУРПНСЗАДСУ}).

      Представеният дисертационен труд е в обем \fmi@pages\ страници и се състои от \fmi@chapters\ глави и библиография.
      Текстът е написан на \fmi@lang\ език и съдържа цитати към \fmi@refs\ източници.

      \fmi@generalthesiscomment

      За участие в процедурата кандидатът \fmi@candidatename\ е представил списък от общо \arabic{fmi@titlecount} заглавия, в т.ч. \fmi@titlelist.

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

    \item \textbf{Данни и лични впечатления за кандидата}

      \fmi@candidatedata

      \fmi@personalcomments

    \item \textbf{Съдържателен анализ на научните и научно-приложните постижения на кандидата, съдържащи се в представения дисертационен труд и публикациите към него, включени по процедурата}

      \fmi@scientificreview

    \item \textbf{Апробация на резултатите}

      \fmi@resultsreview

      \ifnum\fmi@conclusion=1
      След подробен преглед установих, че:
      \begin{enumerate}[label=\alph*)]
      \item представените от кандидата научни трудове отговарят на минималните национални изисквания по чл.~2б, ал.~2 и 3 на \nohyphens{ЗРАСРБ}, раздел~III и приложението към чл.~1а, ал.~1 на  \nohyphens{ППЗРАСРБ} и на съответните допълнителни изисквания в \nohyphens{ПУРПНСЗАДСУ};
      \item представените от кандидата резултати в дисертационния труд и научни трудове към него не повтарят такива от предишни процедури за придобиване на научно звание;
      \item няма доказано по законоустановения ред плагиатство в представения дисертационен труд и научни трудове  по тази процедура.
      \end{enumerate}
      \fi

    \item \textbf{Качества на автореферата}

      \fmi@autorefreview

    \item \textbf{Критични бележки и препоръки}

      \fmi@recommendations

    \item \textbf{Заключение}

      След като се запознах с представените в процедурата дисертационен труд и придружаващите го научни трудове и въз основа на направения анализ на тяхната значимост и съдържащи се в тях научни и научно-приложни приноси, \fmi@confirm, че научните постижения отговарят на изискванията на \nohyphens{ЗРАСРБ}, \nohyphens{ППЗРАСРБ} и \nohyphens{ПУРПНСЗАДСУ} за придобиване от кандидата на \fmi@degree\ в научната област \fmi@area\ и професионално направление \fmi@field.
      В частност, кандидатът удовлетворява минималните национални изисквания в професионалното направление и не е установено плагиатство в представените по процедурата научни трудове.

      Въз основа на гореизложеното, \textbf{\fmi@recommendation} на научното жури да присъди на \fmi@candidatename\ \fmi@degree\ в научна област \fmi@area, професионално направление \fmi@field.
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

  \def\fmi@esdeg{an educational and \fmi@sdeg\xspace}
  \def\fmi@sdeg{a scientific degree}
  \def\fmi@phd{Doctor}
  \def\fmi@dsc{Doctor of Sciences}

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
      on the procedure for attaining \fmi@degree\\
      in scientific area \fmi@area,\\
      professional field \fmi@field,\\
      \fmi@progchair{%
      doctoral programme ``\fmi@programme'',\\
      department \fmi@chair,}
      Faculty of Mathematics and Informatics (FMI),\\
      at Sofia University ``St. Kliment Ohridski'' (SU).
      \vspace{3ex}
    \end{center}

      \fmi@documentpreparedby\ \fmi@reviewer, professional field \fmi@reviewerfield, appointed to the academic jury for this procedure by the Rector of SU in accordance with Order \fmi@orderno/\fmi@orderdate.}

  \def\fmi@rsbody{
    \begin{enumerate}[label=\textbf{\arabic*.}]
    \item \textbf{General Description of the Dissertation and the Submitted Documents}

      The documents submitted by the candidate are in full compliance with the requirements of the Academic Staff Development Act (\nohyphens{ZRASRB}), the Regulations Act for the Implementation of \nohyphens{ZRASRB} (\nohyphens{PPZRASRB}), and the Regulations Act about the Terms and Conditions for Acquisition of Academic Degrees and Occupation of Academic Positions at SU (\nohyphens{PURPNSZADSU}).

      The submitted dissertation has a total of \fmi@pages\ pages and consists of \fmi@chapters\ chapters and a bibliography.
      The text is written in \fmi@lang\ and contains a total of \fmi@refs\ references.

      \fmi@generalthesiscomment

      For the purposes of the procedure \fmi@candidatename\ has presented a total of \arabic{fmi@titlecount} titles, including \fmi@titlelist.

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

    \item \textbf{Data and Personal Impressions of the Candidate}

      \fmi@candidatedata

      \fmi@personalcomments

    \item \textbf{Analysis of the Content of the Theoretical and Applied Contributions Described in the Submitted Publications}

      \fmi@scientificreview

    \item \textbf{General Evaluation of Scientific Work and Professional Achievements}

      \fmi@resultsreview

      After a detailed review I confirm that:
      \begin{enumerate}[label=\alph*)]
      \item the sumitted publications are in full compliance with the minimal national requirements under Art. 2b (2) and (3) of \nohyphens{ZRASRB}, Section~III and Appendix to Art.~1a (1) of \nohyphens{PPZRASRB} as well as with the additional requirements in \nohyphens{PURPNSZADSU};
      \item none of the submitted publications have been submitted in a preceding procedure for acquiring a scientific degree;
      \item there is no lawful evidence for plagiarism in the submitted publications.
      \end{enumerate}

    \item \textbf{Qualities of the Autoreferate}

      \fmi@autorefreview

    \item \textbf{Critical Remarks and Recommendations}

        \fmi@recommendations

    \item \textbf{Conclusion}

      Based on the review of the dissertation and its accompanying scientific publications, as well as on the analysis of their significance and the theoretical and applied contributions, I hereby \fmi@confirm\ that the scientific achievements of the candidate meet and exceed the requirements of \nohyphens{ZRASRB}, \nohyphens{PPZRASRB}, and \nohyphens{PURPNSZADSU} for acquiring \fmi@degree\ in the scientific area \fmi@area\ and professional field \fmi@field.
      More specifically, the candidate satisfies the minimal national requirements of the professional field and no plagiarism has been detected in the submitted scientific publications submitted.

      Based on the above, I hereby \textbf{\fmi@recommendation} to the scientific jury to award \fmi@candidatename\ with \fmi@degree\ in scientific area \fmi@area,  professional field \fmi@field.
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

% становище на български език за доктор по подразбиране
\ExecuteOptions{bulgarian,phd}

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

% генеричина команда за създаване на две нови променлива, установяване на стойности по подразбиране
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

% кандидат: титла и три имена
\fmi@newvar{candidatename}\ldots

% научна област
\fmi@newvar{area}\ldots

% професионално направление
\fmi@newvar{field}\ldots

% докторска програма
\fmi@newvar{programme}\ldots

% катедра
\fmi@newvar{chair}\ldots

% език на дисертацията
\fmi@newvar{lang}\ldots

% брой страници
\fmi@newvar{pages}\ldots

% брой глави
\fmi@newvar{chapters}\ldots

% брой цитирани източници
\fmi@newvar{refs}{\ldots}

% рецензент: академична длъжност, научна степен,  име, презиме, фамилия - месторабота на рецензента
% професионално направление на рецензента
\fmi@newvars{reviewer}{}{field}\ldots\ldots

% номер и дата на заповед
\fmi@newvars{order}{no}{date}\ldots\ldots

% Обща характеристика на дисертационния труд и представените материали
\fmi@newenvvar{generalthesiscomment}{}

% брой на другите документи (във вид на служебни бележки и удостоверения от работодател,
% ръководител на проект, финансираща организация или възложител на проект,
% референции и отзиви, награди и други подходящи доказателства

% Бележки и коментар по документите
\fmi@newvars{otherdocs}{count}{comment}0{}

% Общ коментар по структурирането на документите
\fmi@newenvvar{generaldocscomment}{}

% Кратки професионални и биографични данни за кандидата. Пояснява се доколко се
% познава работата на кандидата от изготвящия становището / рецензията
\fmi@newenvvar{candidatedata}\ldots

% Кратко описание къде са представяни съответните резултати и на базата
% на кои публикации е оформен представения дисертационен труд.
% Какво е отражението на резултатите на кандидата в трудовете на други автори.
% Числови показатели – цитати, импакт-фактор и др.
% При колективни публикации да се отрази приносът на кандидата.
\fmi@newenvvar{resultsreview}\ldots

% Посочват се информация за автореферата като се изказва становище
% дали отговаря / не отговаря на всички изисквания за изготвянето му,
% както и дали представя коректно резултатите и съдържанието на дисертационния труд.
\fmi@newenvvar{autorefreview}\ldots

% Анализ и оценка на научните и научно-приложните приноси на кандидата,
% съдържащи се в представения дисертационен труд, оригиналността и приложението им
% в други научни постижения и в практиката.
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

\setcounter{fmi@titlecount}0

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
