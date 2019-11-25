%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Базови настройки %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fmistatement}[2019/11/26 v0.3 Faculty of Mathematics and Informatics statement template]

% шрифтове и кодирания
\RequirePackage[utf8]{inputenc}
\RequirePackage[T2A]{fontenc}
\RequirePackageWithOptions{babel}

\DeclareOption{bulgarian}{
  % български език

  \def\assocprof{доцент}
  \def\prof{професор}

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

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%% Структура на становището %%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  \def\statementhead{
    \begin{center}
      \onehalfspacing
      \Large\bfseries\MakeUppercase{Становище}\\[2ex]
      \small
      по конкурс за заемане на академична длъжност\\
      \fmi@position\\
      в професионално направление \fmi@profarea,\\
      за нуждите на Софийски университет ``Св. Климент Охридски'' (СУ),\\
      Факултет по математика и информатика (ФМИ),\\
      обявен в ДВ бр. \fmi@statepaperno\ от \fmi@statepaperdate\ и на интернет страниците на ФМИ и СУ
      \vspace{3ex}
    \end{center}}

  \def\statementbody{
    Становището е изготвено от \fmi@reviewer, \fmi@reviewerprofarea, в качеството му на член на научното жури по конкурса съгласно Заповед \fmi@orderno/\fmi@orderdate\ на Ректора на Софийския университет.

    За участие в обявения конкурс \fmi@candidatenumber:

    \begin{itemize}
      \fmi@candidatelist
    \end{itemize}

    \begin{enumerate}[label=\textbf{\Roman*.}]
    \item \textbf{Общо описание на представените материали:}

      \begin{enumerate}[label=\textbf{\arabic*.}]
      \item \textbf{Данни за кандидатурата}

        Представените по конкурса документи от кандидата съответстват на изискванията на \nohyphens{ЗРАСРБ}, \nohyphens{ППЗРАСРБ} и Правилника за условията и реда за придобиване на научни степени и заемане на академични длъжности в СУ ``Св. Климент Охридски'' (\nohyphens{ПУРПНСЗАДСУ}).

        За участие в конкурса кандидатът \fmi@candidatename\ е представил списък от общо \arabic{fmi@titlecount} заглавия, в т.ч \fmi@titlelist.

        \ifnum\fmi@otherdocscount>0{Представени са \fmi@otherdocscount\ на брой други документи, покрепящи постиженията на кандидата.}\else{Допълнителни документи извън изискуемите по процедурата не са приложени.}\fi


        \fmi@otherdocscomment

      \item \textbf{Данни за кандидата}

        \fmi@candidatedata

      \item \textbf{Обща характеристика на научните трудове и постижения на кандидата}

        \fmi@resultsreview

        След подробен преглед на представените научни трудове установих, че:
        \begin{enumerate}[label=\alph*)]
        \item научните трудове отговарят на минималните национални изисквания (по чл. 2б, ал. 2 и 3 на \nohyphens{ЗРАСРБ}) и съответно на допълнителните изисквания на СУ ``Св. Климент Охридски'' за заемане на академичната длъжност \fmi@position в научната област и професионално направление на конкурса;
        \item представените от кандидата научни трудове не повтарят такива от предишни процедури за придобиване на научно звание и академична длъжност;
        \item няма доказано по законоустановения ред плагиатство в представените по конкурса научни трудове.
        \end{enumerate}

      \item \textbf{Характеристика и оценка на преподавателската дейност на кандидата}

        \fmi@teachingreview

      \item \textbf{Съдържателен анализ на научните и научно-приложните постижения на кандидата съдържащи се в материалите за участие в конкурса}

        \fmi@scientificreview

      \item \textbf{Критични бележки и препоръки}

        \fmi@recommendations

      \item \textbf{Лични впечатления за кандидата}

        \fmi@personalcomments

      \item \textbf{Заключение за кандидатурата}

        След като се запознах с представените в конкурса материали и научни трудове и въз основа на направения анализ на тяхната значимост и съдържащи се в тях научни и научно-приложни приноси, \fmi@confirm, че научните постижения отговарят на изискванията на \nohyphens{ЗРАСРБ}, Правилника за приложението му и съответния Правилник на СУ ``Св. Климент Охридски'' за заемане от кандидата на академичната длъжност \fmi@position в научната област и професионално направление на конкурса. В частност кандидатът удовлетворява минималните национални изисквания в професионалното направление и не е установено плагиатство в представените по конкурса научни трудове.

        Давам своята \textbf{\fmi@evaluation} оценка на кандидатурата.
      \end{enumerate}

    \item \textbf{\MakeUppercase{Общо заключение}}

      Въз основа на гореизложеното, \textbf{\fmi@recommendation} на научното жури да предложи на компетентния орган по избора на Факултета по математика и информатика при СУ ``Св. Климент Охридски'' да избере \fmi@candidatename\ да заеме академичната длъжност \fmi@position\ в професионално направление \fmi@profarea.
    \end{enumerate}}

  \def\statementfoot{
    \vspace{5ex}
    \begin{tabular*}\textwidth{l@{\extracolsep{\fill}}p{22em}}
      \@date & Изготвил становището: \makebox[10em]\hrulefill\\
             & \small\fmi@reviewer
    \end{tabular*}}

}

\DeclareOption{english}{
  % English
  \def\assocprof{Associate Professor}
  \def\prof{Professor}

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

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %%%%%% Структура на становището %%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  \def\statementhead{
    \begin{center}
      \onehalfspacing
      \Large\bfseries\MakeUppercase{Statement}\\[2ex]
      \small
      on the competition for the academic position\\
      \fmi@position\\
      in professional field \fmi@profarea,\\
      at Sofia University ``St. Kliment Ohridski'' (SU),\\
      Faculty of Mathematics and Informatics,\\
      announced in State Gazette No. \fmi@statepaperno\ / \fmi@statepaperdate\ and the internet sites of FMI and SU
      \vspace{3ex}
    \end{center}}

  \def\statementbody{
    This statement is written and submitted by \fmi@reviewer, \fmi@reviewerprofarea, appointed to the academic jury for this competition by the Rector of SU in accordance with Order \fmi@orderno/\fmi@orderdate.

    \fmi@candidatenumber\ for this competition:

    \begin{itemize}
      \fmi@candidatelist
    \end{itemize}

    \begin{enumerate}[label=\textbf{\Roman*.}]
    \item \textbf{General Description of the Submitted Documents:}

      \begin{enumerate}[label=\textbf{\arabic*.}]
      \item \textbf{Application Details}

        The documents submitted by the candidate are in full compliance with the requirements of the Academic Staff Development Act (\nohyphens{ZRASRB}), the Regulations Act for the Implementation of \nohyphens{ZRASRB} (\nohyphens{PPZRASRB}), and the Regulations Act about the Terms and Conditions for Acquisition of Academic Degrees and Occupation of Academic Positions at SU (\nohyphens{PURPNSZADSU}).

        For the purposes of the competition \fmi@candidatename\ has presented a total of \arabic{fmi@titlecount} titles, including \fmi@titlelist.

        \ifnum\fmi@otherdocscount>0{%
          The candidate has submitted a total of \fmi@otherdocscount\ additional documents supporting professional achievements.}\else{The candidate has not submitted any further documents in addition to the documents required by way of procedure.}\fi

        \fmi@otherdocscomment

      \item \textbf{Short Biographical Data}

        \fmi@candidatedata

      \item \textbf{General Evaluation of Scientific Work and Professional Achievements}

        \fmi@resultsreview

        After a detailed review of the submitted scientific publications I confirm that:
        \begin{enumerate}[label=\alph*)]
        \item the sumitted publications are in full compliance of the minimal national requirements under Art. 2B (2) and (3) of \nohyphens{ZRASRB}) and the additional requirements of SU for the academic position \fmi@position\ in the professional field of this competition
        \item none of the submitted publications have been submitted in a preceding procedure for acquiring a scientific title or an academic position
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

        Based on the review of the documents and scientific publications submitted for this competition, as well as on the analysis of their significance and the theoretical and applied contributions, I hereby \fmi@confirm\ that the scientific achievements of the candidate meet and exceed the requirements of \nohyphens{ZRASRB}, \nohyphens{PPZRASRB}, and \nohyphens{PURPNSZADSU} for acquiring the academit position \fmi@position in the scientific and professional field of this competition.
        More specifically, the candidate satisfies the minimal national requirements of the professional field and no plagiarism has been detected in the submitted scientific publications submitted.

        I hereby state my \textbf{\fmi@evaluation} assessment of the application of \fmi@candidatename.
      \end{enumerate}

    \item \textbf{\MakeUppercase{General Conclusion}}

      Based on the above, I hereby \textbf{\fmi@recommendation} to the scientific jury to propose to the competent authority of the Faculty of Mathematics and Informatics at Sofia University ``St. Kliment Ohridski'' to elect \fmi@candidatename\ to the academic position \fmi@position\ in professional field \fmi@profarea.
    \end{enumerate}}

  \def\statementfoot{
    \vspace{5ex}
    \begin{tabular*}\textwidth{l@{\extracolsep{\fill}}p{22em}}
      \@date & Prepared by: \makebox[10em]\hrulefill\\
             & \small\fmi@reviewer
    \end{tabular*}}
}

% предаване на всички непознати опции към базовия клас report
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% български език по подразбиране
\ExecuteOptions{bulgarian}

% обработка на опциите
\ProcessOptions

% зареждане на базов клас report
\LoadClass[12pt,a4paper]{report}

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Команди за различните компоненти на становището %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\fmi@position{\ldots}          % позиция на конкурса
\newcommand{\position}[1]{
  \def\fmi@position{``#1''}}

\def\fmi@profarea{\ldots}          % професионално направление
\newcommand{\profarea}[1]{
  \def\fmi@profarea{#1}}

\def\fmi@statepaperno{\ldots}      % брой на държавен вестник
\def\fmi@statepaperdate{\ldots}    % дата на държавен вестник
\newcommand{\statepaper}[2]{
  \def\fmi@statepaperno{#1}
  \def\fmi@statepaperdate{#2}}

\def\fmi@reviewer{\ldots}          % академична длъжност, научна степен,
% име, презиме, фамилия - месторабота на рецензента

\def\fmi@reviewerprofarea{\ldots}  % професионално направление на рецензента
\newcommand{\reviewer}[2]{
  \def\fmi@reviewer{#1}
  \def\fmi@reviewerprofarea{#2}}

\def\fmi@orderno{\ldots}           % номер на заповед
\def\fmi@orderdate{\ldots}         % дата на заповед
\newcommand{\order}[2]{
  \def\fmi@orderno{#1}
  \def\fmi@orderdate{#2}}

\def\fmi@candidatelist{}
\def\fmi@candidate#1{\item #1} % академична длъжност, научна степен, име, презиме, фамилия, научна организация

% добавяне на нов кандидат към списъка с кандидати
\newcommand{\addcandidate}[1]{
  \g@addto@macro\fmi@candidatelist{\item #1}
  \ifx\fmi@candidatenumber\undefined
  \def\fmi@candidatenumber{\fmi@singlecandidate}
  \else
  \def\fmi@candidatenumber{\fmi@manycandidates}
  \fi
}

\def\fmi@candidatename{\ldots}            % име на кандидата
\newcommand{\candidatename}[1]{
  \def\fmi@candidatename{#1}}

% команда за рефериране на името на кандидата
% с малка първа буква
\def\candidate{\fmi@candidatename\xspace}

% голяма бърва буква
\def\Candidate{\xmakefirstuc{\fmi@candidatename}\xspace}

\newcounter{fmi@titlecount}

\def\fmi@otherdocscount{0}                % брой на другите документи (във вид на служебни бележки и удостоверения от работодател, ръководител на проект, финансираща организация или възложител на проект, референции и отзиви, награди и други подходящи доказателства)
\newcommand{\otherdocscount}[1]{
  \def\fmi@otherdocscount{#1}}

\newcommand{\fmi@titletype}[2]{
  \addtocounter{fmi@titlecount}{#2}
  \ifx\fmi@titlelist\undefined
  \def\fmi@titlelist{#2 #1}
  \else
  \edef\fmi@titlelist{\fmi@titlelist, #2 #1}
  \fi}

\def\fmi@otherdocscomment{}           % Бележки и коментар по документите

\newcommand{\otherdocscomment}[1]{
  \def\fmi@otherdocscomment{#1}}

\def\fmi@candidatedata{\ldots}        % Кратки професионални и биографични данни за кандидата
\newcommand{\candidatedata}[1]{
  \def\fmi@candidatedata{#1}}

\def\fmi@resultsreview{\ldots}        % Дава се оценка на научните резултати на кандидата.
% В кои научни области и по кои проблеми е работил
% и продължава да работи кандидатът.
\newcommand{\resultsreview}[1]{
  \def\fmi@resultsreview{#1}}

\def\fmi@teachingreview{\ldots}       % Оценка на учебно-педагогическа дейност на кандидата.
\newcommand{\teachingreview}[1]{
  \def\fmi@teachingreview{#1}}

\def\fmi@scientificreview{\ldots}     % Оценяват се научните и научно-приложните приноси на кандидата,
% като се заяви ясно какъв е характерът им:
% нови теории, хипотези, методи и др.; обогатяване на съществуващи знания;
% приложение на научни постижения в практиката.
% Отражение на резултатите на кандидата в трудовете на други автори.
% Числови показатели – цитати, импакт-фактор и др.
% При колективни публикации да се отрази приносът на кандидата.
\newcommand{\scientificreview}[1]{
  \def\fmi@scientificreview{#1}}

\def\fmi@recommendations{\ldots}      % Посочват се критични бележки, отправени към рецензираните трудове
% по отношение на: постановка; анализи и обобщения; методично равнище;
% точност и пълнота на резултатите; литературна осведоменост.

\newcommand{\recommendations}[1]{
  \def\fmi@recommendations{#1}}

\def\fmi@personalcomments{\ldots}      % лични впечатления от кандидата
\newcommand{\personalcomments}[1]{
  \def\fmi@personalcomments{#1}}

\def\fmi@conclusion{1}                % 1 за положителна оценка, 0 за отрицателна

\newcommand{\positiveconclusion}{
  \def\fmi@conclusion{1}}
\newcommand{\negativeconclusion}{
  \def\fmi@conclusion{0}}

\newcommand{\makestatement}{
  \statementhead

  \statementbody

  \statementfoot
}
