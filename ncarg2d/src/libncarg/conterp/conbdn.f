C
C	$Id: conbdn.f,v 1.5 2008-07-27 00:16:56 haley Exp $
C                                                                      
C                Copyright (C)  2000
C        University Corporation for Atmospheric Research
C                All Rights Reserved
C
C The use of this Software is governed by a License Agreement.
C
      SUBROUTINE CONBDN
C
C Calling this do-nothing subroutine forces "ld" to load the following
C block data routine (but only if they are in the same ".f" file).
C
        RETURN
C
      END
CNOSPLIT
      BLOCKDATA CONBDNX
C
C
C
C COMMON DATA
C
C NOTE THE COMMON BLOCKS LISTED INCLUDE ALL THE COMMON USED BY
C      THE ENTIRE CONRAN FAMILY, NOT ALL MEMBERS WILL USE ALL
C      THE COMMON DATA.
C
C   CONRA1
C       CL-ARRAY OF CONTOUR LEVELS
C       NCL-NUMBER OF CONTOUR LEVELS
C       OLDZ-Z VALUE OF LEFT NEIGHBOR TO CURRENT LOCATION
C       PV-ARRAY OF PREVIOUS ROW VALUES
C       HI-LARGEST CONTOUR PLOTTED
C       FLO-LOWEST CONTOUR PLOTTED
C       FINC-INCREMENT LEVEL BETWEEN EQUALLY SPACED CONTOURS
C   CONRA2
C       REPEAT-FLAG TO TRIANGULATE AND DRAW OR JUST DRAW
C       EXTRAP-PLOT DATA OUTSIDE OF CONVEX DATA HULL
C       PER-PUT PERIMETER ARROUND PLOT
C       MESS-FLAG TO INDICATE MESSAGE OUTPUT
C       ISCALE-SCALING SWITCH
C       LOOK-PLOT TRIANGLES FLAG
C       PLDVLS-PLOT THE DATA VALUES FLAG
C       GRD-PLOT GRID FLAG
C       CON-USER SET OR PROGRAM SET CONTOURS FLAG
C       CINC-USER OR PROGRAM SET INCREMENT FLAG
C       CHILO-USER OR PROGRAM SET HI LOW CONTOURS
C       LABON-FLAG TO CONTROL LABELING OF CONTOURS
C       PMIMX-FLAG TO CONTROL THE PLOTTING OF MIN"S
C             AND MAX"S
C       SCALE-THE SCALE FACTOR FOR CONTOUR LINE VALUES
C             AND MIN , MAX PLOTTED VALUES
C       FRADV-ADVANCE FRAME BEFORE PLOTTING TRIANGUALTION
C       EXTRI-ONLY PLOT TRIANGULATION
C       BPSIZ-BREAKPOINT SIZE FOR DASHPATTERNS
C       LISTOP-LIST OPTIONS ON UNIT6 FLAG
C   CONRA3
C       IREC-PORT RECOVERABLE ERROR FLAG
C   CONRA4
C       NCP-NUMBER OF DATA POINTS USED AT EACH POINT FOR
C           POLYNOMIAL CONSTRUCTION.
C       NCPSZ-MAX SIZE ALLOWED FOR NCP
C   CONRA5
C       NIT-FLAG TO INDICATE STATUS OF SEARCH DATA BASE
C       ITIPV-LAST TRIANGLE INTERPOLATION OCCURRED IN
C  CONRA6
C       XST-X COORDINATE START POINT FOR CONTOURING
C       YST-Y COORDINATE START POINT FOR CONTOURING
C       XED-X COORDINATE END POINT FOR CONTOURING
C       YED-Y COORDINATE END POINT FOR CONTOURING
C       STPSZ-STEP SIZE FOR X,Y CHANGE WHEN CONTOURING
C       IGRAD-NUMBER OF GRADUATIONS FOR CONTOURING(STEP SIZE)
C       IG-RESET VALUE FOR IGRAD
C       XRG-X RANGE OF COORDINATES
C       YRG-Y RANGE OF COORDINATES
C       BORD-PERCENT OF FRAME USED FOR CONTOUR PLOT
C       PXST-X PLOTTER START ADDRESS FOR CONTOURS
C       PYST-Y PLOTTER START ADDRESS FOR CONTOURS
C       PXED-X PLOTTER END ADDRESS FOR CONTOURS
C       PYED-Y PLOTTER END ADDRESS FOR CONTOURS
C       ITICK-NUMBER OF TICK MARKS FOR GRIDS AND PERIMETERS
C CONR18
C       TITLE-SWITCH TO INDICATE IF TITLE OPTION ON OR OFF
C       ISTRNG-CHARACTER STRING OF TITLE
C       ICNT-CHARACTER COUNT OF ISTRNG
C       ITLSIZ-SIZE OF TITLE IN PWRIT UNITS
C CONR19
C       IHIGH-DEFAULT COLOR (INTENSITY) INDEX SETTING
C       INMAJ-CONTOUR LEVEL COLOR (INTENSITY) INDEX FOR MAJOR LINES
C       INMIN-CONTOUR LEVEL COLOR (INTENSITY) INDEX FOR MINOR LINES
C       INLAB-TITLE AND MESSAGE COLOR (INTENSITY) INDEX
C       INDAT-DATA VALUE COLOR (INTENSITY) INDEX
C       FORM-THE FORMAT FOR PLOTTING THE DATA VALUES
C       LEN-THE NUMBER OF CHARACTERS IN THE FORMAT
C       IFMT-SIZE OF THE FORMAT FIELD
C       LEND-DEFAULT FORMAT LENGTH
C       IFMTD-DEFAULT FORMAT FIELD SIZE
C       ISIZEP-SIZE OF THE PLOTTED DATA VALUES
C  CONRA9
C       X-ARRAY OF X COORDINATES OF CONTOURS DRAWN AT CURRENT CONTOUR
C          LEVEL
C       Y-ARRAY OF Y COORDINATES OF CONTOURS DRAWN AT CURRENT CONTOUR
C          LEVEL
C       NP-COUNT IN X AND Y
C       MXXY-SIZE OF X AND Y
C       TR-TOP RIGHT CORNER VALUE OF CURRENT CELL
C       BR-BOTTOM RIGHT CORNER VALUE OF CURRENT CELL
C       TL-TOP LEFT CORNER VALUE OF CURRENT CELL
C       BL-BOTTOM LEFT CORNER VALUE OF CURRENT CELL
C       CONV-CURRENT CONTOUR VALUE
C       XN-X POSITION WHERE CONTOUR IS BEING DRAWN
C       YN-Y POSITION WHERE CONTOUR IS BEING DRAWN
C       ITLL-TRIANGLE WHERE TOP LEFT CORNER OF CURRENT CELL LIES
C       IBLL-TRIANGLE OF BOTTOM LEFT CORNER
C       ITRL-TRIANGLE OF TOP RIGHT CORNER
C       IBRL-TRIANGLE OF BOTTOM LEFT CORNER
C       XC-X COORDINATE OF CURRENT CELL
C       YC-Y CORRDINATE OF CURRENT CELL
C       ITLOC-IN CONJUNCTION WITH PV STORES THE TRIANGLE WHERE PV
C             VALUE CAME FROM
C CONR10
C       NT-NUMBER OF TRIANGLES GENERATED
C       NL-NUMBER OF LINE SEGMENTS
C       NTNL-NT+NL
C       JWIPT-POINTER INTO IWK WHERE WHERE TRIANGLE POINT NUMBERS
C             ARE STORED
C       JWIWL-IN IWK THE LOCATION OF A SCRATCH SPACE
C       JWIWP-IN IWK THE LOCATION OF A SCRATCH SPACE
C       JWIPL-IN IWK THE LOCATION OF END POINTS FOR BORDER LINE
C             SEGMENTS
C       IPR-IN WK THE LOCATION OF THE PARTIAL DERIVITIVES AT EACH
C           DATA POINT
C       ITPV-THE TRIANGLE WHERE THE PREVIOUS VALUE CAME FROM
C CONR20
C       NREP-NUMBER OF REPETITIONS OF DASH PATTERN BEFORE A LABEL
C       NCRT-NUMBER OF CRT UNITS FOR A DASH MARK OR BLANK
C       ISIZEL-SIZE OF CONTOUR LINE LABELS
C       NDASH-ARRAY CONTAINING THE NEGATIVE VALUED CONTOUR DASH
C             PATTERN
C       MINGAP-NUMBER OF UNLABELED LINES BETWEEN EACH LABELED ONE
C       IDASH-POSITIVE VALUED CONTOUR DASH PATTERN
C       ISIZEM-SIZE OF PLOTTED MINIMUMS AND MAXIMUMS
C       EDASH-EQUAL VALUED CONTOUR DASH PATTERN
C       TENS-DEFAULT TENSION SETTING FOR SMOOTHING
C CONR12
C       IXMAX,IYMAX-MAXINUM X AND Y COORDINATES RELATIVE TO THE
C                 SCRATCH ARRAY, SCRARR
C       XMAX,YMAX-MAXIMUM X AND Y COORDINATES RELATIVE TO USERS
C                 COORDINATE SPACE
C CONR13
C       XVS-ARRAY OF THE X COORD FOR SHIELDING
C       YVS-ARRAY OF THE Y COORD FOR SHIELDING
C       ICOUNT-COUNT OF THE SHIELD ELEMENTS
C       SPVAL-SPECIAL VALUE USED TO HALT CONTOURING AT THE SHIELD
C               BOUNDRY
C       SHIELD-LOGICAL FLAG TO SIGNAL STATUS OF SHIELDING
C       SLDPLT-LOGICAL FLAG TO INDICTE STATUS OF SHIEDL PLOTTING
C CONR14
C       LINEAR-C1 LINAER INTERPOLATIN FLAG
C
C
      COMMON /CONRA1/ CL(30)     ,NCL        ,OLDZ       ,PV(210)    ,
     1                FINC       ,HI         ,FLO
      COMMON /CONRA2/ REPEAT     ,EXTRAP     ,PER        ,MESS       ,
     1                ISCALE     ,LOOK       ,PLDVLS     ,GRD        ,
     2                CINC       ,CHILO      ,CON        ,LABON      ,
     3                PMIMX      ,SCALE      ,FRADV      ,EXTRI      ,
     4                BPSIZ      ,LISTOP
      COMMON /CONRA3/ IREC
      COMMON /CONRA4/ NCP        ,NCPSZ
      COMMON /CONRA5/ NIT        ,ITIPV
      COMMON /CONRA6/ XST        ,YST        ,XED        ,YED        ,
     1                STPSZ      ,IGRAD      ,IG         ,XRG        ,
     2                YRG        ,BORD       ,PXST       ,PYST       ,
     3                PXED       ,PYED       ,ITICK
      COMMON /CONR18/ TITLE      ,ICNT   ,ITLSIZ
      COMMON /CONR19/ IHIGH      ,INMAJ      ,INLAB      ,INDAT      ,
     1              LEN      ,IFMT       ,LEND       ,
     2                IFMTD      ,ISIZEP     ,INMIN
      COMMON /CONRA9/ ICOORD(500),NP         ,MXXY       ,TR         ,
     1                BR         ,TL         ,BL         ,CONV       ,
     2                XN         ,YN         ,ITLL       ,IBLL       ,
     3                ITRL       ,IBRL       ,XC         ,YC         ,
     4                ITLOC(210) ,JX         ,JY         ,ILOC       ,
     5                ISHFCT     ,XO         ,YO         ,IOC        ,NC
      COMMON /CONR10/ NT         ,NL         ,NTNL       ,JWIPT      ,
     1                JWIWL      ,JWIWP      ,JWIPL      ,IPR        ,
     2                ITPV
      COMMON /CONR20/ NREP       ,NCRT       ,ISIZEL     ,
     1                MINGAP     ,ISIZEM         ,
     2                TENS
      COMMON /CONR12/ IXMAX      ,IYMAX      ,XMAX       ,YMAX
      LOGICAL         REPEAT     ,EXTRAP     ,PER        ,MESS       ,
     1                LOOK       ,PLDVLS     ,GRD        ,LABON      ,
     2                PMIMX      ,FRADV      ,EXTRI      ,CINC       ,
     3                TITLE      ,LISTOP     ,CHILO      ,CON
      COMMON /CONR13/XVS(50),YVS(50),ICOUNT,SPVAL,SHIELD,
     1               SLDPLT
      LOGICAL SHIELD,SLDPLT
      COMMON /CONR14/LINEAR
      LOGICAL LINEAR
      COMMON /CONR15/ ISTRNG
        CHARACTER*64 ISTRNG
        COMMON /CONR16/ FORM
        CHARACTER*10 FORM
        COMMON /CONR17/ NDASH, IDASH, EDASH
        CHARACTER*10 NDASH, IDASH, EDASH
        COMMON /RANINT/ IRANMJ, IRANMN, IRANTX
        COMMON /RAQINT/ IRAQMJ, IRAQMN, IRAQTX
        COMMON /RASINT/ IRASMJ, IRASMN, IRASTX
        SAVE
C
C
C
C
        DATA ICOUNT,SHIELD,SLDPLT,LINEAR/0,.FALSE.,.FALSE.,.FALSE./
        DATA REPEAT,EXTRAP,PER/.FALSE.,.FALSE.,.TRUE./
        DATA FRADV,EXTRI,BPSIZ/.TRUE.,.FALSE.,0.0/
        DATA TITLE,MESS,LOOK/.FALSE.,.TRUE.,.FALSE./
        DATA PLDVLS,GRD/.FALSE.,.FALSE./
        DATA CON,CINC,CHILO/.FALSE.,.FALSE.,.FALSE./
        DATA SCALE,PMIMX/1.,.FALSE./
        DATA ISIZEP,ISIZEM,TENS/8,15,2.5/
        DATA INMAJ,INMIN,INLAB,INDAT/1, 1, 1, 1/
        DATA IRANMJ, IRANMN, IRANTX /1, 1, 1/
        DATA IRASMJ, IRASMN, IRASTX /1, 1, 1/
        DATA IRAQMJ, IRAQMN, IRAQTX /1, 1, 1/
        DATA LABON/.TRUE./,LISTOP/.FALSE./
        DATA BORD,ITICK/.9,10/
        DATA ISCALE,ITLSIZ/0,16/
        DATA ITIPV,NIT,NCL/0,0,0/
        DATA NCPSZ/25/
        DATA IHIGH/255/
        DATA NCP /4/
        DATA IREC /1/
        DATA LEN,IFMT,LEND,IFMTD/0,0,7,10/
        DATA IGRAD,IG/40,40/
        DATA NREP,NCRT,ISIZEL,MXXY,MINGAP/6,3,9,500,3/
        DATA IDASH(1:1)/' '/
        DATA NDASH(1:1)/' '/
        DATA EDASH(1:1)/' '/
        DATA ISHFCT/9/
      END