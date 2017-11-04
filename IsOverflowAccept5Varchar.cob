000000 IDENTIFICATION DIVISION.
000000 PROGRAM-ID. IsOverflowAccept5Varchar.
000000 ENVIRONMENT DIVISION.
000000 DATA DIVISION.
000000
000000 WORKING-STORAGE SECTION.
000000
000000*    ループカウンタ
000000 1   LoopIndex PIC 9.
000000 1   LoopCount PIC 9.
000000
000000 LINKAGE SECTION.
000000
000000 1   IsOverflow PIC 9.
000000 1   TargetString PIC X(5).
000000 1   Serach PIC X(5).
000000
000000 PROCEDURE DIVISION USING IsOverflow, TargetString.
000000 MAIN.
000000     COMPUTE IsOverflow = 1.
000000
000000     COMPUTE LoopCount = FUNCTION LENGTH(TargetString).
000000
000000     PERFORM VARYING LoopIndex FROM 1 BY 1
000000         UNTIL LoopIndex > LoopCount
000000
000000         IF TargetString(LoopIndex:1) = X"0D" THEN
000000             COMPUTE IsOverflow = 0
000000             EXIT PROGRAM
000000         END-IF
000000     END-PERFORM.
000000
000000     EXIT PROGRAM.