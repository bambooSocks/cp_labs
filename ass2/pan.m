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
	case 3: // STATE 1 - pr4:58 - [isFirst = 1] (0:13:7 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.ovals = grab_ints(7);
		(trpt+1)->bup.ovals[0] = ((int)now.isFirst);
		now.isFirst = 1;
#ifdef VAR_RANGES
		logval("isFirst", ((int)now.isFirst));
#endif
		;
		/* merge: isDirDownward = 0(13, 2, 13) */
		reached[1][2] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.isDirDownward);
		now.isDirDownward = 0;
#ifdef VAR_RANGES
		logval("isDirDownward", ((int)now.isDirDownward));
#endif
		;
		/* merge: downwardsMutex = 1(13, 3, 13) */
		reached[1][3] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.downwardsMutex);
		now.downwardsMutex = 1;
#ifdef VAR_RANGES
		logval("downwardsMutex", ((int)now.downwardsMutex));
#endif
		;
		/* merge: alleyMutex = 1(13, 4, 13) */
		reached[1][4] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.alleyMutex);
		now.alleyMutex = 1;
#ifdef VAR_RANGES
		logval("alleyMutex", ((int)now.alleyMutex));
#endif
		;
		/* merge: counterMutex = 1(13, 5, 13) */
		reached[1][5] = 1;
		(trpt+1)->bup.ovals[4] = ((int)now.counterMutex);
		now.counterMutex = 1;
#ifdef VAR_RANGES
		logval("counterMutex", ((int)now.counterMutex));
#endif
		;
		/* merge: isFirstMutex = 1(13, 6, 13) */
		reached[1][6] = 1;
		(trpt+1)->bup.ovals[5] = ((int)now.isFirstMutex);
		now.isFirstMutex = 1;
#ifdef VAR_RANGES
		logval("isFirstMutex", ((int)now.isFirstMutex));
#endif
		;
		/* merge: counter = 0(13, 7, 13) */
		reached[1][7] = 1;
		(trpt+1)->bup.ovals[6] = ((int)now.counter);
		now.counter = 0;
#ifdef VAR_RANGES
		logval("counter", ((int)now.counter));
#endif
		;
		_m = 3; goto P999; /* 6 */
	case 4: // STATE 9 - pr4:67 - [downward1 = run Car(1)] (0:14:4 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)downward1);
		downward1 = addproc(II, 1, 0, 1);
#ifdef VAR_RANGES
		logval("downward1", ((int)downward1));
#endif
		;
		/* merge: downward2 = run Car(2)(14, 10, 14) */
		reached[1][10] = 1;
		(trpt+1)->bup.ovals[1] = ((int)downward2);
		downward2 = addproc(II, 1, 0, 2);
#ifdef VAR_RANGES
		logval("downward2", ((int)downward2));
#endif
		;
		/* merge: upward1 = run Car(3)(14, 11, 14) */
		reached[1][11] = 1;
		(trpt+1)->bup.ovals[2] = ((int)upward1);
		upward1 = addproc(II, 1, 0, 3);
#ifdef VAR_RANGES
		logval("upward1", ((int)upward1));
#endif
		;
		/* merge: upward2 = run Car(4)(14, 12, 14) */
		reached[1][12] = 1;
		(trpt+1)->bup.ovals[3] = ((int)upward2);
		upward2 = addproc(II, 1, 0, 4);
#ifdef VAR_RANGES
		logval("upward2", ((int)upward2));
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 5: // STATE 14 - pr4:72 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][14] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Car */
	case 6: // STATE 1 - pr4:14 - [isOppositeDir = ((no<=2)!=isDirDownward)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->isOppositeDir);
		((P0 *)_this)->isOppositeDir = ((((int)((P0 *)_this)->no)<=2)!=((int)now.isDirDownward));
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
	case 8: // STATE 3 - pr4:15 - [((isFirstMutex>0))] (6:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!((((int)now.isFirstMutex)>0)))
			continue;
		/* merge: isFirstMutex = (isFirstMutex-1)(0, 4, 6) */
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)now.isFirstMutex);
		now.isFirstMutex = (((int)now.isFirstMutex)-1);
#ifdef VAR_RANGES
		logval("isFirstMutex", ((int)now.isFirstMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 9: // STATE 6 - pr4:16 - [isFirstDownwards = (isFirst&&(no<=2))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((int)now.isFirstDownwards);
		now.isFirstDownwards = (((int)now.isFirst)&&(((int)((P0 *)_this)->no)<=2));
#ifdef VAR_RANGES
		logval("isFirstDownwards", ((int)now.isFirstDownwards));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 7 - pr4:17 - [isFirstMutex = (isFirstMutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)now.isFirstMutex);
		now.isFirstMutex = (((int)now.isFirstMutex)+1);
#ifdef VAR_RANGES
		logval("isFirstMutex", ((int)now.isFirstMutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 9 - pr4:19 - [(isFirstDownwards)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (!(((int)now.isFirstDownwards)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 10 - pr4:20 - [((isFirstMutex>0))] (13:0:1 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		if (!((((int)now.isFirstMutex)>0)))
			continue;
		/* merge: isFirstMutex = (isFirstMutex-1)(0, 11, 13) */
		reached[0][11] = 1;
		(trpt+1)->bup.oval = ((int)now.isFirstMutex);
		now.isFirstMutex = (((int)now.isFirstMutex)-1);
#ifdef VAR_RANGES
		logval("isFirstMutex", ((int)now.isFirstMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 13: // STATE 13 - pr4:21 - [isFirst = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		(trpt+1)->bup.oval = ((int)now.isFirst);
		now.isFirst = 0;
#ifdef VAR_RANGES
		logval("isFirst", ((int)now.isFirst));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 14 - pr4:22 - [isFirstMutex = (isFirstMutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.oval = ((int)now.isFirstMutex);
		now.isFirstMutex = (((int)now.isFirstMutex)+1);
#ifdef VAR_RANGES
		logval("isFirstMutex", ((int)now.isFirstMutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 16 - pr4:24 - [((downwardsMutex>0))] (21:0:1 - 1)
		IfNotBlocked
		reached[0][16] = 1;
		if (!((((int)now.downwardsMutex)>0)))
			continue;
		/* merge: downwardsMutex = (downwardsMutex-1)(0, 17, 21) */
		reached[0][17] = 1;
		(trpt+1)->bup.oval = ((int)now.downwardsMutex);
		now.downwardsMutex = (((int)now.downwardsMutex)-1);
#ifdef VAR_RANGES
		logval("downwardsMutex", ((int)now.downwardsMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 16: // STATE 19 - pr4:25 - [((alleyMutex>0))] (23:0:1 - 1)
		IfNotBlocked
		reached[0][19] = 1;
		if (!((((int)now.alleyMutex)>0)))
			continue;
		/* merge: alleyMutex = (alleyMutex-1)(0, 20, 23) */
		reached[0][20] = 1;
		(trpt+1)->bup.oval = ((int)now.alleyMutex);
		now.alleyMutex = (((int)now.alleyMutex)-1);
#ifdef VAR_RANGES
		logval("alleyMutex", ((int)now.alleyMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 17: // STATE 22 - pr4:26 - [downwardsMutex = (downwardsMutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][22] = 1;
		(trpt+1)->bup.oval = ((int)now.downwardsMutex);
		now.downwardsMutex = (((int)now.downwardsMutex)+1);
#ifdef VAR_RANGES
		logval("downwardsMutex", ((int)now.downwardsMutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 24 - pr4:27 - [((!(isFirstDownwards)&&(no<=2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][24] = 1;
		if (!(( !(((int)now.isFirstDownwards))&&(((int)((P0 *)_this)->no)<=2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 25 - pr4:28 - [((downwardsMutex>0))] (29:0:1 - 1)
		IfNotBlocked
		reached[0][25] = 1;
		if (!((((int)now.downwardsMutex)>0)))
			continue;
		/* merge: downwardsMutex = (downwardsMutex-1)(0, 26, 29) */
		reached[0][26] = 1;
		(trpt+1)->bup.oval = ((int)now.downwardsMutex);
		now.downwardsMutex = (((int)now.downwardsMutex)-1);
#ifdef VAR_RANGES
		logval("downwardsMutex", ((int)now.downwardsMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 20: // STATE 28 - pr4:29 - [downwardsMutex = (downwardsMutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][28] = 1;
		(trpt+1)->bup.oval = ((int)now.downwardsMutex);
		now.downwardsMutex = (((int)now.downwardsMutex)+1);
#ifdef VAR_RANGES
		logval("downwardsMutex", ((int)now.downwardsMutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 30 - pr4:30 - [((no>=3))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][30] = 1;
		if (!((((int)((P0 *)_this)->no)>=3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 31 - pr4:30 - [((alleyMutex>0))] (36:0:1 - 1)
		IfNotBlocked
		reached[0][31] = 1;
		if (!((((int)now.alleyMutex)>0)))
			continue;
		/* merge: alleyMutex = (alleyMutex-1)(0, 32, 36) */
		reached[0][32] = 1;
		(trpt+1)->bup.oval = ((int)now.alleyMutex);
		now.alleyMutex = (((int)now.alleyMutex)-1);
#ifdef VAR_RANGES
		logval("alleyMutex", ((int)now.alleyMutex));
#endif
		;
		/* merge: .(goto)(0, 35, 36) */
		reached[0][35] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: // STATE 36 - pr4:32 - [isDirDownward = (no<=2)] (0:0:1 - 4)
		IfNotBlocked
		reached[0][36] = 1;
		(trpt+1)->bup.oval = ((int)now.isDirDownward);
		now.isDirDownward = (((int)((P0 *)_this)->no)<=2);
#ifdef VAR_RANGES
		logval("isDirDownward", ((int)now.isDirDownward));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 37 - pr4:33 - [(!(isOppositeDir))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][37] = 1;
		if (!( !(((int)((P0 *)_this)->isOppositeDir))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: isOppositeDir */  (trpt+1)->bup.oval = ((P0 *)_this)->isOppositeDir;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->isOppositeDir = 0;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 41 - pr4:35 - [((counterMutex>0))] (44:0:1 - 1)
		IfNotBlocked
		reached[0][41] = 1;
		if (!((((int)now.counterMutex)>0)))
			continue;
		/* merge: counterMutex = (counterMutex-1)(0, 42, 44) */
		reached[0][42] = 1;
		(trpt+1)->bup.oval = ((int)now.counterMutex);
		now.counterMutex = (((int)now.counterMutex)-1);
#ifdef VAR_RANGES
		logval("counterMutex", ((int)now.counterMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 26: // STATE 44 - pr4:36 - [counter = (counter+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][44] = 1;
		(trpt+1)->bup.oval = ((int)now.counter);
		now.counter = (((int)now.counter)+1);
#ifdef VAR_RANGES
		logval("counter", ((int)now.counter));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 45 - pr4:37 - [counterMutex = (counterMutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][45] = 1;
		(trpt+1)->bup.oval = ((int)now.counterMutex);
		now.counterMutex = (((int)now.counterMutex)+1);
#ifdef VAR_RANGES
		logval("counterMutex", ((int)now.counterMutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 47 - pr4:39 - [((counterMutex>0))] (50:0:1 - 1)
		IfNotBlocked
		reached[0][47] = 1;
		if (!((((int)now.counterMutex)>0)))
			continue;
		/* merge: counterMutex = (counterMutex-1)(0, 48, 50) */
		reached[0][48] = 1;
		(trpt+1)->bup.oval = ((int)now.counterMutex);
		now.counterMutex = (((int)now.counterMutex)-1);
#ifdef VAR_RANGES
		logval("counterMutex", ((int)now.counterMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 29: // STATE 50 - pr4:40 - [counter = (counter-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][50] = 1;
		(trpt+1)->bup.oval = ((int)now.counter);
		now.counter = (((int)now.counter)-1);
#ifdef VAR_RANGES
		logval("counter", ((int)now.counter));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 51 - pr4:41 - [((counter==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][51] = 1;
		if (!((((int)now.counter)==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 52 - pr4:42 - [alleyMutex = (alleyMutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][52] = 1;
		(trpt+1)->bup.oval = ((int)now.alleyMutex);
		now.alleyMutex = (((int)now.alleyMutex)+1);
#ifdef VAR_RANGES
		logval("alleyMutex", ((int)now.alleyMutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 54 - pr4:43 - [((no<=2))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][54] = 1;
		if (!((((int)((P0 *)_this)->no)<=2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 55 - pr4:44 - [((isFirstMutex>0))] (58:0:1 - 1)
		IfNotBlocked
		reached[0][55] = 1;
		if (!((((int)now.isFirstMutex)>0)))
			continue;
		/* merge: isFirstMutex = (isFirstMutex-1)(0, 56, 58) */
		reached[0][56] = 1;
		(trpt+1)->bup.oval = ((int)now.isFirstMutex);
		now.isFirstMutex = (((int)now.isFirstMutex)-1);
#ifdef VAR_RANGES
		logval("isFirstMutex", ((int)now.isFirstMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 34: // STATE 58 - pr4:45 - [isFirst = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][58] = 1;
		(trpt+1)->bup.oval = ((int)now.isFirst);
		now.isFirst = 1;
#ifdef VAR_RANGES
		logval("isFirst", ((int)now.isFirst));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 59 - pr4:46 - [isFirstMutex = (isFirstMutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][59] = 1;
		(trpt+1)->bup.oval = ((int)now.isFirstMutex);
		now.isFirstMutex = (((int)now.isFirstMutex)+1);
#ifdef VAR_RANGES
		logval("isFirstMutex", ((int)now.isFirstMutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 61 - pr4:47 - [((no>=3))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][61] = 1;
		if (!((((int)((P0 *)_this)->no)>=3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 65 - pr4:49 - [((counter!=0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][65] = 1;
		if (!((((int)now.counter)!=0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 69 - pr4:51 - [counterMutex = (counterMutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][69] = 1;
		(trpt+1)->bup.oval = ((int)now.counterMutex);
		now.counterMutex = (((int)now.counterMutex)+1);
#ifdef VAR_RANGES
		logval("counterMutex", ((int)now.counterMutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 74 - pr4:53 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][74] = 1;
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

