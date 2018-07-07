DECLARE SUB addrec ()
DECLARE SUB displayrec ()
DECLARE SUB modifyrec ()
DECLARE SUB deleterec ()
DECLARE SUB searchrec ()
DECLARE SUB exitprog ()
main:
CLS
LOCATE 1, 15
PRINT STRING$(45, "*")
LOCATE 17, 15
PRINT STRING$(45, "*")
FOR i = 1 TO 17
LOCATE i, 13: PRINT "*"
LOCATE i, 59: PRINT "*"
NEXT i
LOCATE 4, 28
COLOR 14, 9
PRINT "Chirag Library"
LOCATE 2, 32
COLOR 10
PRINT "Welcome!"
LOCATE 7, 32
COLOR 14, 4
PRINT "*Menu*"
LOCATE 9, 27
COLOR 7
PRINT "1. Add Records"
LOCATE 10, 27
PRINT "2. Show All Records"
LOCATE 11, 27
PRINT "3. Modify Records"
LOCATE 12, 27
PRINT "4. Delete Records"
LOCATE 13, 27
PRINT "5. Search Record"
LOCATE 14, 27
PRINT "6. Exit Program"
COLOR 14
LOCATE 16, 27
INPUT "Enter your choice"; c
SELECT CASE c
CASE 1
CALL addrec
CASE 2
CALL displayrec
CASE 3
CALL modifyrec
CASE 4
CALL deleterec
CASE 5
CALL searchrec
CASE 6
CALL exitprog
CASE ELSE
CLS
LOCATE 14, 24:
COLOR 14, 9
PRINT STRING$(30, "*")
LOCATE 16, 24
COLOR 14, 9
PRINT STRING$(30, "*")
LOCATE 15, 27
PRINT "Invalid choice try again!!"
END SELECT
LOCATE 22, 22:
COLOR 14, 4
INPUT "Continue to main menu? [Y/n]"; mans$
IF mans$ = "Y" THEN GOTO main
END

SUB addrec
CLS
OPEN "lib.dat" FOR APPEND AS #1
more:
INPUT "Book's code no."; code
INPUT "Book's Name"; name$
INPUT "Author's Name"; author$
INPUT "No. of books"; number
WRITE #1, code, name$, author, number
INPUT "Continue adding records? [Y/n]"; choice$
IF choice$ = "Y" THEN GOTO more:
CLOSE #1
END SUB

SUB deleterec
CLS
more1:
INPUT "Enter the book's code"; dcode
flag = 0
OPEN "lib.dat" FOR INPUT AS #1
OPEN "temp.dat" FOR OUTPUT AS #1
WHILE NOT EOF(1)
INPUT #1, code, name$, author$, number
IF dcode = code THEN
PRINT "Record successfully deletec!"
flag = 1
ELSE
WRITE #2, code, name$, author$, number
END IF
WEND
IF flag = 0 THEN
PRINT "Record not Found!"
END IF
CLOSE #1, #2
KILL "lib.dat"
NAME "temp.dat" AS "lib.dat"
INPUT "Continue deleting records? [Y/n]"; dans$
IF dans$ = "Y" THEN GOTO more1
END SUB

SUB displayrec
CLS
c = 0
PRINT "Book's Code", "Book's Name", "Author's Name", "No. of books"
PRINT STRING$(50, "*")
OPEN "lib.dat" FOR INPUT AS #1
DO WHILE NOT EOF(1)
INPUT #1, code, name$, author$, number
PRINT code, name$, author$, number
c = c + 1
LOOP
CLOSE #1
PRINT "There are "; c; " records"
END SUB

SUB exitprog
PRINT "BYE!"
END SUB

SUB modifyrec
CLS
more2:
INPUT "Enter book's code"; mcode
OPEN "lib.dat" FOR INPUT AS #1
OPEN "temp.dat" FOR OUTPUT AS #2
flag = 0
WHILE NOT EOF(1)
INPUT #1, code, name$, author$, number
IF (code <> mcode) THEN
WRITE #2, code, name$, author$, number
ELSE
PRINT code, name$, author$, number
flag = 1
INPUT "Do you want to edit this record? [Y/n]"; e$
IF e$ = "Y" THEN
INPUT "Enter book code number"; newcode
INPUT "Enter book name"; newname$
INPUT "Enter author's name"; newauthor$
INPUT "Enter no. of books"; newnumber
WRITE #2, newcode, newname$, newauthor$, newnumber
PRINT "The record is modified"
ELSE
WRITE #2, code, name$, author$, number
END IF
END IF
WEND
IF flag = 0 THEN
PRINT "Record not Found!"
END IF
CLOSE #1, #2
KILL "lib.dat"
NAME "temp.dat" AS "lib.dat"
INPUT "Modify another record? [Y/n]"; moans$
IF moans$ = "Y" THEN GOTO more2
END SUB

SUB searchrec
more3:
CLS
flag = 0
OPEN "lib.dat" FOR INPUT AS #1
INPUT "Enter book code to search"; scode
WHILE NOT EOF(1)
INPUT #1, code, name$, author$, number
IF scode = code THEN
PRINT "Book's Code"; code
PRINT "Book's Name"; name$
PRINT "Author's Name"; author$
PRINT "No. of books"; number
PRINT STRING$(35, "*")
flag = 1
END IF
WEND
IF flag = 0 THEN
PRINT "Record not Found!!"
END IF
CLOSE #1
INPUT "Search another account? [Y/n]"; sans$
IF sans$ = "Y" THEN GOTO more3
END SUB

