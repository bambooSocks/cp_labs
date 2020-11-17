#define P(X) atomic{ X > 0 -> X-- }
#define V(X) atomic{ X++ }
#define DOWNWARD(X) ( X <= 2 )
#define UPWARD(X) ( X >= 3 )

pid downward1, downward2, upward1, upward2;
byte downwardsMutex, alleyMutex, counterMutex, isFirstMutex, counter, critical;
bool isDirDownward, isFirst;

proctype Car(byte no) {
	do :: 	
		/*ENTER*/
		bool isDownward = DOWNWARD(no);
		bool isOppositeDir = (isDownward != isDirDownward);
		if :: isOppositeDir -> 
			P(isFirstMutex);
			bool isFirstDownwards = (isFirst && isDownward);
			if :: isFirstDownwards -> isFirst = 0 
			   :: !isFirstDownwards -> skip
			fi;
			V(isFirstMutex);

			if :: isFirstDownwards ->
				P(downwardsMutex);
				P(alleyMutex);
				V(downwardsMutex)
			:: !isFirstDownwards && isDownward ->
				P(downwardsMutex);
				V(downwardsMutex)
			:: !isFirstDownwards && !isDownward -> 
                			P(alleyMutex)
			fi;
			isDirDownward = isDownward
            		   :: !isOppositeDir -> skip
		fi;
		P(counterMutex);
		counter = counter + 1;
		V(counterMutex);

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
			V(alleyMutex);
			if :: isDownward -> 
				P(isFirstMutex);
				isFirst = 1;
				V(isFirstMutex)
               		  :: !isDownward -> skip
			fi
            		   :: counter != 0 -> skip
		fi;
		V(counterMutex);
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
        critical = 1;
		counter = 0
	}
	atomic {
		downward1 = run Car(1);
		downward2 = run Car(2);
		upward1 = run Car(3);
		upward2 = run Car(4)
	}
}