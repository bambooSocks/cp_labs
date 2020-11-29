#define P(X) atomic{ X > 0 -> X-- }
#define V(X) atomic{ X++ }
#define DOWARD(X) ( X <= 2)
#define UPWARD(X) ( X >= 3 )

pid upward1, upward2, downward1, downward2;
byte counterMutex, upwardCars, downwardCars;
int i;
byte carSem[4];
bool carSemValueBelow0[4];

proctype Car(byte no) {
	do::	
	/*ENTER*/
		P(counterMutex);
		do
		:: ((DOWARD(no) && upwardCars!=0) || (UPWARD(no) && downwardCars!=0)) ->
			carSemValueBelow0[no-1] = true;
           		 	V(counterMutex);  
           			P(carSem[no-1]);
            			P(counterMutex)
		:: else -> break
		od;
		if
		::DOWARD(no)-> downwardCars++
		::UPWARD(no)-> upwardCars++
		fi;
		V(counterMutex);

		/*ASSERTION*/
		if
		:: DOWARD(no) -> assert(upwardCars == 0)
		:: UPWARD(no) -> assert(downwardCars == 0)
		fi;

		/*leave alley*/
		P(counterMutex);
		if
		:: DOWARD(no) -> downwardCars--
		:: UPWARD(no) -> upwardCars--
		fi;
		if
		:: ((DOWARD(no) && downwardCars == 0) || (UPWARD(no) && upwardCars == 0)) ->
		i = 0;
			do
			::  i < 4 ->
		    		if
		    		::carSemValueBelow0[i] -> 
					carSemValueBelow0[i] = false
					V(carSem[i])
		    		:: else -> skip
		    		fi;
		    	i++;
			:: else -> break
			od;
		::  else -> skip
		fi;
		V(counterMutex)
	od
}

init {
	atomic {
		counterMutex = 1;
		downwardCars = 0;
		upwardCars = 0;
		i = 0;
		do
		::  i < 4 ->
		    carSem[i] = 0;
		    carSemValueBelow0[i] = false;
		    i++;
		::  else -> break
		od;
		downward1 = run Car(1);
		downward2 = run Car(2);
		upward1 = run Car(3);
		upward2 = run Car(4)
    }
}