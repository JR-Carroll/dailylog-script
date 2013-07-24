# Script for starting daily personal logs
# Very handy!  Must do as often as I can...  

MONTH=`date '+%b'`
YEAR=`date '+%Y'`
DAY=`date '+%d'`
WEEKDAY=`date '+%A'`
FULLDATE=`date '+%D'`
FILE_NAME=($WEEKDAY"_"$MONTH"_"$DAY".dlog")
USER_PATH=$(getent passwd nammer | cut -d: -f6)
LOG_PATH="$USER_PATH/documents/_notes/daily/"
FILE_PATH=($USER_PATH/documents/_notes/daily/$YEAR/$MONTH/$DAY/$FILE_NAME)
DAY_PATH=($USER_PATH/documents/_notes/daily/$YEAR/$MONTH/$DAY/)
MONTH_PATH=($USER_PATH/documents/_notes/daily/$YEAR/$MONTH/)
YEAR_PATH=($USER_PATH/documents/_notes/daily/$YEAR/)

# Check to see if the log file exists already... if not...
if [ ! -f $FILE_PATH ]; then
	# make the directory/file as needed!
	if [ ! -d $DAY_PATH ]; then
		# make the day folder
		if [ ! -d $MONTH_PATH ]; then
            if [ ! -d $YEAR_PATH ]; then
			    # make the year folder
                mkdir $LOG_PATH/$YEAR
            fi

            # make the month folder
			mkdir $LOG_PATH/$YEAR/$MONTH
		fi
		
		# make the day folder
		mkdir $LOG_PATH/$YEAR/$MONTH/$DAY
	fi
	
	# make the log file
	touch $FILE_PATH
    figlet $FULLDATE >> $FILE_PATH
fi

if [ -e $FILE_PATH ]; then
	# open the log for editing!
    echo -e '\n' >> $FILE_PATH
    echo "-----------------------------------" >> $FILE_PATH
    date >> $FILE_PATH
    echo "-----------------------------------" >> $FILE_PATH
    echo -e '\n' >> $FILE_PATH
	vim + $FILE_PATH
fi

