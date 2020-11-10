#define P(X) atomic{ X > 0 -> X-- }
#define V(X) atomic{ X++ }
#define DOWNWARD(X) ( X <= 2 )
#define UPWARD(X) ( X >= 3 )

pid downward1, downward2, upward1, upward2;
byte downwardsMutex, alleyMutex, counterMutex, isFirstMutex, counter, critical;
bool isDirDownward, isFirst, isFirstDownwards;

proctype Car(byte no) {
	do :: 	
		/*ENTER*/
        P(critical);
		bool isOppositeDir = (DOWNWARD(no) != isDirDownward);
		if :: isOppositeDir -> 
			isFirstDownwards = (isFirst && DOWNWARD(no));
			if 
			:: isFirstDownwards ->
				isFirst = 0;

				P(downwardsMutex);

                V(critical);
				P(alleyMutex);
                P(critical);
				V(downwardsMutex)
			:: !isFirstDownwards && DOWNWARD(no) ->
                V(critical);
				P(downwardsMutex);
                P(critical);
				V(downwardsMutex)
			:: UPWARD(no) -> 
                V(critical);
                P(alleyMutex);
                P(critical);
        
			fi;
			isDirDownward = DOWNWARD(no)
            :: !isOppositeDir -> skip
		fi;
		counter = counter + 1;
        V(critical);

        /*ASSERTION*/
        // check whether the car is travelling in the correct direction
        if :: isDirDownward  -> assert(DOWNWARD(no))
           :: !isDirDownward -> assert(UPWARD(no))
        fi

		/*LEAVE*/
        P(critical);
		counter = counter - 1;
		if :: counter == 0 ->
			V(alleyMutex);
			if :: DOWNWARD(no) -> isFirst = 1
               :: UPWARD(no) -> skip
			fi
            :: counter != 0 -> skip
		fi
        V(critical);
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