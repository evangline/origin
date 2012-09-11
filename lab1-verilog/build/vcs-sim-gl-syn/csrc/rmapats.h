/* VCS. Copyright (c) 1991-2010 by Synopsys Inc. */

#ifndef __DO_RMAHDR_
#define __DO_RMAHDR_

typedef unsigned int U;
typedef union { double dummy; struct { U vhighclock; U vclock;} clock;} clock_struct;

typedef struct eblk {
	struct eblk *peblkFlink;
	int (*e)();
	char *ip;
	U t;
	struct eblk *peblkPrv;
} EBLK;

struct futq {
	struct futq *pfutqNext;
	struct futq *pfutqPrev;
	EBLK *peblkHead;
	EBLK *peblkTail;
	U t;
};
struct sched_table {
	struct futq *tfutq;
	struct futq sfutq;
	struct hash_bucket *nextb;
};
struct dummyq_struct {
	clock_struct cs;
	EBLK *tail_z;
	EBLK *next_event;
	struct futq *pfutqHead,*pfutqLastEntry;
	struct sched_table *hashtab;
	struct millenium *pmilleniumHead;
	EBLK *head_zero;
	EBLK *head_zero_user;
	EBLK *tail_zero_user;
	EBLK *head_flop;
	EBLK *tail_flop;
	EBLK *head_ca;
	EBLK *tail_ca;
	EBLK *head_delta;
	EBLK *tail_delta;
	EBLK *semilerTr;
	EBLK *semilerTC;
	EBLK *semilerTC1;
};
typedef struct {U c, d;} vec32;
typedef struct {int (*pibf)(); char* pcode;} RmaIbfPcode;
typedef struct {int (*pibf)(); char* ip;} RmaIbfIp;
typedef struct {
	EBLK eblk;
	void* ptail;
	unsigned char s, pv;
} RmaTransEventHdr;
typedef struct TableAssign_ {
    struct TableAssign_* pnext;
    U flags;
    void* ptable;
    void* poutput;
} TableAssign;

typedef struct TableAssignList_ {
    U flags;
    TableAssign* ptail;
    struct TableAssignList_* paddr;
    TableAssign arr[1];
} TableAssignList;
#endif
