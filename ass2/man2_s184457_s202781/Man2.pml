#define P(X) atomic{ X > 0 -> X--} 
#define V(X) atomic{ X++ }
#define DOWNWARD(X) ( X <= 2 )
#define UPWARD(X) ( X >= 3 )
#define INVALID(X) (X == 0)
pid downward1, downward2, upward1, upward2;
byte downwardsMutex, alleyMutex, counterMutex, isFirstMutex, counter, dirMutex;
bool isDirDownward, isFirst;
byte firstDownwardNo, firstUpwardNo;


proctype Car(byte no) {
	do :: 
		/*ENTER*/
		bool isDownward = DOWNWARD(no);
		P(dirMutex);
		bool isOppositeDir = (isDownward != isDirDownward);
		V(dirMutex);
		if :: !isOppositeDir -> 
			P(isFirstMutex);
			if :: isDownward && INVALID(firstDownwardNo) -> 
				firstDownwardNo = no;
				P(alleyMutex)
			   :: !isDownward && INVALID(firstUpwardNo) -> 
				firstUpwardNo == no;
				P(alleyMutex)
 			   :: else -> skip
			fi;
			V(isFirstMutex);
            		   :: isOppositeDir -> 
			P(isFirstMutex);
			if :: isDownward && INVALID(firstDownwardNo) ->
				firstDownwardNo = no;
                   			V(isFirstMutex);
                    			P(downwardsMutex);
                   			P(alleyMutex);
                    			V(downwardsMutex);
                    			P(dirMutex);
                    			isDirDownward = isDownward;
                    			V(dirMutex)
			  :: !isDownward && INVALID(firstUpwardNo) ->
				firstUpwardNo = no;
                   			V(isFirstMutex);
                    			P(downwardsMutex);
                   			P(alleyMutex);
                    			V(downwardsMutex);
                    			P(dirMutex);
                    			isDirDownward = isDownward;
                    			V(dirMutex)
			   :: else -> 
				V(isFirstMutex);
				P(downwardsMutex);
				V(downwardsMutex)

                   		fi;
			P(counterMutex);
			counter = counter + 1;
			V(counterMutex)
		fi;
		

		/*ASSERTION*/
		// check whether the car is travelling in the correct direction
		if :: isDirDownward  -> assert(DOWNWARD(no))
		   :: !isDirDownward -> assert(UPWARD(no))
		fi;

		/*LEAVE*/
		isDownward = DOWNWARD(no);
		P(counterMutex);
		counter = counter - 1;
		if :: counter == 0 ->
			V(counterMutex)
			V(alleyMutex)
			P(isFirstMutex)
			if :: isDownward -> 
			      	firstDownwardNo = 0
               		  :: !isDownward -> 
				firstUpwardNo = 0
			fi
            		   :: counter != 0 -> skip
		fi;
	od
		
}

init {
	atomic {
		isFirst = 1;
		isDirDownward = 0;
		downwardsMutex = 1;
		alleyMutex = 1;
		counterMutex = 1;
		isFirstMutex = 1;
        		dirMutex = 1;
		firstDownwardNo = 0;
		firstUpwardNo = 0;
		counter = 0
	}
	atomic {
		downward1 = run Car(1);
		downward2 = run Car(2);
		upward1 = run Car(3);
		upward2 = run Car(4)
	}
}