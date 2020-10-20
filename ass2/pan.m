#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - pr4:38 - [isFirst = 1] (0:8:2 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.isFirst);
		now.isFirst = 1;
#ifdef VAR_RANGES
		logval("isFirst", ((int)now.isFirst));
#endif
		;
		/* merge: dir = 0(8, 2, 8) */
		reached[1][2] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.dir);
		now.dir = 0;
#ifdef VAR_RANGES
		logval("dir", ((int)now.dir));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 4: // STATE 4 - pr4:42 - [up1 = run Car(1)] (0:9:4 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)up1);
		up1 = addproc(II, 1, 0, 1);
#ifdef VAR_RANGES
		logval("up1", ((int)up1));
#endif
		;
		/* merge: up2 = run Car(2)(9, 5, 9) */
		reached[1][5] = 1;
		(trpt+1)->bup.ovals[1] = ((int)up2);
		up2 = addproc(II, 1, 0, 2);
#ifdef VAR_RANGES
		logval("up2", ((int)up2));
#endif
		;
		/* merge: down1 = run Car(3)(9, 6, 9) */
		reached[1][6] = 1;
		(trpt+1)->bup.ovals[2] = ((int)down1);
		down1 = addproc(II, 1, 0, 3);
#ifdef VAR_RANGES
		logval("down1", ((int)down1));
#endif
		;
		/* merge: down2 = run Car(4)(9, 7, 9) */
		reached[1][7] = 1;
		(trpt+1)->bup.ovals[3] = ((int)down2);
		down2 = addproc(II, 1, 0, 4);
#ifdef VAR_RANGES
		logval("down2", ((int)down2));
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 5: // STATE 9 - pr4:47 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Car */
	case 6: // STATE 1 - pr4:14 - [isOppositeDir = ((no<5)!=dir)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->isOppositeDir);
		((P0 *)_this)->isOppositeDir = ((((int)((P0 *)_this)->no)<5)!=((int)now.dir));
#ifdef VAR_RANGES
		logval("Car:isOppositeDir", ((int)((P0 *)_this)->isOppositeDir));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 2 - pr4:14 - [(isOppositeDir)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!(((int)((P0 *)_this)->isOppositeDir)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: isOppositeDir */  (trpt+1)->bup.oval = ((P0 *)_this)->isOppositeDir;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->isOppositeDir = 0;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 3 - pr4:15 - [isFirstDownwards = (isFirst&&(no<5))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.oval = ((int)now.isFirstDownwards);
		now.isFirstDownwards = (((int)now.isFirst)&&(((int)((P0 *)_this)->no)<5));
#ifdef VAR_RANGES
		logval("isFirstDownwards", ((int)now.isFirstDownwards));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 5 - pr4:17 - [(isFirstDownwards)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!(((int)now.isFirstDownwards)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 6 - pr4:18 - [isFirst = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((int)now.isFirst);
		now.isFirst = 0;
#ifdef VAR_RANGES
		logval("isFirst", ((int)now.isFirst));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 8 - pr4:19 - [((downwardsMutex>0))] (13:0:1 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (!((((int)now.downwardsMutex)>0)))
			continue;
		/* merge: downwardsMutex = (downwardsMutex-1)(0, 9, 13) */
		reached[0][9] = 1;
		(trpt+1)->bup.oval = ((int)now.downwardsMutex);
		now.downwardsMutex = (((int)now.downwardsMutex)-1);
#ifdef VAR_RANGES
		logval("downwardsMutex", ((int)now.downwardsMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 12: // STATE 11 - pr4:20 - [((alleyMutex>0))] (15:0:1 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		if (!((((int)now.alleyMutex)>0)))
			continue;
		/* merge: alleyMutex = (alleyMutex-1)(0, 12, 15) */
		reached[0][12] = 1;
		(trpt+1)->bup.oval = ((int)now.alleyMutex);
		now.alleyMutex = (((int)now.alleyMutex)-1);
#ifdef VAR_RANGES
		logval("alleyMutex", ((int)now.alleyMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 13: // STATE 14 - pr4:21 - [downwardsMutex = (downwardsMutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.oval = ((int)now.downwardsMutex);
		now.downwardsMutex = (((int)now.downwardsMutex)+1);
#ifdef VAR_RANGES
		logval("downwardsMutex", ((int)now.downwardsMutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 16 - pr4:22 - [((no<5))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		if (!((((int)((P0 *)_this)->no)<5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 17 - pr4:23 - [((downwardsMutex>0))] (21:0:1 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		if (!((((int)now.downwardsMutex)>0)))
			continue;
		/* merge: downwardsMutex = (downwardsMutex-1)(0, 18, 21) */
		reached[0][18] = 1;
		(trpt+1)->bup.oval = ((int)now.downwardsMutex);
		now.downwardsMutex = (((int)now.downwardsMutex)-1);
#ifdef VAR_RANGES
		logval("downwardsMutex", ((int)now.downwardsMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 16: // STATE 20 - pr4:24 - [downwardsMutex = (downwardsMutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		(trpt+1)->bup.oval = ((int)now.downwardsMutex);
		now.downwardsMutex = (((int)now.downwardsMutex)+1);
#ifdef VAR_RANGES
		logval("downwardsMutex", ((int)now.downwardsMutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 22 - pr4:25 - [((no>4))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][22] = 1;
		if (!((((int)((P0 *)_this)->no)>4)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 23 - pr4:25 - [((alleyMutex>0))] (28:0:1 - 1)
		IfNotBlocked
		reached[0][23] = 1;
		if (!((((int)now.alleyMutex)>0)))
			continue;
		/* merge: alleyMutex = (alleyMutex-1)(0, 24, 28) */
		reached[0][24] = 1;
		(trpt+1)->bup.oval = ((int)now.alleyMutex);
		now.alleyMutex = (((int)now.alleyMutex)-1);
#ifdef VAR_RANGES
		logval("alleyMutex", ((int)now.alleyMutex));
#endif
		;
		/* merge: .(goto)(0, 27, 28) */
		reached[0][27] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 19: // STATE 28 - pr4:27 - [dir = (no<5)] (0:0:1 - 4)
		IfNotBlocked
		reached[0][28] = 1;
		(trpt+1)->bup.oval = ((int)now.dir);
		now.dir = (((int)((P0 *)_this)->no)<5);
#ifdef VAR_RANGES
		logval("dir", ((int)now.dir));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 31 - pr4:29 - [((counterMutex>0))] (34:0:1 - 1)
		IfNotBlocked
		reached[0][31] = 1;
		if (!((((int)now.counterMutex)>0)))
			continue;
		/* merge: counterMutex = (counterMutex-1)(0, 32, 34) */
		reached[0][32] = 1;
		(trpt+1)->bup.oval = ((int)now.counterMutex);
		now.counterMutex = (((int)now.counterMutex)-1);
#ifdef VAR_RANGES
		logval("counterMutex", ((int)now.counterMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 21: // STATE 34 - pr4:30 - [counter = (counter+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][34] = 1;
		(trpt+1)->bup.oval = ((int)now.counter);
		now.counter = (((int)now.counter)+1);
#ifdef VAR_RANGES
		logval("counter", ((int)now.counter));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 35 - pr4:31 - [counterMutex = (counterMutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][35] = 1;
		(trpt+1)->bup.oval = ((int)now.counterMutex);
		now.counterMutex = (((int)now.counterMutex)+1);
#ifdef VAR_RANGES
		logval("counterMutex", ((int)now.counterMutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 40 - pr4:33 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][40] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

