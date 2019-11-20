%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Базови настройки %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fmistatement}[2019/11/20 v0.1 Faculty of Mathematics and Informatics statement template]

% предаване на всички непознати опции към базовия клас report
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% обработка на опциите
\ProcessOptions

% зареждане на базов клас report
\LoadClass[12pt,a4paper]{report}

% шрифтове и кодирания
\RequirePackage[utf8]{inputenc}
\RequirePackage[T2A]{fontenc}
\RequirePackage[bulgarian]{babel}

% фино форматиране на списъци
\RequirePackage{enumitem}

% настройка на отстъпи
\RequirePackage[a4paper, margin=2cm]{geometry}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Команди за различните компоненти на становището %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\assocprof{доцент}
\def\prof{професор}
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

\def\fmi@singlecandidate{е подал документи \textbf{единствен кандидат}}
\def\fmi@manycandidates{са подали документи \textbf{следните кандидати}}

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
\def\candidate{\fmi@candidatename}

\newcounter{fmi@titlecount}

\def\fmi@otherdocscount{\ldots}           % брой на другите документи (във вид на служебни бележки и удостоверения от работодател, ръководител на проект, финансираща организация или възложител на проект, референции и отзиви, награди и други подходящи доказателства)
\newcommand{\otherdocscount}[1]{
  \def\fmi@otherdocscount{#1}}

\newcommand{\fmi@titletype}[2]{
  \addtocounter{fmi@titlecount}{#2}
  \ifx\fmi@titlelist\undefined
  \def\fmi@titlelist{#2 #1}
  \else
  \edef\fmi@titlelist{\fmi@titlelist, #2 #1}
  \fi}

\newcommand{\papers}{\fmi@titletype{публикации в български и чуждестранни научни издания и научни форуми}}
\newcommand{\studia}{\fmi@titletype{студии}}
\newcommand{\monographs}{\fmi@titletype{монографии}}
\newcommand{\books}{\fmi@titletype{книги}}
\newcommand{\patents}{\fmi@titletype{свидетелства и патенти}}
\newcommand{\textbooks}{\fmi@titletype{учебници и учебни пособия}}

\def\fmi@otherdocscomment{\ldots}     % Бележки и коментар по документите
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
\def\fmi@confirm{%
  \if\fmi@conclusion0%
  не \fi%
  потвърждавам}
\def\fmi@evaluation{%
  \if\fmi@conclusion0%
  отрицателна%
  \else положителна%
  \fi}
\def\fmi@recommendation{%
  \if\fmi@conclusion0%
  не \fi%
  препоръчвам}

\newcommand{\positiveconclusion}{
  \def\fmi@conclusion{1}}
\newcommand{\negativeconclusion}{
  \def\fmi@conclusion{0}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Структура на становището %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\makestatement}{
  \statementhead

  \statementbody

  \statementfoot
}

\newcommand{\statementhead}{
  \begin{center}
    \Large\bfseries\MakeUppercase{Становище}\\
    % FIXME: разстояние между редовете
    \small
    по конкурс за заемане на академична длъжност\\
    \fmi@position\\
    в професионално направление \fmi@profarea,\\
    за нуждите на Софийски университет ``Св. Климент Охридски'' (СУ),\\
    Факултет по математика и информатика (ФМИ),\\
    обявен в ДВ бр. \fmi@statepaperno\ от \fmi@statepaperdate\ и на интернет страниците на ФМИ и СУ
  \end{center}}

\newcommand{\statementbody}{
  Становището е изготвено от \fmi@reviewer, \fmi@reviewerprofarea, в качеството му на член на научното жури по конкурса съгласно Заповед №\fmi@orderno/\fmi@orderdate\ на Ректора на Софийския университет.

  За участие в обявения конкурс \fmi@candidatenumber:

  \begin{itemize}
    \fmi@candidatelist
  \end{itemize}

  \begin{enumerate}[label=\textbf{\Roman*.}]
  \item \textbf{Общо описание на представените материали:}

    \begin{enumerate}[label=\textbf{\arabic*.}]
    \item \textbf{Данни за кандидатурата}

      Представените по конкурса документи от кандидата съответстват на изискванията на ЗРАСРБ, ППЗРАСРБ и Правилника за условията и реда за придобиване на научни степени и заемане на академични длъжности в СУ ``Св. Климент Охридски'' (ПУРПНСЗАДСУ).

      За участие в конкурса кандидатът \fmi@candidatename\ е представил списък от общо \arabic{fmi@titlecount} заглавия, в т.ч \fmi@titlelist.

      Представени са \fmi@otherdocscount\ на брой други документи, покрепящи постиженията на кандидата.

      \fmi@otherdocscomment

    \item \textbf{Данни за кандидата}

      \fmi@candidatedata

    \item \textbf{Обща характеристика на научните трудове и постижения на кандидата}

      \fmi@resultsreview

      След подробен преглед на представените научни трудове установих, че:
      \begin{enumerate}[label=\alph*)]
      \item научните трудове отговарят на минималните национални изисквания (по чл. 2б, ал. 2 и 3 на ЗРАСРБ) и съответно на допълнителните изисквания на СУ „Св. Климент Охридски“ за заемане на академичната длъжност \fmi@position в научната област и професионално направление на конкурса;
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

      След като се запознах с представените в конкурса материали и научни трудове и въз основа на направения анализ на тяхната значимост и съдържащи се в тях научни и научно-приложни приноси, \fmi@confirm, че научните постижения отговарят на изискванията на ЗРАСРБ, Правилника за приложението му и съответния Правилник на СУ „Св. Климент Охридски“ за заемане от кандидата на академичната длъжност \fmi@position в научната област и професионално направление на конкурса. В частност кандидатът удовлетворява минималните национални изисквания в професионалното направление и не е установено плагиатство в представените по конкурса научни трудове.

      Давам своята \textbf{\fmi@evaluation} оценка на кандидатурата.
    \end{enumerate}

  \item \textbf{\MakeUppercase{Общо заключение}}

    Въз основа на гореизложеното, \textbf{\fmi@recommendation} на научното жури да предложи на компетентния орган по избора на Факултета по математика и информатика при СУ „Св. Климент Охридски“ да избере \fmi@candidatename\ да заеме академичната длъжност \fmi@position\ в професионално направление \fmi@profarea.
  \end{enumerate}}

\newcommand{\statementfoot}{
  \vspace{5ex}
  \begin{tabular*}\textwidth{l@{\extracolsep{\fill}}p{22em}}
    \@date & Изготвил становището: \makebox[10em]\hrulefill\\
           & \small\fmi@reviewer
  \end{tabular*}}
