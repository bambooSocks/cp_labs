	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 7
		;
		now.counter = trpt->bup.ovals[6];
		now.isFirstMutex = trpt->bup.ovals[5];
		now.counterMutex = trpt->bup.ovals[4];
		now.alleyMutex = trpt->bup.ovals[3];
		now.downwardsMutex = trpt->bup.ovals[2];
		now.isDirDownward = trpt->bup.ovals[1];
		now.isFirst = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 7);
		goto R999;

	case 4: // STATE 12
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

	case 5: // STATE 14
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Car */

	case 6: // STATE 1
		;
		((P0 *)_this)->isOppositeDir = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 2
		;
	/* 0 */	((P0 *)_this)->isOppositeDir = trpt->bup.oval;
		;
		;
		goto R999;

	case 8: // STATE 4
		;
		now.isFirstMutex = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 6
		;
		now.isFirstDownwards = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 7
		;
		now.isFirstMutex = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 12: // STATE 11
		;
		now.isFirstMutex = trpt->bup.oval;
		;
		goto R999;

	case 13: // STATE 13
		;
		now.isFirst = trpt->bup.oval;
		;
		goto R999;

	case 14: // STATE 14
		;
		now.isFirstMutex = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 17
		;
		now.downwardsMutex = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 20
		;
		now.alleyMutex = trpt->bup.oval;
		;
		goto R999;

	case 17: // STATE 22
		;
		now.downwardsMutex = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 19: // STATE 26
		;
		now.downwardsMutex = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 28
		;
		now.downwardsMutex = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 22: // STATE 32
		;
		now.alleyMutex = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 36
		;
		now.isDirDownward = trpt->bup.oval;
		;
		goto R999;

	case 24: // STATE 37
		;
	/* 0 */	((P0 *)_this)->isOppositeDir = trpt->bup.oval;
		;
		;
		goto R999;

	case 25: // STATE 42
		;
		now.counterMutex = trpt->bup.oval;
		;
		goto R999;

	case 26: // STATE 44
		;
		now.counter = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 45
		;
		now.counterMutex = trpt->bup.oval;
		;
		goto R999;

	case 28: // STATE 48
		;
		now.counterMutex = trpt->bup.oval;
		;
		goto R999;

	case 29: // STATE 50
		;
		now.counter = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 31: // STATE 52
		;
		now.alleyMutex = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 33: // STATE 56
		;
		now.isFirstMutex = trpt->bup.oval;
		;
		goto R999;

	case 34: // STATE 58
		;
		now.isFirst = trpt->bup.oval;
		;
		goto R999;

	case 35: // STATE 59
		;
		now.isFirstMutex = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 38: // STATE 69
		;
		now.counterMutex = trpt->bup.oval;
		;
		goto R999;

	case 39: // STATE 74
		;
		p_restor(II);
		;
		;
		goto R999;
	}

