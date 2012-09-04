all : religious-pluralism.syllabus.2012-fall.pdf coursepack-toc.md.pdf 
	
religious-pluralism.syllabus.2012-fall.pdf : syllabus.md.pdf schedule.md.pdf policies.md.pdf
	pdftk syllabus.md.pdf schedule.md.pdf policies.md.pdf cat output religious-pluralism.syllabus.2012-fall.pdf

policies.md.pdf : vc policies.md
	pandoc -o policies.md.pdf policies.md --template=syllabus-additional --variable=twocolumn

syllabus.md.pdf : vc syllabus.md
	pandoc -o syllabus.md.pdf syllabus.md --template=syllabus --variable=coursenumber:'UWS 1A-1' --variable=university:'Brandeis University' --variable=office:'Rabb 228' --variable=hours:'after class, 10 a.m. -- 12 p.m., and by appointment' --variable=semester:'Fall 2012' --variable=classroom:'Kutz Hall 130' --variable=times:'Mondays, Wednesdays, 9:00--9:50 a.m.' --variable=mailbox:'Olin-Sang, second floor' --variable=email:'lmullen@brandeis.edu' --variable=web:'http://lincolnmullen.com' --variable=courseweb:'http://lincolnmullen.com/courses/uws/'

schedule.md.pdf : vc schedule.md
	pandoc -o schedule.md.pdf schedule.md --template=syllabus-additional

coursepack-toc.md.pdf : vc coursepack-toc.markdown
	pandoc -o coursepack-toc.md.pdf coursepack-toc.markdown

upload : religious-pluralism.syllabus.2012-fall.pdf
	scp religious-pluralism.syllabus.2012-fall.pdf lam:public_html/docs/

# update the version control information
.PHONY : vc
vc	: 
	./vc

clean:
	rm syllabus.md.pdf schedule.md.pdf policies.md.pdf religious-pluralism.syllabus.2012-fall.pdf coursepack-toc.md.pdf

rebuild : clean all
