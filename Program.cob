000000 IDENTIFICATION DIVISION.
000000 PROGRAM-ID. FutureBabyMama.
000000 ENVIRONMENT DIVISION.
000000 DATA DIVISION.
000000 WORKING-STORAGE SECTION.
000000
000000*    閏年計算したい西暦
000000 1   Year.
000000 2       InputString.
000000 3         InputValue PIC X(4).
000000 3         Tail PIC X(1).
000000 2       CompleteValue PIC 9(4).
000000 2       ErrorMessage PIC X(38).
000000
000000*    閏年計算のためのパラメーター
000000 1   LeapYearCalculator.
000000 2       Algorithms OCCURS 3.
000000 3           DivisionParameter PIC 9(3).
000000 3           ReturnCode PIC 9(2).
000000
000000*    ループで必要になる変数
000000 1   Loop.
000000 2       CurrentIndex PIC 9(1).
000000 2       TotalCount PIC 9(1).
000000
000000 PROCEDURE DIVISION.
000000 MAIN.
000000
000000     DISPLAY "閏年計算したい西暦を入力して下さい".
000000     ACCEPT InputString.
000000
000000     IF Tail NOT = X"0D" THEN
000000         MOVE "西暦は４桁で入力する必要があります。"
000000             TO ErrorMessage
000000     END-IF.
000000     IF InputValue IS NOT NUMERIC THEN
000000         MOVE "西暦は数値で入力する必要があります。"
000000             TO ErrorMessage
000000     END-IF.
000000
000000     IF ErrorMessage NOT = "" THEN
000000         DISPLAY ErrorMessage
000000         COMPUTE RETURN-CODE = 20
000000         STOP RUN
000000     END-IF.
000000
000000     MOVE InputValue TO CompleteValue.
000000
000000     COMPUTE DivisionParameter(1) = 400.
000000     COMPUTE ReturnCode(1) = 10.
000000     COMPUTE DivisionParameter(2) = 100.
000000     COMPUTE ReturnCode(2) = 0.
000000     COMPUTE DivisionParameter(3) = 4.
000000     COMPUTE ReturnCode(3) = 10.
000000
000000     COMPUTE TotalCount =
000000         FUNCTION LENGTH(LeapYearCalculator) /
000000         FUNCTION LENGTH(Algorithms(1)).
000000
000000     PERFORM VARYING CurrentIndex FROM 1 BY 1
000000         UNTIL CurrentIndex > TotalCount
000000
000000         IF FUNCTION MOD(CompleteValue,
000000             DivisionParameter(CurrentIndex)) = 0 THEN
000000
000000             COMPUTE RETURN-CODE = ReturnCode(CurrentIndex)
000000             EXIT PERFORM
000000         END-IF
000000     END-PERFORM.
000000
000000     IF RETURN-CODE = 10 THEN
000000         DISPLAY "入力した西暦は閏年です。"
000000     ELSE
000000         COMPUTE RETURN-CODE = 0
000000         DISPLAY "入力した西暦は平年です。"
000000     END-IF.
000000
000000
000000     STOP RUN.
