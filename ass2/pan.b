	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 8
		;
		now.counter = trpt->bup.ovals[7];
		now.critical = trpt->bup.ovals[6];
		isFirstMutex = trpt->bup.ovals[5];
		counterMutex = trpt->bup.ovals[4];
		now.alleyMutex = trpt->bup.ovals[3];
		now.downwardsMutex = trpt->bup.ovals[2];
		now.isDirDownward = trpt->bup.ovals[1];
		now.isFirst = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 8);
		goto R999;

	case 4: // STATE 13
		;
		upward2 = trpt->bup.ovals[3];
		delproc(0, now._nr_pr-1);
		upward1 = trpt->bup.ovals[2];
		delproc(0, now._nr_pr-1);
		downward2 = trpt->bup.ovals[1];
		delproc(0, now._nr_pr-1);
		downward1 = trpt->bup.ovals[0];
		delproc(0, now._nr_pr-1);
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 5: // STATE 15
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Car */

	case 6: // STATE 2
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 4
		;
		((P0 *)_this)->isOppositeDir = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 5
		;
	/* 0 */	((P0 *)_this)->isOppositeDir = trpt->bup.oval;
		;
		;
		goto R999;

	case 9: // STATE 6
		;
		now.isFirstDownwards = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 11: // STATE 8
		;
		now.isFirst = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 10
		;
		now.downwardsMutex = trpt->bup.oval;
		;
		goto R999;

	case 13: // STATE 12
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 14: // STATE 15
		;
		now.alleyMutex = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 18
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 20
		;
		now.downwardsMutex = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 18: // STATE 23
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 26
		;
		now.downwardsMutex = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 29
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 21: // STATE 31
		;
		now.downwardsMutex = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 23: // STATE 34
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 24: // STATE 37
		;
		now.alleyMutex = trpt->bup.oval;
		;
		goto R999;

	case 25: // STATE 40
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 26: // STATE 44
		;
		now.isDirDownward = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 45
		;
	/* 0 */	((P0 *)_this)->isOppositeDir = trpt->bup.oval;
		;
		;
		goto R999;

	case 28: // STATE 49
		;
		now.counter = trpt->bup.oval;
		;
		goto R999;

	case 29: // STATE 50
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 30: // STATE 53
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 31: // STATE 55
		;
		now.counter = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 33: // STATE 57
		;
		now.alleyMutex = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 35: // STATE 60
		;
		now.isFirst = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 38: // STATE 69
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 39: // STATE 74
		;
		p_restor(II);
		;
		;
		goto R999;
	}

