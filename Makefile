all : UWS1A-1.2012-fall.syllabus.pdf coursepack-toc.pdf close-reading-assignment.pdf lens-assignment.pdf research-assignment.pdf

# make the assignments and combine in a PDF
UWS1A-1.2012-fall.syllabus.pdf : syllabus.pdf schedule.pdf policies.pdf
	./vc
	pdftk syllabus.pdf schedule.pdf policies.pdf cat output UWS1A-1.2012-fall.syllabus.pdf

# the three assignments for the course
close-reading-assignment.pdf : close-reading-assignment.md
	./vc
	pandoc --latex-engine pdflatex --bibliography /Users/lmullen/bib/history.bib --csl=chicago-mullen.csl -o close-reading-assignment.pdf close-reading-assignment.md

lens-assignment.pdf : lens-assignment.md
	./vc
	pandoc --latex-engine pdflatex --bibliography /Users/lmullen/bib/history.bib --csl=chicago-mullen.csl -o lens-assignment.pdf lens-assignment.md

research-assignment.pdf : research-assignment.md
	./vc
	pandoc --latex-engine pdflatex --bibliography /Users/lmullen/bib/history.bib --csl=chicago-mullen.csl -o research-assignment.pdf research-assignment.md

policies.pdf : policies.md
	./vc
	pandoc -o policies.pdf policies.md --template=syllabus-additional --variable=twocolumn

syllabus.pdf : syllabus.md
	./vc
	pandoc -o syllabus.pdf syllabus.md --template=syllabus --variable=coursenumber:'UWS 1A-1' --variable=university:'Brandeis University' --variable=office:'Rabb 358' --variable=hours:'after class, 10 a.m. -- 12 p.m., and by appointment' --variable=semester:'Fall 2012' --variable=classroom:'TBA' --variable=times:'Mondays, Wednesdays, 9:00--9:50 a.m.' --variable=mailbox:'Olin-Sang, second floor' --variable=email:'lmullen@brandeis.edu' --variable=web:'http://lincolnmullen.com'

schedule.pdf : schedule.md
	./vc
	pandoc -o schedule.pdf schedule.md --template=syllabus-additional

coursepack-toc.pdf : coursepack-toc.markdown
	./vc
	pandoc -o coursepack-toc.pdf coursepack-toc.markdown


