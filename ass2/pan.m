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
	case 3: // STATE 1 - pr4:67 - [isFirst = 1] (0:14:8 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.ovals = grab_ints(8);
		(trpt+1)->bup.ovals[0] = ((int)now.isFirst);
		now.isFirst = 1;
#ifdef VAR_RANGES
		logval("isFirst", ((int)now.isFirst));
#endif
		;
		/* merge: isDirDownward = 0(14, 2, 14) */
		reached[1][2] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.isDirDownward);
		now.isDirDownward = 0;
#ifdef VAR_RANGES
		logval("isDirDownward", ((int)now.isDirDownward));
#endif
		;
		/* merge: downwardsMutex = 1(14, 3, 14) */
		reached[1][3] = 1;
		(trpt+1)->bup.ovals[2] = ((int)now.downwardsMutex);
		now.downwardsMutex = 1;
#ifdef VAR_RANGES
		logval("downwardsMutex", ((int)now.downwardsMutex));
#endif
		;
		/* merge: alleyMutex = 1(14, 4, 14) */
		reached[1][4] = 1;
		(trpt+1)->bup.ovals[3] = ((int)now.alleyMutex);
		now.alleyMutex = 1;
#ifdef VAR_RANGES
		logval("alleyMutex", ((int)now.alleyMutex));
#endif
		;
		/* merge: counterMutex = 1(14, 5, 14) */
		reached[1][5] = 1;
		(trpt+1)->bup.ovals[4] = ((int)counterMutex);
		counterMutex = 1;
#ifdef VAR_RANGES
		logval("counterMutex", ((int)counterMutex));
#endif
		;
		/* merge: isFirstMutex = 1(14, 6, 14) */
		reached[1][6] = 1;
		(trpt+1)->bup.ovals[5] = ((int)isFirstMutex);
		isFirstMutex = 1;
#ifdef VAR_RANGES
		logval("isFirstMutex", ((int)isFirstMutex));
#endif
		;
		/* merge: critical = 1(14, 7, 14) */
		reached[1][7] = 1;
		(trpt+1)->bup.ovals[6] = ((int)now.critical);
		now.critical = 1;
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		/* merge: counter = 0(14, 8, 14) */
		reached[1][8] = 1;
		(trpt+1)->bup.ovals[7] = ((int)now.counter);
		now.counter = 0;
#ifdef VAR_RANGES
		logval("counter", ((int)now.counter));
#endif
		;
		_m = 3; goto P999; /* 7 */
	case 4: // STATE 10 - pr4:77 - [downward1 = run Car(1)] (0:15:4 - 1)
		IfNotBlocked
		reached[1][10] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = ((int)downward1);
		downward1 = addproc(II, 1, 0, 1);
#ifdef VAR_RANGES
		logval("downward1", ((int)downward1));
#endif
		;
		/* merge: downward2 = run Car(2)(15, 11, 15) */
		reached[1][11] = 1;
		(trpt+1)->bup.ovals[1] = ((int)downward2);
		downward2 = addproc(II, 1, 0, 2);
#ifdef VAR_RANGES
		logval("downward2", ((int)downward2));
#endif
		;
		/* merge: upward1 = run Car(3)(15, 12, 15) */
		reached[1][12] = 1;
		(trpt+1)->bup.ovals[2] = ((int)upward1);
		upward1 = addproc(II, 1, 0, 3);
#ifdef VAR_RANGES
		logval("upward1", ((int)upward1));
#endif
		;
		/* merge: upward2 = run Car(4)(15, 13, 15) */
		reached[1][13] = 1;
		(trpt+1)->bup.ovals[3] = ((int)upward2);
		upward2 = addproc(II, 1, 0, 4);
#ifdef VAR_RANGES
		logval("upward2", ((int)upward2));
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 5: // STATE 15 - pr4:82 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][15] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Car */
	case 6: // STATE 1 - pr4:13 - [((critical>0))] (4:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((int)now.critical)>0)))
			continue;
		/* merge: critical = (critical-1)(0, 2, 4) */
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.critical);
		now.critical = (((int)now.critical)-1);
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 7: // STATE 4 - pr4:15 - [isOppositeDir = ((no<=2)!=isDirDownward)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->isOppositeDir);
		((P0 *)_this)->isOppositeDir = ((((int)((P0 *)_this)->no)<=2)!=((int)now.isDirDownward));
#ifdef VAR_RANGES
		logval("Car:isOppositeDir", ((int)((P0 *)_this)->isOppositeDir));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 5 - pr4:15 - [(isOppositeDir)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!(((int)((P0 *)_this)->isOppositeDir)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: isOppositeDir */  (trpt+1)->bup.oval = ((P0 *)_this)->isOppositeDir;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->isOppositeDir = 0;
		_m = 3; goto P999; /* 0 */
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
	case 10: // STATE 7 - pr4:18 - [(isFirstDownwards)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		if (!(((int)now.isFirstDownwards)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 8 - pr4:19 - [isFirst = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		(trpt+1)->bup.oval = ((int)now.isFirst);
		now.isFirst = 0;
#ifdef VAR_RANGES
		logval("isFirst", ((int)now.isFirst));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 9 - pr4:21 - [((downwardsMutex>0))] (13:0:1 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (!((((int)now.downwardsMutex)>0)))
			continue;
		/* merge: downwardsMutex = (downwardsMutex-1)(0, 10, 13) */
		reached[0][10] = 1;
		(trpt+1)->bup.oval = ((int)now.downwardsMutex);
		now.downwardsMutex = (((int)now.downwardsMutex)-1);
#ifdef VAR_RANGES
		logval("downwardsMutex", ((int)now.downwardsMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 13: // STATE 12 - pr4:23 - [critical = (critical+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		(trpt+1)->bup.oval = ((int)now.critical);
		now.critical = (((int)now.critical)+1);
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 14 - pr4:24 - [((alleyMutex>0))] (19:0:1 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		if (!((((int)now.alleyMutex)>0)))
			continue;
		/* merge: alleyMutex = (alleyMutex-1)(0, 15, 19) */
		reached[0][15] = 1;
		(trpt+1)->bup.oval = ((int)now.alleyMutex);
		now.alleyMutex = (((int)now.alleyMutex)-1);
#ifdef VAR_RANGES
		logval("alleyMutex", ((int)now.alleyMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 15: // STATE 17 - pr4:25 - [((critical>0))] (21:0:1 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		if (!((((int)now.critical)>0)))
			continue;
		/* merge: critical = (critical-1)(0, 18, 21) */
		reached[0][18] = 1;
		(trpt+1)->bup.oval = ((int)now.critical);
		now.critical = (((int)now.critical)-1);
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 16: // STATE 20 - pr4:26 - [downwardsMutex = (downwardsMutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		(trpt+1)->bup.oval = ((int)now.downwardsMutex);
		now.downwardsMutex = (((int)now.downwardsMutex)+1);
#ifdef VAR_RANGES
		logval("downwardsMutex", ((int)now.downwardsMutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 22 - pr4:27 - [((!(isFirstDownwards)&&(no<=2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][22] = 1;
		if (!(( !(((int)now.isFirstDownwards))&&(((int)((P0 *)_this)->no)<=2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 23 - pr4:28 - [critical = (critical+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][23] = 1;
		(trpt+1)->bup.oval = ((int)now.critical);
		now.critical = (((int)now.critical)+1);
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 25 - pr4:29 - [((downwardsMutex>0))] (30:0:1 - 1)
		IfNotBlocked
		reached[0][25] = 1;
		if (!((((int)now.downwardsMutex)>0)))
			continue;
		/* merge: downwardsMutex = (downwardsMutex-1)(0, 26, 30) */
		reached[0][26] = 1;
		(trpt+1)->bup.oval = ((int)now.downwardsMutex);
		now.downwardsMutex = (((int)now.downwardsMutex)-1);
#ifdef VAR_RANGES
		logval("downwardsMutex", ((int)now.downwardsMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 20: // STATE 28 - pr4:30 - [((critical>0))] (32:0:1 - 1)
		IfNotBlocked
		reached[0][28] = 1;
		if (!((((int)now.critical)>0)))
			continue;
		/* merge: critical = (critical-1)(0, 29, 32) */
		reached[0][29] = 1;
		(trpt+1)->bup.oval = ((int)now.critical);
		now.critical = (((int)now.critical)-1);
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 21: // STATE 31 - pr4:31 - [downwardsMutex = (downwardsMutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][31] = 1;
		(trpt+1)->bup.oval = ((int)now.downwardsMutex);
		now.downwardsMutex = (((int)now.downwardsMutex)+1);
#ifdef VAR_RANGES
		logval("downwardsMutex", ((int)now.downwardsMutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 33 - pr4:32 - [((no>=3))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][33] = 1;
		if (!((((int)((P0 *)_this)->no)>=3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 23: // STATE 34 - pr4:33 - [critical = (critical+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][34] = 1;
		(trpt+1)->bup.oval = ((int)now.critical);
		now.critical = (((int)now.critical)+1);
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 36 - pr4:34 - [((alleyMutex>0))] (41:0:1 - 1)
		IfNotBlocked
		reached[0][36] = 1;
		if (!((((int)now.alleyMutex)>0)))
			continue;
		/* merge: alleyMutex = (alleyMutex-1)(0, 37, 41) */
		reached[0][37] = 1;
		(trpt+1)->bup.oval = ((int)now.alleyMutex);
		now.alleyMutex = (((int)now.alleyMutex)-1);
#ifdef VAR_RANGES
		logval("alleyMutex", ((int)now.alleyMutex));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 25: // STATE 39 - pr4:35 - [((critical>0))] (44:0:1 - 1)
		IfNotBlocked
		reached[0][39] = 1;
		if (!((((int)now.critical)>0)))
			continue;
		/* merge: critical = (critical-1)(0, 40, 44) */
		reached[0][40] = 1;
		(trpt+1)->bup.oval = ((int)now.critical);
		now.critical = (((int)now.critical)-1);
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		/* merge: .(goto)(0, 43, 44) */
		reached[0][43] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 26: // STATE 44 - pr4:38 - [isDirDownward = (no<=2)] (0:0:1 - 4)
		IfNotBlocked
		reached[0][44] = 1;
		(trpt+1)->bup.oval = ((int)now.isDirDownward);
		now.isDirDownward = (((int)((P0 *)_this)->no)<=2);
#ifdef VAR_RANGES
		logval("isDirDownward", ((int)now.isDirDownward));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 45 - pr4:39 - [(!(isOppositeDir))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][45] = 1;
		if (!( !(((int)((P0 *)_this)->isOppositeDir))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: isOppositeDir */  (trpt+1)->bup.oval = ((P0 *)_this)->isOppositeDir;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->isOppositeDir = 0;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 49 - pr4:41 - [counter = (counter+1)] (0:0:1 - 3)
		IfNotBlocked
		reached[0][49] = 1;
		(trpt+1)->bup.oval = ((int)now.counter);
		now.counter = (((int)now.counter)+1);
#ifdef VAR_RANGES
		logval("counter", ((int)now.counter));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 50 - pr4:42 - [critical = (critical+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][50] = 1;
		(trpt+1)->bup.oval = ((int)now.critical);
		now.critical = (((int)now.critical)+1);
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 52 - pr4:51 - [((critical>0))] (55:0:1 - 1)
		IfNotBlocked
		reached[0][52] = 1;
		if (!((((int)now.critical)>0)))
			continue;
		/* merge: critical = (critical-1)(0, 53, 55) */
		reached[0][53] = 1;
		(trpt+1)->bup.oval = ((int)now.critical);
		now.critical = (((int)now.critical)-1);
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 31: // STATE 55 - pr4:52 - [counter = (counter-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][55] = 1;
		(trpt+1)->bup.oval = ((int)now.counter);
		now.counter = (((int)now.counter)-1);
#ifdef VAR_RANGES
		logval("counter", ((int)now.counter));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: // STATE 56 - pr4:53 - [((counter==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][56] = 1;
		if (!((((int)now.counter)==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 57 - pr4:54 - [alleyMutex = (alleyMutex+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][57] = 1;
		(trpt+1)->bup.oval = ((int)now.alleyMutex);
		now.alleyMutex = (((int)now.alleyMutex)+1);
#ifdef VAR_RANGES
		logval("alleyMutex", ((int)now.alleyMutex));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 59 - pr4:55 - [((no<=2))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][59] = 1;
		if (!((((int)((P0 *)_this)->no)<=2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 60 - pr4:55 - [isFirst = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][60] = 1;
		(trpt+1)->bup.oval = ((int)now.isFirst);
		now.isFirst = 1;
#ifdef VAR_RANGES
		logval("isFirst", ((int)now.isFirst));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 61 - pr4:56 - [((no>=3))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][61] = 1;
		if (!((((int)((P0 *)_this)->no)>=3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 65 - pr4:58 - [((counter!=0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][65] = 1;
		if (!((((int)now.counter)!=0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 69 - pr4:60 - [critical = (critical+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][69] = 1;
		(trpt+1)->bup.oval = ((int)now.critical);
		now.critical = (((int)now.critical)+1);
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 74 - pr4:62 - [-end-] (0:0:0 - 1)
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

