;====================================================================================================================================
;       Phase 2 of COAL Project
;       Submitted by :
;               1. Aleezeh Usman 18I-0529
;               2. Areesha Tahir 18I-1655
;               3. Zarak Jehan   18I-0256
;       Section : C
;=====================================================================================================================================

.model small 
.stack 100h
.data
;file variables
    mouseX dw ?
    mouseY dw ?
    HANDLE DW ?
    file db 'file.txt',0
    buffer db 5000 DUP(?)
    play db "PLAY" , '$'
    rules db "INSTRUCTIONS" , '$'
    finish db "EXIT" , '$'
    menu db "GAME MENU" , '$'
    
;Game variables
    Spaceship DB 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,3,3,3,3,3,52,52,52,52,52,3,3,3,3,3,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,3,3,3,3,52,52,52,52,15,15,52,3,3,3,3,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,3,3,3,52,52,52,52,52,52,52,15,52,3,3,3,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,3,3,3,52,52,52,52,52,52,52,15,52,3,3,3,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,3,3,52,52,52,52,52,52,52,52,52,15,52,3,3,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,3,3,52,52,52,52,52,52,52,52,52,15,52,3,3,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,3,1,1,1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,3,52,1,52,1,52,1,52,1,52,1,52,1,52,3,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,3,52,1,52,1,52,1,52,1,52,1,52,1,52,3,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,3,1,1,1,1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,3,3,3,3,3,3,3
          DB 3,3,3,64,64,64,4,4,64,64,64,4,4,64,64,64,4,4,64,64,64,4,4,64,64,64,3,3,3,3,3
          DB 3,64,64,64,64,64,4,4,64,64,64,4,4,64,64,64,4,4,64,64,64,4,4,64,64,64,64,64,3,3,3
          DB 64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,64,3,3
          DB 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,3,3
          DB 3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,3,3,3
          DB 3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,3,3,3,3,3
          DB 3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,3,4,4,4,4,64,3,3,3,4,4,4,4,64,3,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,3,3,4,4,64,3,3,3,3,3,4,4,64,3,3,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,3,3,3,64,3,3,3,3,3,3,3,64,3,3,3,3,3,3,3,3,3,3,3,3
          DB 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
          
          
    SpaceshipX dw 280
    SpaceshipY dw 90
    Flamingo DB 3,3,3,3,3,12,12,12,3,3,3,3
         DB 3,3,3,4,4,12,12,12,12,3,3,3
         DB 3,3,3,4,3,3,3,12,12,3,3,3
         DB 3,3,3,3,3,3,12,12,3,3,3,3
         DB 3,3,3,3,3,12,12,3,3,3,3,3
         DB 3,3,3,3,12,12,3,3,3,3,3,3
         DB 3,3,3,12,12,3,3,3,3,3,3,3
         DB 3,3,12,12,12,12,12,12,12,3,3,3
         DB 3,3,12,12,12,12,12,12,12,12,3,3
         DB 3,3,3,12,12,12,12,12,12,12,12,3
         DB 3,3,3,3,12,12,12,12,12,3,3,3
         DB 3,3,3,3,3,3,4,4,3,3,3,3
         DB 3,3,3,3,3,3,4,3,4,3,3,3
         DB 3,3,3,3,3,3,4,3,3,4,3,3
         DB 3,3,3,3,3,4,4,4,4,3,3,3
         DB 3,3,3,3,4,3,4,3,3,3,3,3
         DB 3,3,3,3,4,3,4,3,3,3,3,3
         DB 3,3,3,3,3,3,4,3,3,3,3,3
         DB 3,3,3,3,3,3,4,3,3,3,3,3
         DB 3,3,3,4,4,4,4,3,3,3,3,3

    Maleficient DB 3,3,3,3,3,3,3,3,3,0,3,3,3,3,3,3,3,0,3,3,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,3,3,0,0,3,3,3,3,3,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,3,3,0,0,0,3,3,3,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,3,0,0,0,3,3,3,3,3,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,0,0,0,3,0,3,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,0,0,73,0,0,0,73,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,0,73,73,73,0,73,73,73,0,0,0,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,3,0,73,13,13,73,73,73,13,13,73,0,3,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,0,0,3,3,0,73,44,0,73,73,73,0,44,73,0,3,3,0,0,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,0,0,0,0,73,44,44,73,73,73,44,44,73,0,0,0,0,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,34,34,34,0,0,73,73,73,73,73,0,0,34,34,34,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,0,0,0,34,34,0,0,73,73,73,0,0,34,34,0,0,0,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,34,34,0,0,73,0,0,34,34,0,0,0,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,3,0,0,34,34,0,0,0,34,34,0,0,0,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,3,0,0,0,0,34,0,34,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,0,8,0,0,34,0,0,8,0,0,0,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,3,3,8,0,0,34,0,0,8,0,0,0,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,73,73,0,8,0,34,0,8,0,73,73,0,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,73,73,0,8,0,34,0,8,0,73,73,0,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,6,0,8,0,34,0,8,0,34,0,0,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,6,0,8,0,34,0,8,0,34,0,0,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,6,0,8,0,34,0,8,0,34,0,0,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,34,6,0,8,0,34,0,8,0,34,0,0,3,3,3,3,3,3,3,3,3,3,3
            DB 3,0,3,3,3,3,0,0,34,6,0,0,0,34,0,0,0,34,0,0,0,3,3,3,3,3,3,3,3,3,3
            DB 0,0,3,3,3,3,0,34,0,6,0,0,0,34,0,0,0,0,34,0,0,3,3,3,3,0,3,3,3,3,3
            DB 0,0,3,0,3,3,0,34,0,6,0,0,0,34,0,0,0,0,34,0,0,3,3,0,3,0,0,3,3,3,3
            DB 0,0,0,0,3,0,0,34,0,6,0,0,34,34,34,0,0,0,0,34,0,0,3,0,0,0,0,3,3,3,3
            DB 3,0,0,0,0,0,0,0,34,6,0,34,34,34,34,34,0,0,0,34,0,0,0,0,0,0,3,3,3,3,3
            DB 3,3,0,0,0,0,0,0,34,6,34,34,34,34,34,34,34,0,0,34,0,0,0,0,0,3,3,3,3,3,3

    BentMal DB 3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,8,8,8,0,0,0,0,0,0,0,0,3,3,3,3,0,0,0,0,3,3,3
            DB 3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,8,8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3
            DB 3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,73,73,73,73,73,0,0,0,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,0,0,0,0,34,34,34,34,34,34,34,34,34,34,34,34,34,34,73,73,73,73,73,0,0,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,0,8,0,0,34,0,0,0,0,0,0,0,0,0,0,0,0,0,73,73,73,73,73,0,0,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,0,8,0,0,34,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,0,8,0,0,34,0,0,8,0,0,0,0,0,34,34,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3
            DB 3,3,3,3,3,3,3,0,0,0,0,8,0,34,0,8,8,0,0,34,34,0,0,0,0,0,0,0,3,3,3,3,0,0,0,0,3,3,3
            DB 3,3,3,3,3,3,3,0,0,0,0,8,0,34,0,8,0,0,34,0,0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,6,0,8,0,34,0,8,0,34,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,0,6,0,8,0,34,0,8,0,34,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,3,3,3,3,3,0,34,6,0,8,0,34,0,8,0,34,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
            DB 3,0,3,3,3,3,0,0,34,6,0,0,0,34,0,0,0,34,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3
            DB 0,0,3,3,3,3,0,34,0,6,0,0,0,34,0,0,0,0,34,0,0,3,3,3,3,0,3,3,3,3,3,3,3,3,3,3,3,3,3
            DB 0,0,3,0,3,3,0,34,0,6,0,0,0,34,0,0,0,0,34,0,0,3,3,0,3,0,0,3,3,3,3,3,3,3,3,3,3,3,3
            DB 0,0,0,0,3,0,0,34,0,6,0,0,34,34,34,0,0,0,0,34,0,0,3,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3
            DB 3,0,0,0,0,0,0,0,34,6,0,34,34,34,34,34,0,0,0,34,0,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3
            DB 3,3,0,0,0,0,0,0,34,6,34,34,34,34,34,34,34,0,0,34,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3
            
    MaleficientX dw 20
    MaleficientY dw 151
    PrevMaleficientX dw ?
    PrevMaleficientY dw ? 
    fire db 3,41,3,41,41,3,3,3
         db 3,3,41,3,41,41,41,3
    	 db 41,3,3,3,41,42,41,41
	     db 3,3,41,41,41,42,42,41
    	 db 3,41,41,42,42,15,42,41               ;colour of pixels of fire 
    	 db 3,41,42,42,15,42,41,41
	     db 3,41,41,42,42,41,41,3
	     db 3,3,41,41,41,41,3,3
    Dil DB 3,3,3,4,3,3,3,3,3,4,3,3,3
        DB 3,3,4,4,4,3,3,3,4,15,4,3,3
        DB 3,4,4,4,4,4,3,4,15,4,15,4,3
        DB 3,4,4,4,4,4,4,4,4,4,15,4,3
        DB 3,3,4,4,4,4,4,4,4,15,4,3,3
        DB 3,3,3,4,4,4,4,4,15,4,3,3,3
        DB 3,3,3,3,4,4,4,15,4,3,3,3,3
        DB 3,3,3,3,3,4,15,4,3,3,3,3,3
        DB 3,3,3,3,3,3,4,3,3,3,3,3,3

    cloudArr DB 3,3,3,3,3,3,3,3,3,3,3,3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,3,3,3,3,3,3,3,3,3,3,3,3
         DB 3,3,3,3,3,3,3,3,3,3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,3,3,3,3,3,3,3,3,3,3
         DB 3,3,3,3,3,3,3,3,3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,3,3,3,3,3,3,3,3,3
         DB 3,3,3,3,3,3,3,3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,3,3,3,3,3,3,3,3
         DB 3,3,3,3,3,3,3,3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,3,3,3,3,3,3,3,3
         DB 3,3,3,3,3,3,3,3,3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,3,3,3,3,3,3,3,3,3
         DB 3,3,3,3,3,3,3,3,3,3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,8,8,8,3,3,3,3,3,3,3,3,3,3
         DB 3,3,3,3,3,3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,3,3,3,3,3,3
         DB 3,3,3,3,3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,3,3,3,3,3
         DB 3,3,3,3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,3,3,3,3
         DB 3,3,3,3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,3,3,3,3
         DB 3,3,3,3,3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,3,3,3,3,3
         DB 3,3,3,3,3,3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,8,8,8,3,3,3,3,3,3
         DB 3,3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,3,3
         DB 3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,3
         DB 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8
         DB 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8
         DB 3,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,8,8,3
         DB 3,3,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,3,3
    
    Cactus DB 3,3,3,3,3,3,3,2,2,121,3,3,3,3,3,3,3
           DB 3,3,3,3,3,3,2,2,2,48,121,3,3,3,3,3,3
           DB 3,3,3,3,3,3,2,2,2,48,121,3,3,3,3,3,3
           DB 3,3,3,3,3,3,2,2,2,2,121,3,3,3,3,3,3
           DB 3,3,3,3,3,3,2,2,2,2,121,3,3,3,2,121,3
           DB 3,3,3,3,3,3,2,2,48,2,121,3,3,2,2,48,121
           DB 3,3,3,3,3,3,2,2,48,2,121,3,3,2,2,48,121
           DB 3,3,3,3,3,3,2,2,2,2,121,3,3,2,2,48,121
           DB 3,3,3,3,3,3,2,2,2,2,2,48,48,2,2,2,121
           DB 3,2,121,3,3,3,48,2,2,2,2,2,2,2,2,2,121
           DB 2,2,48,121,3,3,48,2,2,2,121,121,121,121,121,121,121
           DB 2,2,48,121,3,3,48,2,2,48,121,3,3,3,3,3,3
           DB 2,2,2,121,3,3,2,2,2,48,121,3,3,3,3,3,3
           DB 2,2,2,121,3,3,2,2,2,48,121,3,3,3,3,3,3
           DB 2,48,2,2,48,48,2,2,2,2,121,3,3,3,3,3,3
           DB 2,48,2,2,2,2,2,2,2,2,121,3,3,3,3,3,3
           DB 121,121,121,121,121,121,121,2,2,2,121,3,3,3,3,3,3
           DB 3,3,3,3,3,3,2,48,2,2,121,3,3,3,3,3,3
           DB 3,3,3,3,3,3,2,48,2,2,121,3,3,3,3,3,3
           DB 3,3,3,3,3,3,2,2,2,2,121,3,3,3,3,3,3
           DB 3,3,3,3,3,3,2,2,2,48,121,3,3,3,3,3,3
           DB 3,3,3,3,3,3,2,2,2,48,121,3,3,3,3,3,3
    Balloon DB 3,3,36,36,36,36,3,3
            DB 3,36,36,36,36,15,36,3
            DB 3,36,36,36,36,15,36,3
            DB 36,36,36,36,36,36,15,36
            DB 36,36,36,36,36,36,15,36
            DB 36,36,36,36,36,36,15,36
            DB 3,36,36,36,36,15,36,3
            DB 3,3,36,36,15,36,3,3
            DB 3,3,3,36,36,3,3,3
            DB 3,3,3,0,3,3,3,3
            DB 3,3,3,3,0,3,3,3
            DB 3,3,3,3,0,3,3,3
            DB 3,3,3,3,0,3,3,3
            DB 3,3,3,0,3,3,3,3
            DB 3,3,0,3,3,3,3,3
            DB 3,3,0,3,3,3,3,3
            DB 3,3,3,0,3,3,3,3
            DB 3,3,3,0,3,3,3,3
    BalloonX dw 285
    BalloonY dw 145
    CactusX dw ?
    CactusY dw ?
    CactusX1 dw 320
    CactusY1 dw 158
    CactusX2 dw 320
    CactusY2 dw 158     
    CloudX dw ?
    CloudY dw ?
    CloudX1 dw 20
    CloudY1 dw 50
    CloudX2 dw 130
    CloudY2 dw 20
    CloudX3 dw 230
    CloudY3 dw 70
    DilX dw 90
    DilY dw 8
    FireX dw 130
    FireY dw 150
    FlamingoX dw 280
    FlamingoY dw 164
    blockx dw 0                             ;will be stored in cx for x coordinate of single building block for creations
    blocky dw 0                             ;will be stored in dx for y coordinate of single building block
    blockwidth dw 0                         ;will be stored in si for block width
    blocklength dw 0                        ;will be stored in cx for loop count
    ObsX dw 0                               ;obstacle x coordinate ( cactus )
    colour DB ?                             ;colour of anything we are making
    Score DB     "Score:0",'$'
    ;HighScore DB "Highscore: 0000", '$'
    lives DB "Lives Left:", '$'
    playerlivesleft DW 3                    ;variable to store number of lives of each player and keep check on it. Game will end when it is zero
    numscore dw 0000
    scoretoprint db ?
    level dw 1
    endgamemessage DB "--- GAME OVER ---",'$'
    shootFire dw 0                          ;variable to check if fire has been shot yet or not
    shootfirecheck db 0                     ;variable to store random number generated for fire 
    checkBentMal db 0                       ;kind of like a bool variable to check if bent or not
    checkendjump db 0
    checkjumping db 0
    checkextralives db 0                    ;check for extra lives + timer for them
    ExtraLifeX dw 0
    ExtraLifeY dw 140
    ballooncheck db 0                       ;bool to make balloon obstacle random
    cactus1check db 0
    cactus2check db 0
    UserName db 20 DUP('$')
    namesize dw 0
    instruction db "ENTER YOUR USERNAME BELOW:",'$'
.code
jmp main

;User Name Input PROC---------------------------------------------------------------------------------------------------------------
Input PROC uses ax bx cx dx 
    mov ah,02h
    mov dl, 6                       ;x-coordinate
    mov dh, 7                       ;y-coordinate
    int 10h
    mov cx, 26
    mov si,offset instruction
    mov bl, 15h
    displayinstruction:
	    push cx
	    mov al,[si]
        mov bh,0
	    mov cx,1
    	mov ah,0ah
	    int 10h
    	inc si
	    mov ah,02h
    	inc dl
	    int 10h
	    pop cx
    loop displayinstruction

    mov si, OFFSET UserName
    mov ah, 02h
    mov dh, 10
    mov dl, 10
    int 10h 
    mov ax, 0
    mov bl,32
    .WHILE ah != 1ch 
        mov cx,1
		mov bh,0
        mov ah, 0ah 
        int 10h  
        mov [si], al
        inc si
        inc namesize
        inc bl

        mov ah, 02h 
        inc dl 
        int 10h 

        mov ah, 0 
        int 16h
    .endw

    ret

Input ENDP

;time & utility functions------------------------------------------------------------------------------------------------------------
timefunclevel1 PROC uses ax bx cx dx
	MOV CX, 01h                         ;if you decrease it speeds up, if you increase it slows down
	MOV DX, 01FFFH
	MOV AH, 86H                         ;BIOS Wait/Delay function
	INT 15H
    ret 
timefunclevel1 ENDP
timefunclevel2 PROC uses ax bx cx dx
	MOV CX, 00H                         ;if you decrease it speeds up, if you increase it slows down
	MOV DX, 02FFFH
	MOV AH, 86H                         ;BIOS Wait/Delay function
	INT 15H
    ret 
timefunclevel2 ENDP
timefunclevel3 PROC uses ax bx cx dx
	MOV CX, 00H                         ;if you decrease it speeds up, if you increase it slows down
	MOV DX, 00000H
	MOV AH, 86H                         ;BIOS Wait/Delay function
	INT 15H
    ret 
timefunclevel3 ENDP
RePlaceAllCharacters MACRO 
    mov MaleficientX, 20
    mov MaleficientY, 151
    mov CactusX1, 320
    mov CactusY1, 158
    mov FlamingoX, 230
    mov FlamingoY, 164
    mov SpaceshipX, 280 
    mov SpaceshipY, 90
    mov shootFire, 0
    mov checkextralives, 0
    mov BalloonX, 280
    Background
ENDM
RandomNumberGen MACRO
    MOV AH, 00h                 ; interrupts to get system time        
    INT 1AH                     ; CX:DX now hold number of clock ticks since midnight
    mov  ax, dx
    xor  dx, dx
    mov  cx, 10    
    div  cx                     ; here dx contains the remainder of the division - from 0 to 9

    ;add dl, '0'
    mov shootfirecheck, dl
ENDM
ExtraLivesGeneration PROC uses ax bx cx dx 
    RandomNumberGen
    .IF checkextralives == 0
        .IF dl == 4 || dl == 8
            mov checkextralives, 1
        .ENDIF
    .ENDIF

    .IF checkextralives == 1
        .IF dl == 4
            mov ExtraLifeX, 90
        .ENDIF
        .IF dl == 8
            mov ExtraLifeX, 190
        .ENDIF
    .ENDIF
    .IF checkextralives > 0
        call GiveExtraLife
        inc checkextralives
        .IF checkextralives == 50
            mov checkextralives, 0
            call HideExtraLife
        .ENDIF
    .ENDIF
    ret
ExtraLivesGeneration ENDP
ResetAllObstaclesforLevel4 MACRO
    mov MaleficientX, 20
    mov MaleficientY, 151
    mov CactusX1, 320
    mov CactusY1, 158
    mov CactusX2, 320 
    mov CactusY2, 158
    mov FlamingoX, 230
    mov FlamingoY, 164
    mov SpaceshipX, 280 
    mov SpaceshipY, 90
    mov shootFire, 0
    mov BalloonX, 280
    Background
ENDM


;Background draw functions------------------------------------------------------------------------------------------------------------
block PROC uses ax bx cx dx
    mov ah, 0ch
    mov al, colour
    mov cx, blocklength       ;starting along x axis
    mov dx, blocky            ;starting along y axis 
    int 10h

    l1:
        push cx
        mov cx, blockx
        mov si, blockwidth
        l2:
            inc cx
            int 10h 
            dec si 
            cmp si, 0
            JGE l2 
        mov cx, blockx
        inc dx 
        int 10h 
        pop cx 
    loop l1
    ret
block ENDP
DisplayInfo PROC uses ax bx cx dx 
    
    mov ah,02h
    mov dl, 0                       ;x-coordinate
    mov dh, 0                       ;y-coordinate
    int 10h
    mov cx, namesize
    mov si,offset UserName
    mov bl, 3
    displayusername:
	    push cx
	    mov al,[si]
        mov bh,0
	    mov cx,1
    	mov ah,0ah
	    int 10h
    	inc si
	    mov ah,02h
    	inc dl
	    int 10h
	    pop cx
        inc bl
        .if bl > 13
            mov bl, 3
        .endif
    loop displayusername

    mov ah,02h
    mov dl, 0                       ;x-coordinate
    mov dh, 1                       ;y-coordinate
    int 10h
    mov cx, 11
    mov si,offset lives
    mov bl, 15
    displaylives:
	    push cx
	    mov al,[si]
        mov bh,0
	    mov cx,1
    	mov ah,0ah
	    int 10h
    	inc si
	    mov ah,02h
    	inc dl
	    int 10h
	    pop cx
    loop displaylives

    mov ah,02h
    mov dl, 29                      ;x-coord
    mov dh,0                        ;y-coord
    int 10h
    mov cx, 7
    mov si,offset Score
    mov bl, 15
    displayScore:
	    push cx
	    mov al,[si]
        mov bh,0
	    mov cx,1
    	mov ah,0ah
	    int 10h
    	inc si
	    mov ah,02h
    	inc dl
	    int 10h
	    pop cx
    loop displayScore
    mov ah,02H
    int 10h
    mov ax, numscore
    call display

    mov cx, playerlivesleft
    heartloop:
    call CreateDil                                      ;loop for hearts to show number of lives left
    add DilX, 14
    loop heartloop
    mov DilX, 90

    ret
DisplayInfo ENDP 
display proc       ;Beginning of procedure
   MOV BX, 10      ;Initializes divisor
   MOV DX, 0000H   ;Clears DX
   MOV CX, 0000H   ;Clears CX
    
    ;_____________________________	
    ;Splitting process starts here
    ;=============================
    L1:  
        MOV DX, 0000H    ;Clears DX during jump
        div BX           ;Divides AX by BX
        PUSH DX          ;Pushes DX(remainder) to stack
        INC CX           ;Increments counter to track the number of digits
        CMP AX, 0        ;Checks if there is still something in AX to divide
    JNE L1           ;Jumps if AX is not zero
    
    L2:  
        POP DX          ;Pops from stack to DX
        ADD DX, 30H     ;Converts to it's ASCII equivalent
        MOV AH, 02H     
        INT 21H         ;calls DOS to display character
    LOOP L2         ;Loops till CX equals zero

   mov dl, 10
   mov ah, 02H
   int 21h
   RET             ;returns control
display  ENDP
Background MACRO 
    mov blockx, 0
    mov blocky, 0
    mov blockwidth, 320                                 ;create the sky
    mov blocklength, 180
    mov colour, 3
    call block

    call createGround
ENDM
createGround PROC uses ax bx cx dx
    mov blockx, 0
    mov blocky, 180
    mov blockwidth, 320                                 ;create the ground
    mov blocklength, 20
    mov colour, 14
    call block

    mov blocklength, 2
    mov colour, 6
    call block

;sand grains
    mov blocklength, 1
    mov blockwidth, 2
    mov blockx, 5
    mov blocky, 195
    call block
    mov blockx, 25
    mov blocky, 184
    call block
    mov blockx, 48
    mov blocky, 196
    call block
    mov blockx, 70
    mov blocky, 188
    call block
    mov blockx, 100
    mov blocky, 184
    call block
    mov blockx, 120
    mov blocky, 194
    call block
    mov blockx, 140
    mov blocky, 183
    call block
    call block
    mov blockx, 160
    mov blocky, 190
    call block
    mov blockx, 190
    mov blocky, 188
    call block
    mov blockx, 220
    mov blocky, 195
    call block
    mov blockx, 240
    mov blocky, 184
    call block
    mov blockx, 270
    mov blocky, 193
    call block
    mov blockx, 300
    mov blocky, 187
    call block
    ret 
createGround ENDP
CreateDil PROC uses ax bx cx dx
    mov cx, DilX
    mov dx, DilY
    mov si, OFFSET Dil

    row:
        mov bx, DilX
        add bx, 13
    	cmp cx,bx
	    JE col
	    mov al,[si]
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp row
    col:
     	inc dx
	    mov bx, DilY
    	add bx, 9
	    cmp bx,dx
	    JE exit
	    mov cx, DilX
	jmp row
    exit:
    ret
CreateDil ENDP 
Cloud  PROC uses ax bx cx dx
    mov CloudX, cx
    mov CloudY, dx
    mov si, OFFSET cloudArr

    cloudrows:
        mov bx, CloudX
        add bx, 43
    	cmp cx,bx
	    JE cloudcolumn
	    mov al,[si]
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp cloudrows
    cloudcolumn:
     	inc dx
	    mov bx, CloudY
    	add bx, 19
	    cmp bx,dx
	    JE exit
	    mov cx, CloudX
	jmp cloudrows
    exit: 
    ret 
Cloud ENDP
BlueCloud  PROC uses ax bx cx dx
    mov CloudX, cx
    mov CloudY, dx
    mov al,3

    cloudrows:
        mov bx, CloudX
        add bx, 43
    	cmp cx,bx
	    JE cloudcolumn
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp cloudrows
    cloudcolumn:
     	inc dx
	    mov bx, CloudY
    	add bx, 19
	    cmp bx,dx
	    JE exit
	    mov cx, CloudX
	jmp cloudrows
    exit: 
    ret 
BlueCloud ENDP

;obstacles---------------------------------------------------------------------------------------------------------------------------
CreateCactus PROC uses ax bx cx dx
    mov CactusX, cx
    mov CactusY, dx
    mov si, OFFSET Cactus

    row:
        mov bx, CactusX
        add bx,17
    	cmp cx,bx
	    JE col
	    mov al,[si]
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp row
    col:
     	inc dx
	    mov bx, CactusY
    	add bx,22
	    cmp bx,dx
	    JE exit
	    mov cx, CactusX
	jmp row
    exit:
    ret
CreateCactus ENDP
CreateBlueCactus PROC uses ax bx cx dx
    mov CactusX, cx
    mov CactusY, dx
    mov al, 3

    row:
        mov bx, CactusX
        add bx,17
    	cmp cx,bx
	    JE col
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp row
    col:
     	inc dx
	    mov bx, CactusY
    	add bx,22
	    cmp bx,dx
	    JE exit
	    mov cx, CactusX
	jmp row
    exit:
    ret
CreateBlueCactus ENDP
drawFlamingo PROC uses ax bx cx dx
    mov FlamingoX, cx 
    mov dx, FlamingoY
    mov si, OFFSET Flamingo

    row:
        mov bx, FlamingoX
        add bx,12
    	cmp cx,bx
	    JE col
	    mov al,[si]
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp row
    col:
     	inc dx
	    mov bx,FlamingoY
    	add bx,16
	    cmp bx,dx
	    JE exit
	    mov cx,FlamingoX
	jmp row
    exit:
    ret
drawFlamingo ENDP
drawBlueFlamingo PROC uses ax bx cx dx 
    mov FlamingoX, cx 
    mov dx, FlamingoY
    mov al, 3

    row:
        mov bx, FlamingoX
        add bx,12
    	cmp cx,bx
	    JE col
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp row
    col:
     	inc dx
	    mov bx,FlamingoY
    	add bx,16
	    cmp bx,dx
	    JE exit
	    mov cx,FlamingoX
	jmp row
    exit:
    ret
drawBlueFlamingo ENDP
drawSpaceship PROC uses ax bx cx dx
    mov cx, SpaceshipX
    mov dx, SpaceshipY
    mov si, OFFSET Spaceship

    row:
        mov bx, SpaceshipX
        add bx,31
    	cmp cx,bx
	    JE col
	    mov al,[si]
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp row
    col:
     	inc dx
	    mov bx, SpaceshipY
    	add bx, 24
	    cmp bx,dx
	    JE exit
	    mov cx, SpaceshipX
	jmp row
    exit:
    ret
drawSpaceship ENDP
drawBlueSpaceship PROC uses ax bx cx dx
    mov cx, SpaceshipX
    mov dx, SpaceshipY
    mov al, 3

    row:
        mov bx, SpaceshipX
        add bx,31
    	cmp cx,bx
	    JE col
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp row
    col:
     	inc dx
	    mov bx, SpaceshipY
    	add bx, 24
	    cmp bx,dx
	    JE exit
	    mov cx, SpaceshipX
	jmp row
    exit:
    ret
drawBlueSpaceship ENDP
drawFire PROC uses ax bx cx dx
    mov cx, FireX
    mov dx, FireY
    mov si, OFFSET Fire

    row:
        mov bx, FireX
        add bx, 8
    	cmp cx,bx
	    JE col
	    mov al,[si]
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp row
    col:
     	inc dx
	    mov bx, FireY
    	add bx, 8
	    cmp bx,dx
	    JE exit
	    mov cx, FireX
	jmp row
    exit:
    ret
drawFire ENDP
drawBlueFire PROC uses ax bx cx dx 
    mov cx, FireX
    mov dx, FireY
    mov al, 3

    row:
        mov bx, FireX
        add bx, 8
    	cmp cx,bx
	    JE col
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp row
    col:
     	inc dx
	    mov bx, FireY
    	add bx, 8
	    cmp bx,dx
	    JE exit
	    mov cx, FireX
	jmp row
    exit:
    ret
drawBlueFire ENDP
DrawBalloon PROC uses ax bx cx dx
    mov cx, BalloonX
    mov dx, BalloonY
    mov si, OFFSET Balloon

    row:
        mov bx, BalloonX
        add bx, 8
    	cmp cx,bx
	    JE col
	    mov al,[si]
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp row
    col:
     	inc dx
	    mov bx, BalloonY
    	add bx, 18
	    cmp bx,dx
	    JE exit
	    mov cx, BalloonX
	jmp row
    exit:
    ret
DrawBalloon ENDP
DrawBlueBalloon PROC uses ax bx cx dx
    mov cx, BalloonX
    mov dx, BalloonY
    mov al, 3

    row:
        mov bx, BalloonX
        add bx, 8
    	cmp cx,bx
	    JE col
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp row
    col:
     	inc dx
	    mov bx, BalloonY
    	add bx, 8
	    cmp bx,dx
	    JE exit
	    mov cx, BalloonX
	jmp row
    exit:
    ret
DrawBlueBalloon ENDP
GiveExtraLife PROC uses ax bx cx dx
    mov cx, ExtraLifeX
    mov dx, ExtraLifeY
    mov si, OFFSET Dil

    row:
        mov bx, ExtraLifeX
        add bx, 13
    	cmp cx,bx
	    JE col
	    mov al,[si]
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp row
    col:
     	inc dx
	    mov bx, ExtraLifeY
    	add bx, 9
	    cmp bx,dx
	    JE exit
	    mov cx, ExtraLifeX
	jmp row
    exit:
    ret
GiveExtraLife ENDP
HideExtraLife PROC uses ax bx cx dx
    mov cx, ExtraLifeX
    mov dx, ExtraLifeY
    mov al, 3

    row:
        mov bx, ExtraLifeX
        add bx, 13
    	cmp cx,bx
	    JE col
	    mov ah,0ch
	    int 10h
	    inc si
	    inc cx
    jmp row
    col:
     	inc dx
	    mov bx, ExtraLifeY
    	add bx, 9
	    cmp bx,dx
	    JE exit
	    mov cx, ExtraLifeX
	jmp row
    exit:
    ret
HideExtraLife ENDP 

;player's character------------------------------------------------------------------------------------------------------------------
drawMaleficient proc uses ax bx cx dx
    mov cx, MaleficientX
    mov dx, MaleficientY
    mov si,offset Maleficient

    row:
	    mov bx, MaleficientX
	    add bx, 31
	    cmp cx,bx
	    JE col
    	mov al,[si]
	    mov ah,0ch
    	int 10h
	    inc si
    	inc cx
    jmp row	

    col:
	    inc dx
    	mov bx, MaleficientY
	    add bx, 29
    	cmp bx,dx
	    JE exit
    	mov cx, MaleficientX
	    jmp row
    exit:

    ret
drawMaleficient endp
drawBlueMaleficient proc uses ax bx cx dx
    mov cx, PrevMaleficientX
    mov dx, PrevMaleficientY
    mov al, 3
    row:
	    mov bx, PrevMaleficientX
	    add bx, 31
	    cmp cx,bx
	    JE col
	    mov ah,0ch
    	int 10h
	    inc si
    	inc cx
    jmp row	

    col:
	    inc dx
    	mov bx, PrevMaleficientY
	    add bx, 29
    	cmp bx,dx
	    JE exit
    	mov cx, PrevMaleficientX
	    jmp row
    exit:

    ret
drawBlueMaleficient endp
drawBentMal proc uses ax bx cx dx 
    mov cx, MaleficientX
    mov dx, MaleficientY
    add dx, 9
    mov si,offset BentMal

    row:
	    mov bx, MaleficientX
	    add bx, 39
	    cmp cx,bx
	    JE col
    	mov al,[si]
	    mov ah,0ch
    	int 10h
	    inc si
    	inc cx
    jmp row	

    col:
	    inc dx
    	mov bx, MaleficientY
	    add bx, 29
    	cmp bx,dx
	    JE exit
    	mov cx, MaleficientX
	    jmp row
    exit:
    ret
drawBentMal endp
drawBlueBentMal proc uses ax bx cx dx
    mov cx, MaleficientX
    mov dx, MaleficientY
    add dx, 9
    mov al, 3
    row:
	    mov bx, MaleficientX
	    add bx, 40
	    cmp cx,bx
	    JE col
	    mov ah,0ch
    	int 10h
	    inc si
    	inc cx
    jmp row	

    col:
	    inc dx
    	mov bx, MaleficientY
	    add bx, 20
    	cmp bx,dx
	    JE exit
    	mov cx, MaleficientX
	    jmp row
    exit:

    ret
drawBlueBentMal endp

;movement functions------------------------------------------------------------------------------------------------------------------
MoveClouds MACRO 
    mov cx, CloudX1                                        ;store x coord in cx and y in dx    
    mov dx, CloudY1                                        ;cloud 1
    call Cloud 
    add cx, 43                                             ;draw blue clouds to cover tracks
    call BlueCloud
    mov cx, CloudX2                                                 
    mov dx, CloudY2                                        ;cloud 2
    call Cloud 
    add cx, 43
    call BlueCloud
    mov cx, CloudX3                                                  
    mov dx, CloudY3                                        ;cloud 3
    call Cloud 
    add cx, 43
    call BlueCloud

    sub CloudX1, 1                                          ;decrement to move clouds backwards
    sub CloudX2, 1
    sub CloudX3, 1
    .IF(CloudX1 <= 0)
        mov cx, CloudX1
        mov dx, CloudY1
        call BlueCloud
        mov CloudX1, 320                                    ;for
    .ENDIF
    .IF(CloudX2 <= 0)
        mov cx, CloudX2
        mov dx, CloudY2
        call BlueCloud                                       ;boundary
        mov CloudX2, 320
    .ENDIF
    .IF(CloudX3 <= 0)
        mov cx, CloudX3
        mov dx, CloudY3
        call BlueCloud                                       ;checks
        mov CloudX3, 320
    .ENDIF
ENDM
MoveSpaceShip MACRO
    call drawSpaceship                                  ;draw spaceship
    add SpaceshipX , 31                                 ;draw another spaceship right behind to cover its tracks(camouflage with background)
    call drawBlueSpaceship
    sub SpaceshipX, 36                                  ;deccrement x -axis coord to move ship backwards
    RandomNumberGen                                     ;random number so fire is shot randomly 

    .IF shootFire != 1                                  ;check for whether fire has been shot or not
        .IF shootfirecheck == 9 || shootfirecheck == 2  ;fire will be shot if random number gives either 2 or 9 
        mov shootFire, 1
        push ax
        mov ax, SpaceshipX
        add ax, 10
        mov FireX, ax
        mov ax, SpaceshipY
        add ax, 20
        mov FireY, ax 
        pop ax
        .ENDIF
    .ENDIF

    .IF(SpaceshipX <= 0)
        mov SpaceshipX, 320                             ;boundary check
    .ENDIF

ENDM
MoveCactus MACRO 
    RandomNumberGen                         ;to get a random number so obstacles come randomly 

    .IF cactus1check == 0
        .IF dl == 0
            mov cactus1check, 1             ;obstacle will only make a round when random number is 0
        .ENDIF
    .ENDIF

    .IF cactus1check == 1                   ;check so that cactus traverses full screen and then disappears until called again
        mov cx, CactusX1 
        mov dx, CactusY1
        call CreateCactus
        add cx, 17
        call CreateBlueCactus
        sub CactusX1, 3
        .IF(CactusX1 <= 3 )                 ;boundary check
            mov CactusX1, 320
            mov cactus1check, 0  
        .ENDIF
    .ENDIF

    .IF level > 3                           ;two cactuses at level 4 for increasing difficulty
    .IF cactus2check == 0
        .IF dl == 7 || dl == 0
            mov cactus2check, 1             ;random number check 
        .ENDIF
    .ENDIF
    .IF cactus2check == 1
        mov cx, CactusX2 
        mov dx, CactusY2
        call CreateCactus
        add cx, 17
        call CreateBlueCactus
        sub CactusX2, 3
        .IF(CactusX2 <= 3 )                ;boundary check
            mov CactusX2, 320
            mov cactus2check, 0
        .ENDIF
    .ENDIF
    .ENDIF 

ENDM
MoveFlamingos MACRO 
    mov cx, FlamingoX
    push cx
    call drawFlamingo
    add cx, 10
    call drawFlamingo
    add cx, 10
    call drawBlueFlamingo
    add cx, 10
    call drawBlueFlamingo
    pop cx 
    mov FlamingoX, cx 

    sub FlamingoX, 3
    .IF(FlamingoX <= 3)                     ;boundary check
        mov FlamingoX, 320
    .ENDIF
ENDM
EndJumpMal MACRO 
    .if MaleficientY < 100                      ;once jump has reached its height it will start coming down 
        mov checkendjump, 1
    .endif 
    .if(checkendjump == 1)                      ;check to see height has been reached and downward movement needs to start
        push ax
        mov ax, MaleficientX
        mov PrevMaleficientX, ax
        mov ax, MaleficientY
        mov PrevMaleficientY, ax 
        add MaleficientY, 3
        .if MaleficientY >= 151                 ;once ground has been reached stop movement
        mov MaleficientY, 151
        mov checkendjump, 0
        .endif 
        call drawBlueMaleficient                ;separate blue maleficient needs to be drawn to cover tracks
        pop ax
    .endif 
ENDM
isJumpingMal MACRO
    .IF checkjumping == 1                       ;if up arrow key drawn once then keep moving up until max jump height reached
        push ax
        mov ax, MaleficientX
        mov PrevMaleficientX, ax
        mov ax, MaleficientY
        mov PrevMaleficientY, ax 
        sub MaleficientY, 5
        add MaleficientX, 1
        call drawBlueMaleficient
        pop ax 
    .ENDIF
    .IF(MaleficientY <= 100)                   ;once max height reached stop upward movement
        mov checkjumping, 0
    .endif
ENDM
moveMaleficient proc uses ax bx cx dx 
    mov ax, 0
	mov ah,1                                                ;so program doesnt wait for key stroke 
	int 16h
	jz dontcheck 

    mov ah,0                                                ;get keystroke
	int 16h

    mov bx, MaleficientX                                    ; to store current position so tracks can be covered later 
    mov PrevMaleficientX, bx
    mov bx, MaleficientY
    mov PrevMaleficientY, bx

    ;AH = BIOS scan code
    .IF ah == 4Dh                                           ;to move towards the right
        .IF MaleficientX <= 280
            add MaleficientX, 5
            mov checkBentMal, 0
            call drawBlueMaleficient
            call drawMaleficient
        .ENDIF
    .ENDIF
    .IF ah == 4Bh                                           ;to move towards the left
        .IF MaleficientX >= 10
            sub MaleficientX , 5
            mov checkBentMal, 0
            call drawBlueMaleficient
            call drawMaleficient
        .ENDIF
    .ENDIF
    .IF ah == 48h                                           ;to move upwards
        .IF MaleficientY > 100
            mov checkjumping, 1
            mov checkBentMal, 0
        .ENDIF
    .ENDIF 
    .IF ah == 50h                                           ;to bend/duck
            mov checkBentMal, 1
            call drawBlueBentMal
            call drawBlueMaleficient
            call drawBentMal
    .ENDIF
    EndJumpMal
    ret 

    dontcheck:   
        mov checkBentMal, 0
        isJumpingMal
        EndJumpMal
        call drawBlueBentMal
        call drawMaleficient
    ret
moveMaleficient endp
MoveFire MACRO
    call drawBlueFire
    sub FireX, 3
    add FireY, 3
    call drawFire

    .if(FireY >= 170)
        call drawBlueFire
        mov shootFire, 0
    .endif
endm
MoveBalloon MACRO
    .IF ballooncheck == 0
        RandomNumberGen 
        .IF dl == 2 || dl == 3
            mov ballooncheck, 1
        .ENDIF
    .ENDIF

    .IF(ballooncheck != 0)
        call DrawBalloon
        add BalloonX, 8
        call DrawBlueBalloon
        sub BalloonX, 10
        .IF BalloonX <= 3
            mov BalloonX, 320
            mov ballooncheck , 0
        .ENDIF
    .ENDIF

ENDM
FireShot MACRO
    .IF(shootFire == 1)
        MoveFire
    .ENDIF
 endm
ShowObstacles MACRO 
    MoveFlamingos
    MoveCactus
    .if level > 1
        MoveBalloon
    .endif
    .if level > 2
        MoveSpaceShip
        FireShot
    .endif
    .if level > 0 
        call ExtraLivesGeneration
    .endif
ENDM 

;Level + Speed Computation // ScreenDisplay----------------------------------------------------------------------------------------------------------
AdjustLevelandSpeed MACRO 
    .IF numscore > 100 && numscore < 200
        mov level, 2
    .ELSEIF numscore >= 200 && numscore < 300
        mov level, 3
    .ELSEIF numscore >= 300
        mov level, 4
    .ENDIF

    .IF(level==1)                                      ;levels (speed up)
    call timefunclevel1                                ;need to call time function to slow loop down and be able to see movements(time function doesnt work unless called)
    .ELSEIF(level==2)
    call timefunclevel2
    .ELSEIF (level==3)
    call timefunclevel3
    .ELSEIF (level==4)
    call timefunclevel3 
    .ENDIF

    .IF (numscore == 300)
    ResetAllObstaclesforLevel4
    .ENDIF

ENDM
ScreenDisplay MACRO 
    call DisplayInfo                                    ;information(i.e highscore, score and lives left)
    inc numscore                                        ;increment in the score as long as game keeps running 
    MoveClouds                                          ;seperate function to continously move clouds in the background
    ShowObstacles                                       ;function that shows obstacles + moves them
    call moveMaleficient                                ;Maleficient move + draw function

ENDM

;GAMEOVER FUNCTIONS---------------------------------------------------------------------------------------------------------------
endgamedisplay PROC 
    
    mov blockx, 85
    mov blocky, 8                    ;a blue coloured box that will cover up the hearts
    mov blocklength, 10              ;to show that no more lives are left at the end
    mov blockwidth, 20
    mov colour, 3
    call block


    mov ah,02h
    mov dl, 10                       ;x-coordinate
    mov dh, 10                       ;y-coordinate
    int 10h
    mov cx, 17
    mov si,offset endgamemessage     ;display game over message
    mov bl, 1
    displaygameover:
	    push cx
	    mov al,[si]
        mov bh,0
	    mov cx,1
    	mov ah,0ah
	    int 10h
    	inc si
	    mov ah,02h
    	inc dl
	    int 10h
	    pop cx
        inc bl
        .IF bl > 13
            mov bl, 2
        .ENDIF
    loop displaygameover
    ret
endgamedisplay ENDP


;MAIN GAME LOOP====================================================================================================================
GameMainLoop PROC uses ax bx cx dx 
    
    game:                                               ;infinite loop to run as long as player doesnt loose

    AdjustLevelandSpeed
    ScreenDisplay
    
    ;collision detection
    mov ax, MaleficientX
    mov cx, CactusX1
    sub cx, 25
    mov bx, CactusX1
    add bx, 10
    .IF(ax >= cx && ax <= bx)                           ;collision detection with cactus1
        .IF( MaleficientY >= 128 )
            dec playerlivesleft                         ;jump out of loop and exit game upon collision
            .IF playerlivesleft != 0 
                .if level <4
                RePlaceAllCharacters
                .else
                ResetAllObstaclesforLevel4
                .endif
            .ENDIF
        .ENDIF
    .ENDIF

    .if level == 4
    mov cx, CactusX2                                    
    sub cx, 25
    mov bx, CactusX2
    add bx, 10
    .IF(ax >= cx && ax <= bx)                           ;collision detection with cactus2
        .IF( MaleficientY >= 128 )
            dec playerlivesleft                         ;jump out of loop and exit game upon collision
            .IF playerlivesleft != 0 
            ResetAllObstaclesforLevel4
            .ENDIF
        .ENDIF
    .ENDIF
    .endif
    
    mov cx, FlamingoX                                   
    sub cx, 25
    mov bx, FlamingoX
    add bx, 20
    .IF(ax >= cx && ax <= bx)                            ;collision detection with the cute little Flamingos
        .IF( MaleficientY >= 133 )
            dec playerlivesleft                          ;jump out of loop and exit game upon collision
            .IF playerlivesleft != 0 
                .if level <4
                RePlaceAllCharacters
                .else
                ResetAllObstaclesforLevel4
                .endif
            .ENDIF
        .ENDIF
    .ENDIF
    
    .if level > 2
    mov cx, FireX                                   
    sub cx, 25
    mov bx, FireX
    .IF(ax >= cx && ax <= bx)                            ;collision detection with the fire shot from spaceship
        mov cx, FireY
        sub cx, 20
        mov bx, FireY
        add bx, 20
        .IF( MaleficientY >= cx && MaleficientY <= bx )
            dec playerlivesleft                            ;jump out of loop and exit game upon collision
            .IF playerlivesleft != 0 
                .if level <4
                RePlaceAllCharacters
                .else
                ResetAllObstaclesforLevel4
                .endif
            .ENDIF
        .ENDIF
    .ENDIF
    .endif
    
    .if(level > 1)
    mov ax, MaleficientX
    mov cx, BalloonX                                  
    sub cx, 20
    mov bx, BalloonX
    add bx, 10
    mov dx, MaleficientY
    .IF(checkBentMal == 1)
    add dx, 10
    .ENDIF
    .IF (ax >= cx && ax <= bx)                          ;collision detection with Balloon
        .IF(dx >= 130 && dx <= 160)
        dec playerlivesleft                             
        .IF playerlivesleft != 0 
            .if level <4
            RePlaceAllCharacters
            .else
            ResetAllObstaclesforLevel4
            .endif
        .ENDIF
        .ENDIF
    .ENDIF
    .endif

    .IF checkextralives != 0                            ;collision with extra lives 
        mov ax, MaleficientX
        mov cx, ExtraLifeX                              
        sub cx, 20
        mov bx, ExtraLifeY
        add bx, 20
        .IF (ax >= cx && ax <=bx)
            .IF ( dx >= 130 && dx <= 160)
                mov checkextralives, 0 
                call HideExtraLife
                inc playerlivesleft
            .ENDIF
        .ENDIF
    .ENDIF

    .IF playerlivesleft > 0 
        jmp far ptr game                                ;loop couldnt be used due to distance but basically same functionality
    .ENDIF 

    exitgameloop:
        call endgamedisplay
    ret
GameMainLoop endp



;==============================================================================================================================
;                                        PROCS & MACROS ENDS -- REST OF THE CODE BEGINS
;==============================================================================================================================


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<~~~~~~~~~~~~~~~~~~MAIN PROC~~~~~~~~~~~~~~~~~~>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
main proc

    mov ax , @data
    mov ds , ax
    mov ax , 0
    mov ah , 0h
    mov al , 03h
    int 10h
    mov ax , 0
    start:
    mov ax , 03h
    mov bh , 0h
    int 10h
;******************************************************THE PLAY BUTTON******************************************************
    mov ah , 06h
    mov al , 4
    mov bh, 01001111b
    mov ch , 6               ;upper row
    mov cl , 22              ;upper letf col
    mov dh , 9              ;lower row
    mov dl , 52              ;lower right col
    int 10h

    ;printing character
    mov  ah, 02h  ;SetCursorPosition
    mov bh , 0    ;display page 
    mov  dl, 35    ;Column
    mov  dh, 8    ;Row
    int  10h

    mov ah , 09h
    lea dx , play
    int 21h
    mov  bl, 01001111b   ;colour
    mov  bh, 0          ;Display page
    mov cx , 1
    int  10h

;******************************************************THE INSTRUCTION BUTTON******************************************************
    mov ah , 06h
    mov al , 4
    mov bh, 01001111b
    mov ch , 11               ;upper row
    mov cl , 22              ;upper letf col
    mov dh , 14              ;lower row
    mov dl , 52              ;lower right col
    int 10h

       ;printing character
    mov  ah, 02h  ;SetCursorPosition
    mov bh , 0    ;display page 
    mov  dl, 32    ;Column
    mov  dh, 13    ;Row
    int  10h

    mov ah , 09h
    lea dx , rules
    int 21h
    mov  bl, 01001111b   ;colour
    mov  bh, 0          ;Display page
    mov cx , 1
    int  10h

;******************************************************THE END BUTTON******************************************************
    mov ah , 06h
    mov al , 4
    mov bh, 01001111b
    mov ch , 16               ;upper row
    mov cl , 22              ;upper letf col
    mov dh , 19              ;lower row
    mov dl , 52              ;lower right col
    int 10h

    ;printing character
    mov  ah, 02h  ;SetCursorPosition
    mov bh , 0    ;display page 
    mov  dl, 35    ;Column
    mov  dh, 18    ;Row
    int  10h

    mov ah , 09h
    lea dx , finish
    int 21h
    mov  bl, 01001111b   ;colour
    mov  bh, 0          ;Display page
    mov cx , 1
    int  10h

    mov ax , 01h            ;display the mouse pointer on the screen
    int 33h

    mov ax , 0h
    again:
    mov ax , 03h
    int 33h

    mov mouseX , cx
    mov mouseY , dx
;***********************FOR THE PLAY BUTTON*******************************************
   .IF  mouseX >= 177 && mouseY >= 49 && mouseY <=79 && mouseX <= 420
        .IF bx == 1 || bx == 2
        jmp far PTR gamestart
        .ENDIF  
    .ENDIF
;*********************FOR THE INSTRUCTION BUTTON**************************************
    .IF mouseX >= 177 && mouseY >= 89 && mouseY <= 118 && mouseX <= 420
        .IF bx == 1 || bx == 2
        mov ax , 0
        jmp readfile
        .ENDIF
    .ENDIF 
;*********************FOR THE EXIT BUTTON**********************************************
   .IF mouseX >= 177 && mouseY >= 129 && mouseX <= 420  && mouseY <= 159
        .IF bx == 1 || bx == 2
        mov ax , 0
        mov ah , 4ch
        int 21h
        .ENDIF  
    .ENDIF
    jmp again
    
;*****************************READING FROM FILE*********************************
    readfile: 
    mov ax , 03h
    mov bh , 0h
    int 10h 
    mov ax , 0

;****************************PRINTING THE INSTRUCTION BOX**********************
    mov ah , 06h
    mov al , 10
    mov bh, 01110100b
    mov ch , 8               ;upper row
    mov cl , 8               ;upper letf col
    mov dh , 16              ;lower row
    mov dl , 72              ;lower right col
    int 10h

    mov ax , 0
    mov dx, OFFSET file
    mov al, 2
    mov ah, 3dh
    int 21h
    mov HANDLE, ax

    mov bx, HANDLE
    
    mov dx, OFFSET buffer
    mov ah, 3fh
    int 21h

    mov  ah, 02h  ;SetCursorPosition
    mov bh , 0    ;display page 
    mov  dl, 10    ;Column
    mov  dh, 8    ;Row
    int  10h

    mov si, OFFSET [buffer]
    mov cx, 310

    showvalues:
        mov dx, [si]
        mov ah, 02h
        int 21h
        inc si
    loop showvalues

    mov ah,3eh
    int 21h

    mov ax , 0
    mov ah , 01h
    int 21h

    jmp start

;******************************************************GAME INTERFACE*************************************************************
gamestart:
    

    mov ah, 0h
    mov al, 13h                                         ;set video mode
    int 10h

    call Input
    Background                                          ;create background

    call GameMainLoop                                   ;main game loop where everything is happening
    
    mov ah, 4ch
    int 21h
    
    mov ah, 4ch
    int 21h


main endp
end main