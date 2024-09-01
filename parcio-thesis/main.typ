#import "template/template.typ": *
#import "template/parcio-bib.typ": parcio-bib

// Title, Author, Abstract,
// optional: thesis-type to specify "Bachelor", "Master", "PhD", etc.,
// optional: reviewers to specify "first-reviewer", "second-reviewer" and (if needed) "supervisor".
// optional: date to specify your deadline (default: datetime.today())
// optional: lang to specify the language for text features like "" or hyphenation (specify as ISO 639-1/2/3 code, default: "en")
#show: project.with(
  "Title", 
  (
    name: "Author",
    mail: "author@ovgu.de"
  ),
  include "chapters/abstract.typ",
  thesis-type: "Bachelor/Master",
  reviewers: ("Prof. Dr. Musterfrau", "Prof. Dr. Mustermann", "Dr. Evil")
)

// Set lower roman numbering for ToC and abstract.
#set page(margin: 2.5cm, footer: none)
#outline(depth: 3)

#empty-page

// Set arabic numbering for everything else and reset page counter.
#set page(numbering: "1", footer: context {
  let page-count = counter(page).get().first()
  let page-align = if calc.odd(page-count) { right } else { left } 
  align(page-align, counter(page).display("1"))
})
#counter(page).update(1)

// --- ACTUAL CONTENT OF THESIS. --- //

#include "chapters/introduction/intro.typ"
#include "chapters/background/background.typ"
#include "chapters/eval/eval.typ"
#include "chapters/conclusion/conc.typ"

// --------------------------------- //

#empty-page

#parcio-bib("bibliography/report.bib", style: "bibliography/apalike.csl", enable-backrefs: true)

#empty-page

#include "appendix.typ"

#empty-page

#include "legal.typ"