/*
          Application : Ring Lessons
          Author      : Mahmoud Kibreet
          Date        : 2018.01.29
*/

Load "odbclib.ring"

pODBC = odbc_init()
See "Connect to database" + nl
see odbc_connect(pODBC,"DBQ=test.mdb;Driver={Microsoft Access Driver (*.mdb)}") + nl
See "Select data" + nl
see odbc_execute(pODBC,"select * from person") + nl
nMax = odbc_colcount(pODBC)
See "Columns Count : " + nMax + nl
while odbc_fetch(pODBC)
        See "Row data:" + nl
        for x = 1 to nMax
                see odbc_getdata(pODBC,x) + " - "
        next
end
See "Close database..." + nl
odbc_disconnect(pODBC)
odbc_close(pODBC)
