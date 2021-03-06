C
      PROGRAM FTEX05D
C
C  Example of KURVP1DP, KURVP2DP, KURVPDDP
C
      PARAMETER (IDIM=11,IOUT=201,IDTEMP=2*IDIM)
      DOUBLE PRECISION X
      DOUBLE PRECISION Y
      DOUBLE PRECISION TEMP
      DOUBLE PRECISION U
      DOUBLE PRECISION XO
      DOUBLE PRECISION YO
      DOUBLE PRECISION XS
      DOUBLE PRECISION YS
      DOUBLE PRECISION XD
      DOUBLE PRECISION YD
      DOUBLE PRECISION XDD
      DOUBLE PRECISION YDD
      DOUBLE PRECISION XP
      DOUBLE PRECISION YP
      DOUBLE PRECISION S
      DOUBLE PRECISION SIGMA
      DOUBLE PRECISION TINC
      DIMENSION X(IDIM),Y(IDIM),TEMP(IDTEMP),U(IOUT),XO(IOUT),YO(IOUT),
     +          XS(IOUT),YS(IOUT),XD(IOUT),YD(IOUT),XDD(IOUT),YDD(IOUT)
      DIMENSION XP(IDIM),YP(IDIM),S(IDIM)
C
      DATA X/13.0D0,9.0D0,9.0D0,16.0D0,21.0D0,27.0D0,34.0D0,36.0D0,
     +     34.0D0,26.0D0,19.5D0/
      DATA Y/35.0D0,31.0D0,18.0D0,12.0D0,9.6D0,8.4D0,13.2D0,21.6D0,
     +     30.0D0,37.2D0,37.4D0/
C
C  Do KURVP1DP set up.
C
      SIGMA = 1.D0
      CALL KURVP1DP(IDIM,X,Y,XP,YP,TEMP,S,SIGMA,IERR)
      IF (IERR.NE.0) THEN
          PRINT *,'Error return from KURVP1DP =',IERR
          STOP
      END IF
C
C  Get interpolated points using KURV2DP.
C
      TINC = 1.0D0/ (IOUT-1)
      DO 10 I = 1,IOUT
          U(I) = (I-1)*TINC
          CALL KURVP2DP(U(I),XO(I),YO(I),IDIM,X,Y,XP,YP,S,SIGMA)
   10 CONTINUE
C
C  Get the derivatives.
C
      DO 20 I = 1,IOUT
          CALL KURVPDDP(U(I),XS(I),YS(I),XD(I),YD(I),XDD(I),YDD(I),IDIM,
     +        X,Y,XP,YP,S,SIGMA)
   20 CONTINUE
C
C This next section plots the data. You must have a double precision
C version of NCAR Graphics in order for this section to compile and
C run correctly.  For now, it is commented out.
C
C
C  Draw plot.
C
C      CALL DRWFT5(IDIM,X,Y,IOUT,XO,YO,U,XD,YD)
C
      STOP
      END
C      SUBROUTINE DRWFT5(II,X,Y,IO,XO,YO,U,XD,YD)
C
C Define the error file, the Fortran unit number, the workstation type,
C and the workstation ID to be used in calls to GKS routines.
C
C      PARAMETER (IERRF=6, LUNIT=2, IWTYPE=1,  IWKID=1)   ! NCGM
C      PARAMETER (IERRF=6, LUNIT=2, IWTYPE=8,  IWKID=1)   ! X Windows
C      PARAMETER (IERRF=6, LUNIT=2, IWTYPE=11, IWKID=1)   ! PDF
C      PARAMETER (IERRF=6, LUNIT=2, IWTYPE=20, IWKID=1)   ! PostScript
C
C      PARAMETER (IERRF=6, LUNIT=2, IWTYPE=1,  IWKID=1)
C      DOUBLE PRECISION X
C      DOUBLE PRECISION Y
C      DOUBLE PRECISION XO
C      DOUBLE PRECISION YO
C      DOUBLE PRECISION U
C      DOUBLE PRECISION XD
C      DOUBLE PRECISION YD
C
C  Open GKS, open and activate a workstation.
C
C      CALL GOPKS(IERRF,ISZDM)
C      CALL GOPWK(IWKID,LUNIT,IWTYPE)
C      CALL GACWK(IWKID)
C
C  Define a color table.
C
C      CALL GSCR(IWKID,0,1.0D0,1.0D0,1.0D0)
C      CALL GSCR(IWKID,1,0.0D0,0.0D0,0.0D0)
C      CALL GSCR(IWKID,2,1.0D0,0.0D0,0.0D0)
C      CALL GSCR(IWKID,3,0.0D0,1.0D0,0.0D0)
C      CALL GSCR(IWKID,4,0.0D0,0.0D0,1.0D0)
C
C  Draw markers at original points.
C
C      CALL BKGFT5(0.D0,40.D0,0.D0,40.D0,0.15D0,0.85D0,
C     +            'Demo for KURVP1DP/KURVP2DP',0.035D0,0.5D0,0.93D0,0)
C      CALL GRIDAL(4,5,4,5,1,1,10,0.D0,0.D0)
C      CALL GSMKSC(2.D0)
C      CALL GSPMCI(4)
C      CALL GPM(II,X,Y)
C
C  Draw the interpolated curve
C
C      CALL CURVE(XO,YO,IO)
C      CALL FRAME
C
C  Plot the first derivatives of X and Y with respect to the parametric
C  variable U.
C
C      CALL SET(0.D0,1.D0,0.D0,1.D0,0.D0,1.D0,0.D0,1.D0,1)
C      CALL PCSETI('FN',21)
C      CALL PLCHHQ(0.5D0,0.95D0,'Derivatives from KURVPDDP',0.035D0,
C     +            0.D0,0.D0)
C      CALL BKGFT5(0.D0,1.D0,-100.D0,100.D0,0.55D0,0.87D0,'dx/du',
C     +            0.030D0,0.65D0,0.82D0,1)
C      CALL GRIDAL(5,5,4,5,1,1,10,0.D0,-100.D0)
C      CALL CURVE(U,XD,IO)
C      CALL BKGFT5(0.D0,1.D0,-100.D0,100.D0,0.10D0,0.42D0,'dy/du',
C     +            0.030D0,0.39D0,0.37D0,1)
C      CALL GRIDAL(5,5,4,5,1,1,10,0.D0,-100.D0)
C      CALL CURVE(U,YD,IO)
C      CALL FRAME
C
C      CALL GDAWK(IWKID)
C      CALL GCLWK(IWKID)
C      CALL GCLKS
C
C      STOP
C      END
C      SUBROUTINE BKGFT5(XL,XR,YB,YT,YPB,YPT,LABEL,SIZL,POSXL,POSYL,IZL)
C      DOUBLE PRECISION XL
C      DOUBLE PRECISION XR
C      DOUBLE PRECISION YB
C      DOUBLE PRECISION YT
C      DOUBLE PRECISION YPB
C      DOUBLE PRECISION YPT
C      DOUBLE PRECISION SIZL
C      DOUBLE PRECISION POSXL
C      DOUBLE PRECISION POSYL
C      DOUBLE PRECISION XX
C      DOUBLE PRECISION YY
C      DIMENSION XX(2),YY(2)
C      CHARACTER*(*) LABEL
C
C      CALL SET(0.D0,1.D0,0.D0,1.D0,0.D0,1.D0,0.D0,1.D0,1)
C      CALL PCSETI('FN',21)
C      CALL PLCHHQ(POSXL,POSYL,LABEL,SIZL,0.D0,0.D0)
C      CALL SET(0.17D0,0.87D0,YPB,YPT,XL,XR,YB,YT,1)
C      IF (IZL.NE.0) THEN
C          XX(1) = XL
C          XX(2) = XR
C          YY(1) = 0.D0
C          YY(2) = 0.D0
C          CALL GSPLCI(2)
C          CALL GPL(2,XX,YY)
C          CALL GSPLCI(1)
C      END IF
C
C      CALL GASETI('LTY',1)
C      CALL PCSETI('FN',21)
C      CALL GASETR('XLS',0.02D0)
C      CALL GASETC('XLF','(F4.1)')
C      CALL GASETR('YLS',0.02D0)
C      CALL GASETC('YLF','(F6.1)')
C      CALL GASETR('XMJ',0.02D0)
C      CALL GASETR('YMJ',0.02D0)
C
C      RETURN
C      END
