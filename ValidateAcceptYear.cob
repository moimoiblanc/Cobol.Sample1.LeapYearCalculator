000000 IDENTIFICATION DIVISION.
000000 PROGRAM-ID. ValidateAcceptYear.
000000 ENVIRONMENT DIVISION.
000000 DATA DIVISION.
000000 WORKING-STORAGE SECTION.
000000
000000*    閏年計算したい西暦
000000 1   ValidateResult PIC 9.
000000 1   Validates.
000000   2     Element OCCURS 3.
000000    3        SubPrograms PIC X(25).
000000    3        Messages PIC X(40).
000000
000000*    ループカウンタ
000000 1   LoopIndex PIC 9.
000000 1   LoopCount PIC 9.
000000
000000 LINKAGE SECTION.
000000
000000 1   AcceptKind PIC 9(2).
000000 1   AcceptString PIC X(5).
000000
000000 PROCEDURE DIVISION USING AcceptKind, AcceptString.
000000 MAIN.
000000
000000     COMPUTE AcceptKind = 20.
000000
000000     MOVE "IsEmptyAcceptVarchar" TO SubPrograms(1).
000000     MOVE "西暦はブランクにできません。" TO Messages(1).
000000
000000     MOVE "IsOverflowAccept5Varchar" TO SubPrograms(2).
000000     MOVE "西暦は４桁未満で入力する必要があります。"
000000         TO Messages(2).
000000
000000     MOVE "IsNgPatternAccept5Varchar" TO SubPrograms(3).
000000     MOVE "西暦は数値で入力する必要があります。" TO Messages(3).
000000
000000     COMPUTE LoopCount =
000000         FUNCTION LENGTH(Validates) /
000000         FUNCTION LENGTH(Element(1)).
000000
000000     PERFORM VARYING LoopIndex FROM 1 BY 1
000000         UNTIL LoopIndex > LoopCount
000000
000000         CALL SubPrograms(LoopIndex)
000000             USING ValidateResult, AcceptString
000000
000000         IF ValidateResult NOT = 0 THEN
000000             DISPLAY Messages(LoopIndex)
000000             EXIT PROGRAM
000000         END-IF
000000
000000     END-PERFORM.
000000
000000     COMPUTE AcceptKind = 0.
000000
000000     EXIT PROGRAM.

