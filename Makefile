all : religious-pluralism.syllabus.2012-fall.pdf coursepack-toc.md.pdf close-reading-assignment.md.pdf lens-assignment.md.pdf research-assignment.md.pdf assignment.001.writing-prompt.md.pdf

# make the assignments and combine in a PDF
religious-pluralism.syllabus.2012-fall.pdf : syllabus.md.pdf schedule.md.pdf policies.md.pdf
	./vc
	pdftk syllabus.md.pdf schedule.md.pdf policies.md.pdf cat output religious-pluralism.syllabus.2012-fall.pdf

# the three assignments for the course
close-reading-assignment.md.pdf : close-reading-assignment.md
	./vc
	pandoc --latex-engine pdflatex --bibliography /Users/lmullen/bib/history.bib --csl=chicago-mullen.csl -o close-reading-assignment.md.pdf close-reading-assignment.md

lens-assignment.md.pdf : lens-assignment.md
	./vc
	pandoc --latex-engine pdflatex --bibliography /Users/lmullen/bib/history.bib --csl=chicago-mullen.csl -o lens-assignment.md.pdf lens-assignment.md

research-assignment.md.pdf : research-assignment.md
	./vc
	pandoc --latex-engine pdflatex --bibliography /Users/lmullen/bib/history.bib --csl=chicago-mullen.csl -o research-assignment.md.pdf research-assignment.md

policies.md.pdf : policies.md
	./vc
	pandoc -o policies.md.pdf policies.md --template=syllabus-additional --variable=twocolumn

syllabus.md.pdf : syllabus.md
	./vc
	pandoc -o syllabus.md.pdf syllabus.md --template=syllabus --variable=coursenumber:'UWS 1A-1' --variable=university:'Brandeis University' --variable=office:'Rabb 358' --variable=hours:'after class, 10 a.m. -- 12 p.m., and by appointment' --variable=semester:'Fall 2012' --variable=classroom:'Kutz Hall 130' --variable=times:'Mondays, Wednesdays, 9:00--9:50 a.m.' --variable=mailbox:'Olin-Sang, second floor' --variable=email:'lmullen@brandeis.edu' --variable=web:'http://lincolnmullen.com' --variable=courseweb:'http://lincolnmullen.com/courses/uws/'

schedule.md.pdf : schedule.md
	./vc
	pandoc -o schedule.md.pdf schedule.md --template=syllabus-additional

coursepack-toc.md.pdf : coursepack-toc.markdown
	./vc
	pandoc -o coursepack-toc.md.pdf coursepack-toc.markdown

assignment.001.writing-prompt.md.pdf : assignment.001.writing-prompt.md
	./vc
	pandoc -o assignment.001.writing-prompt.md.pdf assignment.001.writing-prompt.md

upload : religious-pluralism.syllabus.2012-fall.pdf
	scp religious-pluralism.syllabus.2012-fall.pdf lam:public_html/docs/

clean:
	rm syllabus.md.pdf schedule.md.pdf policies.md.pdf religious-pluralism.syllabus.2012-fall.pdf

rebuild : clean all
