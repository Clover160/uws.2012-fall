all: assignments.pdf policies.pdf syllabus.pdf schedule.pdf

# make the assignments and combine in a PDF
assignments.pdf : close-reading-assignment.pdf lens-assignment.pdf research-assignment.pdf
	pdftk close-reading-assignment.pdf lens-assignment.pdf research-assignment.pdf cat output assignments.pdf

# the three assignments for the course
close-reading-assignment.pdf : close-reading-assignment.md
	pandoc --latex-engine pdflatex --bibliography /Users/lmullen/bib/history.bib --csl=chicago-mullen.csl -o close-reading-assignment.pdf close-reading-assignment.md

lens-assignment.pdf : lens-assignment.md
	pandoc --latex-engine pdflatex --bibliography /Users/lmullen/bib/history.bib --csl=chicago-mullen.csl -o lens-assignment.pdf lens-assignment.md

research-assignment.pdf : research-assignment.md
	pandoc --latex-engine pdflatex --bibliography /Users/lmullen/bib/history.bib --csl=chicago-mullen.csl -o research-assignment.pdf research-assignment.md

policies.pdf : policies.md
	pandoc -o policies.pdf policies.md

syllabus.pdf : syllabus.md
	pandoc -o syllabus.pdf syllabus.md

schedule.pdf : schedule.md
	pandoc -o schedule.pdf schedule.md
