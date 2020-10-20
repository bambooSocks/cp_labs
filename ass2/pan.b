	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 2
		;
		now.dir = trpt->bup.ovals[1];
		now.isFirst = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 4: // STATE 7
		;
		down2 = trpt->bup.ovals[3];
		delproc(0, now._nr_pr-1);
		down1 = trpt->bup.ovals[2];
		delproc(0, now._nr_pr-1);
		up2 = trpt->bup.ovals[1];
		delproc(0, now._nr_pr-1);
		up1 = trpt->bup.ovals[0];
		delproc(0, now._nr_pr-1);
		;
		ungrab_ints(trpt->bup.ovals, 4);
		goto R999;

	case 5: // STATE 9
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

	case 8: // STATE 3
		;
		now.isFirstDownwards = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 10: // STATE 6
		;
		now.isFirst = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 9
		;
		now.downwardsMutex = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 12
		;
		now.alleyMutex = trpt->bup.oval;
		;
		goto R999;

	case 13: // STATE 14
		;
		now.downwardsMutex = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 15: // STATE 18
		;
		now.downwardsMutex = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 20
		;
		now.downwardsMutex = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 18: // STATE 24
		;
		now.alleyMutex = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 28
		;
		now.dir = trpt->bup.oval;
		;
		goto R999;

	case 20: // STATE 32
		;
		now.counterMutex = trpt->bup.oval;
		;
		goto R999;

	case 21: // STATE 34
		;
		now.counter = trpt->bup.oval;
		;
		goto R999;

	case 22: // STATE 35
		;
		now.counterMutex = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 40
		;
		p_restor(II);
		;
		;
		goto R999;
	}

