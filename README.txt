Submission of Pranav Kirsur
Roll No. 2018101070
Group A

******************************************************************************************
Note:
In this document, any parameter between [](square brackets) is an optional parameter.

******************************************************************************************
Q1:
Scripts: 
musiclibadd:
	Usage:
		./musiclibadd.sh -n'<name>' [-a'<artist>'] [-g'<genre>'] [-l'<link>']
	Name is mandatory
	Rest are optional parameters

	It checks if duplicate song is present(according to name and artist) and refuses to add if so.

musiclibdelete.sh
	Usage:
		./musiclibdelete.sh <id>

musiclibedit.sh
	Usage:
		./musiclibedit.sh -i'<id>' -n'<newname>' -a'<newartist>' -g'<newgenre>' -l'<newlink>'
	Note that all new parameters need to be updated.

musiclibview.sh
	Usage:
		./musiclibview.sh [-a'<artist>'] [-g'<genre>'] 
	Display songs. Possible filtering by artist and genre 

*******************************************************************************************
Q2:
Script:
searching.sh
Usage:
	./searching.sh '<searchstring>' 'URL'
Note that if computer is not connected to internet or URL in invalid or if any such error is there, it indicates an error.

*******************************************************************************************
Q3:
Script:
	pomodoro.sh
Usage:
	./pomodoro.sh <positive number>
If no number is given or number is not positive it gives an error.
Note that it occupies the terminal while it is running and gives output in the same terminal window

*******************************************************************************************
Q3 Bonus:
Script:
	pomodorobonus.sh
Usage:
	./pomodorobonus.sh <positive number>
If no number is given or number is not positive it gives an error.
It gives output as notifications using notify-send

*******************************************************************************************
Q4:
Scripts:
setup
	Usage:
		./setup
	This installs at which is needed for this program to run.
reminderadd.sh
	Usage:
		./reminderadd.sh -d'<date>' -t'<time>' -b'<message body>'
	Formats:
		<date> : yyyy-mm-dd
		<time> : hh:mm (24 hrs)

reminderlist.sh
	Usage:
		./reminderlist.sh [-d'<date>'] [-b'<messagebodysubstring>']
	Formats:
		<date> : yyyy-mm-dd
	Display reminders.
	Possible filtering by date and body substring

remindersdelete.sh
	Usage:
		./remindersdelete.sh <id>
	Delete reminder with <id> as ID

remindersedit.sh
	Usage:
		./remindersedit.sh -i'<id>' -d'<newdate>' -t'<newtime>' -b'<new message body>'
	Formats:
		<newdate> : yyyy-mm-dd
		<newtime> : hh:mm (24 hrs)
	Edit reminder with given id
	Note that date, time, body need to be updated with their new values.
	*awesome feature*If <id> is not present, it creates a reminder with those parameters.

******************************************************************************************
Q5:
Scripts:

script1.sh
	Usage:
		./script1.sh
	Runs the commands as required in the question.

script2.sh
	Usage:
		./script2.sh
	Runs the commands as required in the question.

******************************************************************************************
Q6:
Scripts:
2018101070.sh
	Usage: bash ./2018101070.sh '<moviesfilepath>' '<moviefiledestination>'
	It creates folders called Bad, Average, Good, Awesome and adds empty movie files to these folders according to their rating in the input file given.

******************************************************************************************